package org.gluu.agama.pw.jans;


import io.jans.as.common.model.common.User;
import io.jans.as.server.service.UserService;
import io.jans.service.cdi.util.CdiUtil;
import io.jans.orm.exception.operation.EntryNotFoundException;
import io.jans.service.MailService;
import io.jans.model.SmtpConfiguration;
import io.jans.util.StringHelper;
import io.jans.agama.engine.script.LogUtils;
import io.jans.as.common.service.common.ConfigurationService;
import java.security.SecureRandom;
import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.IntStream;
import java.util.regex.Pattern;

import org.gluu.agama.pw.ResetService;
import org.gluu.agama.pw.jans.EmailTemplate;

public class JansResetService extends ResetService{

    private static final String MAIL = "mail";
    private static final String UID = "uid";
    private static final String INUM_ATTR = "inum";
    private static final String PASSWORD = "userPassword";
    public static final String JANS_STATUS = "jansStatus";
    public static final String INACTIVE = "inactive";
    public static final String ACTIVE = "active";
    private static final int OTP_LENGTH = 6;
    private static final String SUBJECT_TEMPLATE = "Here's your verification code: %s";
    private static final String MSG_TEMPLATE_TEXT = "%s is the code to complete your verification";   
    private static final SecureRandom RAND = new SecureRandom();
    
    public JansResetService() {
    }

    @Override
    public Map<String, String> getUserEntityByMail(String email) {
        User user = getUser(MAIL, email);
        boolean local = user != null;
        LogUtils.log("There is % local account for %", local ? "a" : "no", email);
    
        if (local) {            
            String uid = getSingleValuedAttr(user, UID);
            String inum = getSingleValuedAttr(user, INUM_ATTR);

            // Creating a truly modifiable map
            Map<String, String> userMap = new HashMap<>();
            userMap.put(UID, uid);
            userMap.put(INUM_ATTR, inum);
            userMap.put("email", email);
            
    
            return userMap;
        }
    
        return new HashMap<>();
    }    

    private String getSingleValuedAttr(User user, String attribute) {
        Object value = null;
        if (attribute.equals(UID)) {
            //user.getAttribute("uid", true, false) always returns null :(
            value = user.getUserId();
        } else {
            value = user.getAttribute(attribute, true, false);
        }
        return value == null ? null : value.toString();

    }    

    @Override
    public boolean passwordPolicyMatch(String userPassword) {
        String regex = '''^(?=.*[!@#$^&*])[A-Za-z0-9!@#$^&*]{6,}$'''
        Pattern pattern = Pattern.compile(regex);
        return pattern.matcher(userPassword).matches();
    }    

    @Override
    public String updateUserPassword(String userPassword, String mail) throws Exception {
        User user = getUser(MAIL, mail);
        user.setAttribute("userPassword", userPassword);

        UserService userService = CdiUtil.bean(UserService.class);
        user = userService.updateUser(user);
    
        if (user == null) {
            throw new EntryNotFoundException("Updated user not found");
        }
    
        return getSingleValuedAttr(user, INUM_ATTR);
    }     

    @Override
    public String sendEmail(String to) {

        SmtpConfiguration smtpConfiguration = getSmtpConfiguration();
        IntStream digits = RAND.ints(OTP_LENGTH, 0, 10);
        String otp = digits.mapToObj(i -> "" + i).collect(Collectors.joining());
        String from = smtpConfiguration.getFromEmailAddress();
        String subject = String.format(SUBJECT_TEMPLATE, otp);
        String textBody = String.format(MSG_TEMPLATE_TEXT, otp);
        String htmlBody = EmailTemplate.get(otp);

        MailService mailService = CdiUtil.bean(MailService.class);

        if (mailService.sendMailSigned(from, from, to, null, subject, textBody, htmlBody)) {
            LogUtils.log("E-mail has been delivered to % with code %", to, otp);
            return otp;
        }
        LogUtils.log("E-mail delivery failed, check jans-auth logs");
        return null;

    }

    private SmtpConfiguration getSmtpConfiguration() {
        ConfigurationService configurationService = CdiUtil.bean(ConfigurationService.class);
        SmtpConfiguration smtpConfiguration = configurationService.getConfiguration().getSmtpConfiguration();
        if (smtpConfiguration.getFromEmailAddress() == null || smtpConfiguration.getFromEmailAddress().isEmpty()) {
            LogUtils.log("Your smtp configuration not found, Please configure SMTP");
        } else {
            LogUtils.log("Your smtp configuration found");
        }
        
        return smtpConfiguration;

    } 
    
    private static User getUser(String attributeName, String value) {
        UserService userService = CdiUtil.bean(UserService.class);
        return userService.getUserByAttribute(attributeName, value, true);
    }       
    
}
