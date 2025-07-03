<%@ page session="true" %>
<%
    String user = (String) session.getAttribute("username");
    String role = (String) session.getAttribute("role");
    if (user == null || !"student".equals(role)) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Dashboard</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(120deg, #89f7fe 0%, #66a6ff 100%);
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
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
            width: 70%;
            max-width: 450px;
            text-align: center;
        }

        h2 {
            color: #333;
            margin-bottom: 30px;
        }

        ul {
            list-style: none;
            padding: 0;
        }

        ul li {
            margin: 15px 0;
        }

        a.button {
            display: inline-block;
            text-decoration: none;
            background-color: #4CAF50;
            color: white;
            padding: 12px 18px;
            border-radius: 10px;
            height: 30px;
            font-size: 16px;
            transition: background-color 0.3s ease;
            margin: 5px 0;
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
    <h2>Welcome, <%= user %> </h2>
        <a href="StartTestServlet" class="button">Start New Test</a><br>
        <a href="LogoutServlet" class="button logout-btn">Logout</a>
</div>

</body>
</html>
