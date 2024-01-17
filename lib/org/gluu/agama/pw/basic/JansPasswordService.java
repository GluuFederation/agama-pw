package org.gluu.agama.pw.basic;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import io.jans.service.cdi.util.CdiUtil;
import io.jans.as.server.service.AuthenticationService;
import io.jans.agama.engine.service.FlowService;
public class JansPasswordService extends PasswordService{

    private static final Logger logger = LoggerFactory.getLogger(FlowService.class);
    private static AuthenticationService authenticationService = CdiUtil.bean(AuthenticationService.class);
    @Override
    public boolean validate(String username, String password) {
        logger.info("Validating user credentials.");
        boolean result = authenticationService.authenticate(username, password);
        logger.info("Validation status.", result);
        return result;
    }
}
