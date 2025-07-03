<%@ page session="true" %>
<%
    String user = (String) session.getAttribute("username");
    String role = (String) session.getAttribute("role");
    if (user == null || !"admin".equals(role)) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to right, #fdfbfb, #ebedee);
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .dashboard {
            background: white;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 480px;
            text-align: center;
        }

        h2 {
            margin-bottom: 30px;
            color: #333;
        }

        ul {
            list-style: none;
            padding: 0;
        }

        li {
            margin: 15px 0;
        }

        a.button {
            display: inline-block;
            background-color: #4CAF50;
            color: white;
            padding: 12px 18px;
            border-radius: 8px;
            text-decoration: none;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        a.button:hover {
            background-color: #45a049;
        }

        .logout-btn {
            background-color: #f44336;
        }

        .logout-btn:hover {
            background-color: #d32f2f;
        }
    </style>
</head>
<body>

    <div class="dashboard">
        <h2>Welcome Admin: <%= user %></h2>

        <ul>
            <li><a class="button" href="AddQuestion.jsp">Add MCQ Questions</a></li>
            <li><a class="button" href="ViewQuestionsServlet">View Questions</a></li>
            <li><a class="button" href="ViewResultsServlet">View Student Test Results</a></li>
            <li><a class="button logout-btn" href="LogoutServlet">Logout</a></li>
        </ul>
    </div>

</body>
</html>
