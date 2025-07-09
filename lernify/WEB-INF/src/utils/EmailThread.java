package utils;

import models.User;

public class EmailThread extends Thread {
    private String name;
    private String email;

    public EmailThread(String name, String email) {
        this.name = name;
        this.email = email;
    }

    @Override
    public void run() {
        String flag = new Email().sendVerificationCode(name, email);
        if (!flag.equals("-1")) {
            User.setVerificationCodeDb(flag, email);
        }
    }
}
