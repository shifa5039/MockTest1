package com.mocktest;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;

public class StartTestServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        startTest(request, response);  // allow GET requests
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        startTest(request, response);  // allow POST requests
    }

    private void startTest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ArrayList<Question> questionList = new ArrayList<>();

        try (Connection conn = DBUtil.getConnection()) {
            String sql = "SELECT * FROM questions ORDER BY RAND() LIMIT 10";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Question q = new Question();
                q.setId(rs.getInt("id"));
                q.setQuestion(rs.getString("question"));
                q.setOptionA(rs.getString("optionA"));
                q.setOptionB(rs.getString("optionB"));
                q.setOptionC(rs.getString("optionC"));
                q.setOptionD(rs.getString("optionD"));
                q.setCorrectOption(rs.getString("correctOption"));
                questionList.add(q);
            }

            // Store the question list in session
            request.getSession().setAttribute("questionList", questionList);

            // Redirect to test page
            response.sendRedirect("test.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Error fetching questions from DB", e);
        }
    }
}
