package utils;

import models.User;

public class ForgetEmailThread extends Thread {
    private String name;
    private String email;

    public ForgetEmailThread(String name, String email) {
        this.name = name;
        this.email = email;
    }

    @Override
    public void run() {
        String flag = new Email().forgetPasswordEmail(name, email);
        if (!flag.equals("-1")) {
            User.setVerificationCodeDb(flag, email);
        }
    }
}
