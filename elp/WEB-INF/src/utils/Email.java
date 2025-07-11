package utils;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.MimeMessage;

public class Email {

    public String forgetPasswordEmail(String name, String email){
        String code = Utility.generateVerificationCode();
        String htmlString = "<div style=\"font-family: Arial, sans-serif;background-color: #f4f4f4;margin: 0;padding: 0;\">" +
        "<div style=\"max-width: 600px;margin: 50px auto;background-color: #fff;padding: 20px;box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);\">" +
        "<div style=\"text-align: center;padding: 10px 0;\">" +
        "<span><a style=\"font-size: 1.3rem;font-weight: bold;color: #007bff;\" href=\"http://localhost:8080/expense_app\">Learnify</a></span>" +
        "</div>" +
        "<div style=\"margin: 20px 0;\">" +
        "<p style=\"font-size: 16px;color: #555;\">Dear" + name + ",</p>" +
        "<p>We received a request to reset your password. Please use the verification code below to reset your password:</p>" +
        "<div style=\"font-size: 24px;font-weight: bold;color: #333;text-align: center;margin: 20px 0;\">" + code + "</div>" +
        "<p>If you did not request this code, please ignore this email.</p>" +
        "</div>" +
        "<div style=\"text-align: center;padding: 10px 0;color: #999;font-size: 12px;\">" +
        "<p>&copy; 2024 Learnify. All rights reserved.</p>" +
        "</div>" +
        "</div>" +
        "</div>";

        Properties props = new Properties();

        props.put("mail.transport.protocol", "smtp");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getInstance(props, new Authenticator() {
            public PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("bytestream0101@gmail.com", "drjhbouxyvddxrho");
            }
        });

        MimeMessage msg = new MimeMessage(session);

        try {
            msg.setFrom("bytestream0101@gmail.com");

            msg.setRecipients(Message.RecipientType.TO, email);
            msg.setSubject("Password Reset");
            msg.setContent(htmlString, "text/html");

            Transport.send(msg);
            return code;
        } catch(MessagingException e) {
            e.printStackTrace();
        }

        return "-1";
    }

    public String sendVerificationCode(String name,String email){
        // System.out.println("Verification code sent to your email");
        String code = Utility.generateVerificationCode();
        String htmlString = "<div style=\"font-family: Arial, sans-serif;background-color: #f4f4f4;margin: 0;padding: 0;\">" +
        "<div style=\"max-width: 600px;margin: 50px auto;background-color: #fff;padding: 20px;box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);\">" +
        "<div style=\"text-align: center;padding: 10px 0;\">" +
        "<span><a style=\"font-size: 1.3rem;font-weight: bold;color: #007bff;\" href=\"http://localhost:8080/elp\">Learnify</a></span>" +
        "</div>" +
        "<div style=\"margin: 20px 0;\">" +
        "<p style=\"font-size: 16px;color: #555;\">Dear " + name + ",</p>" +
        "<p>Thank you for registering with us. Please use the verification code below to complete your registration:</p>" +
        "<div style=\"font-size: 24px;font-weight: bold;color: #333;text-align: center;margin: 20px 0;\">" + code + "</div>" +
        "<p>If you did not request this code, please ignore this email.</p>" +
        "</div>" +
        "<div style=\"text-align: center;padding: 10px 0;color: #999;font-size: 12px;\">" +
        "<p>&copy; 2024 Learnify. All rights reserved.</p>" +
        "</div>" +
        "</div>" +
        "</div>";

        Properties props = new Properties();

        props.put("mail.transport.protocol", "smtp");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getInstance(props, new Authenticator() {
            public PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("bytestream0101@gmail.com", "drjhbouxyvddxrho");
            }
        });

        MimeMessage msg = new MimeMessage(session);

        try {
            msg.setFrom("bytestream0101@gmail.com");

            msg.setRecipients(Message.RecipientType.TO, email);
            msg.setSubject("Email Verification");
            msg.setContent(htmlString, "text/html");

            Transport.send(msg);
            return code;
        } catch(MessagingException e) {
            e.printStackTrace();
        }

        return "-1";
    }
}
