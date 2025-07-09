package utils;

import java.sql.Connection;
import java.sql.DriverManager;

public class Database {
    // public static final String URL = "jdbc:mysql://localhost:3306/elpdb";
    // private static final String user = "root";
    // private static final String password = "1234";

    public static final String URL = "jdbc:mysql://shuttle.proxy.rlwy.net:33205/railway";
    private static final String user = "root";
    private static final String password = "AMojGoUAxqGAyzmyuesQjMInEMWVAWxn";

    public static Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(URL, user, password);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }

    public static String getUrl() {
        return URL;
    }

    public static String getUser() {
        return user;
    }
    
}
