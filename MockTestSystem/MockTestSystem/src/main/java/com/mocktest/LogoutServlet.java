package com.mocktest;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;

public class LogoutServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Invalidate session and redirect to login
        HttpSession session = request.getSession(false); // avoid creating new session
        if (session != null) {
            session.invalidate();
        }
        response.sendRedirect("index.jsp");
    }
}
