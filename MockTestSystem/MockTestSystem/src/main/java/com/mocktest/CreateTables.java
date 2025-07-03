package com.mocktest;

import java.sql.Connection;
import java.sql.Statement;

public class CreateTables {
    public static void main(String[] args) {
        try (Connection conn = DBUtil.getConnection();
             Statement stmt = conn.createStatement()) {

            String createUsers = "CREATE TABLE IF NOT EXISTS users (" +
                "id INT AUTO_INCREMENT PRIMARY KEY," +
                "username VARCHAR(100) NOT NULL UNIQUE," +
                "password VARCHAR(100) NOT NULL," +
                "role ENUM('admin', 'student') DEFAULT 'student')";

            String createQuestions = "CREATE TABLE IF NOT EXISTS questions (" +
                "id INT AUTO_INCREMENT PRIMARY KEY," +
                "question TEXT NOT NULL," +
                "option_a VARCHAR(255)," +
                "option_b VARCHAR(255)," +
                "option_c VARCHAR(255)," +
                "option_d VARCHAR(255)," +
                "correct_option CHAR(1))";

            String createResults = "CREATE TABLE IF NOT EXISTS results (" +
                "id INT AUTO_INCREMENT PRIMARY KEY," +
                "user_id INT," +
                "score INT," +
                "timestamp DATETIME DEFAULT CURRENT_TIMESTAMP," +
                "FOREIGN KEY (user_id) REFERENCES users(id))";

            stmt.executeUpdate(createUsers);
            stmt.executeUpdate(createQuestions);
            stmt.executeUpdate(createResults);

            System.out.println("Tables created successfully!");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
