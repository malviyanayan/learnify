package utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

public class Utility {
    public static String generateTransectionId() {
        Long transactionId = (long) 100000 + (int) (Math.random() * ((1000000 - 100000) + 1));
        Date date = new Date();
        transactionId += date.getTime();
        String transactionIdStr = transactionId.toString();
        if (transactionIdStr.length() > 15) {
            transactionIdStr = transactionIdStr.substring(0, 15);
        }
        return transactionIdStr;
    }

    public static String generateHashCode() {
        int length = 5;
        String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        StringBuilder hashCode = new StringBuilder();
        for (int i = 0; i < length; i++) {
            int index = (int) (Math.random() * characters.length());
            hashCode.append(characters.charAt(index));
        }
        return hashCode.toString();
    }

    public static String convertToTimeFormat(int seconds) {
        int hours = seconds / 3600;
        int minutes = (seconds % 3600) / 60;
        int sec = seconds % 60;
        
        return String.format("%02d:%02d:%02d", hours, minutes, sec);
    }
    

    public static boolean isValidCountry(Integer country){
        return true;
    }

    public static boolean isValidGender(Character gender){
        return true;
    }

    public static boolean isValidAbout(String about){
        return true;
    }

    public static String refine(String text){
        return text;
    }

    public static boolean isValidName(String name){
        return true;
    }

    public static boolean isEmailExist(String email) {
    Connection con = Database.getConnection();
    boolean found = false;

    try {
        String query = "SELECT email FROM users WHERE TRIM(email) = ?";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, email);

        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            found = true;
        }

    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        try {
            con.close();
        } catch (SQLException exp) {
            exp.printStackTrace();
        }
    }

    return found;
}

    public static String generateVerificationCode() {
        int length = 6;
        String characters = "0123456789";
        StringBuilder verificationCode = new StringBuilder();
        for (int i = 0; i < length; i++) {
            int index = (int) (Math.random() * characters.length());
            verificationCode.append(characters.charAt(index));
        }
        return verificationCode.toString();
    }
}
