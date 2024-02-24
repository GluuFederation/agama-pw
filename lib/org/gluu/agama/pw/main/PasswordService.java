package org.gluu.agama.pw;

import org.gluu.agama.pw.jans.JansPasswordService;

import java.util.HashMap;

public abstract class PasswordService {

    public abstract boolean validate(String username, String password);
    public abstract boolean lockAccount(String username);
    public abstract boolean unlockAccount(String username);

    public static PasswordService getInstance(HashMap config){
        return  new JansPasswordService(config);
    }
}