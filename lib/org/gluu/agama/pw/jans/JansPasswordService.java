package org.gluu.agama.pw.jans;

import org.gluu.agama.pw.PasswordService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import io.jans.service.cdi.util.CdiUtil;
import io.jans.as.server.service.AuthenticationService;
import io.jans.as.server.service.UserService;
import io.jans.agama.engine.service.FlowService;
import io.jans.service.CacheService;

import java.util.HashMap;

public class JansPasswordService extends PasswordService {

    private static final Logger logger = LoggerFactory.getLogger(FlowService.class);
    private static AuthenticationService authenticationService = CdiUtil.bean(AuthenticationService.class);
    private static UserService userService = CdiUtil.bean(UserService.class);
    private static CacheService cacheService = CdiUtil.bean(CacheService.class);
    private String INVALID_LOGIN_COUNT_ATTRIBUTE = "jansCountInvalidLogin";
    private int MAXIMUM_LOGIN_ATTEMPT = 3;
    private int LOCK_EXPIRATION_TIME = 180;

    private HashMap<String, String> flowConfig;

    public  JansPasswordService(HashMap config){
        flowConfig = config;
        logger.debug("Flow config provided is  {}.", config);
    }

    public  JansPasswordService(){
    }
    @Override
    public boolean validate(String username, String password) {
        logger.info("Validating user credentials.");
        return authenticationService.authenticate(username, password);
    }
    @Override
    public boolean lockAccount(String username){
        User currentUser = userService.getUser(username);
        if(currentUser != null){
            int currentFailCount;
            String attributeValue = userService.getCustomAttribute(currentUser, INVALID_LOGIN_COUNT_ATTRIBUTE);
            if(attributeValue != null){
                currentFailCount = Integer.parseInt(attributeValue) + 1;
                if(currentFailCount >= MAXIMUM_LOGIN_ATTEMPT){
                    userService.setCustomAttribute(currentUser, "gluuStatus", "inactive");
                    userService.setCustomAttribute(currentUser, "jansStatus", "inactive");
                    userService.updateUser(currentUser);
                    String object_to_store="{'locked': true}";
                    cacheService.put(LOCK_EXPIRATION_TIME, "lock_user_"+username, object_to_store);
                    return true;
                }
            }
        }
        return false;
    }

    @Override
    public boolean unlockAccount(String username){
        User currentUser = userService.getUser(username);
        cacheService.put(LOCK_EXPIRATION_TIME, "lock_user_"+username, null);
        userService.setCustomAttribute(currentUser, "gluuStatus", "active");
        userService.setCustomAttribute(currentUser, "jansStatus", "active");
        userService.setCustomAttribute(currentUser, INVALID_LOGIN_COUNT_ATTRIBUTE, 0);
        userService.updateUser(currentUser);
        return true;
    }
}
