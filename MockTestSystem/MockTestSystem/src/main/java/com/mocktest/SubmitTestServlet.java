package com.mocktest;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.*;

public class SubmitTestServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<Question> questions = (List<Question>) session.getAttribute("questionList");
        String username = (String) session.getAttribute("username");

        int score = 0;
        int total = questions.size();

        for (Question q : questions) {
            String userAnswer = request.getParameter("q" + q.getId());
            if (userAnswer != null && userAnswer.equalsIgnoreCase(q.getCorrectOption())) {
                score++;
            }
        }

        // Save result to database
        try (Connection conn = DBUtil.getConnection()) {
            String sql = "INSERT INTO results (username, score, total) VALUES (?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setInt(2, score);
            stmt.setInt(3, total);
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

        session.setAttribute("score", score);
        session.setAttribute("total", total);
        response.sendRedirect("result.jsp");
    }
}
