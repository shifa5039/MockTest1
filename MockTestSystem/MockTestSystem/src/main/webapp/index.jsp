<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Mock Online Test System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f2f2f2;
            margin: 0;
            padding: 0;
        }
        .header {
            background: #2c3e50;
            color: white;
            padding: 20px;
            text-align: center;
        }
        .main {
            padding: 40px;
            text-align: center;
        }
        .button {
            background-color: #2980b9;
            color: white;
            padding: 15px 30px;
            margin: 20px;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
        }
        .button:hover {
            background-color: #3498db;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Mock Online Test System</h1>
        <p>Prepare. Practice. Perform.</p>
    </div>
    <div class="main">
        <h2>Welcome!</h2>
        <p>Select an option below to get started:</p>
        <form action="login.jsp">
            <button class="button">Login</button>
        </form>
    </div>
</body>
</html>
