package com.mocktest;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

public class UpdateQuestionServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String question = request.getParameter("question");
        String optionA = request.getParameter("optionA");
        String optionB = request.getParameter("optionB");
        String optionC = request.getParameter("optionC");
        String optionD = request.getParameter("optionD");
        String correctOption = request.getParameter("correctOption");

        try (Connection conn = DBUtil.getConnection()) {
            String sql = "UPDATE questions SET question=?, optionA=?, optionB=?, optionC=?, optionD=?, correctOption=? WHERE id=?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, question);
            stmt.setString(2, optionA);
            stmt.setString(3, optionB);
            stmt.setString(4, optionC);
            stmt.setString(5, optionD);
            stmt.setString(6, correctOption);
            stmt.setInt(7, id);

            stmt.executeUpdate();
            response.sendRedirect("ViewQuestionsServlet");

        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Error updating question", e);
        }
    }
}
