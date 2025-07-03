package com.mocktest;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil {
    // Update these with your actual DB info
    private static final String URL = "jdbc:mysql://localhost:3306/mocktest";
    private static final String USER = "root";
    private static final String PASSWORD = "0425";  // <-- change to your actual MySQL root password

    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace(); // optional: log to file or logger
        }
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}
