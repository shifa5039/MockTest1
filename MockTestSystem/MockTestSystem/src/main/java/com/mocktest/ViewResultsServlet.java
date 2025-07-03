package com.mocktest;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.*;

public class ViewResultsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Result> resultList = new ArrayList<>();

        try (Connection conn = DBUtil.getConnection()) {
            String sql = "SELECT * FROM results ORDER BY id DESC";
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                Result r = new Result();
                r.setId(rs.getInt("id"));
                r.setUsername(rs.getString("username"));
                r.setScore(rs.getInt("score"));
                r.setTotal(rs.getInt("total"));
                r.setTimestamp(rs.getTimestamp("timestamp"));
                resultList.add(r);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("results", resultList);
        RequestDispatcher rd = request.getRequestDispatcher("view_results.jsp");
        rd.forward(request, response);
    }
}
