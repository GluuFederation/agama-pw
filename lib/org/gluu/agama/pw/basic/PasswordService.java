package org.gluu.agama.pw.basic;

public abstract class PasswordService {

    public abstract boolean validate(String username, String password);

    public static PasswordService getInstance(){
        return  new JansPasswordService();
    }
}
