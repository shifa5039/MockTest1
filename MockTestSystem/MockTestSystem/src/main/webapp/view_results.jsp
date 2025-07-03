<%@ page import="java.util.*, com.mocktest.Result" %>
<%@ page session="true" %>
<%
    String role = (String) session.getAttribute("role");
    if (role == null || !role.equals("admin")) {
        response.sendRedirect("login.jsp");
        return;
    }

    List<Result> results = (List<Result>) request.getAttribute("results");
%>

<html>
<head>
    <title>All Test Results</title>
    <style>
        table {
            border-collapse: collapse;
            width: 80%;
            margin: auto;
        }
        th, td {
            border: 1px solid #888;
            padding: 10px;
            text-align: center;
        }
        th {
            background-color: #007bff;
            color: white;
        }
    </style>
</head>
<body>
    <h2 style="text-align:center;">All Student Test Results</h2>
    <table>
        <tr>
            <th>ID</th>
            <th>Username</th>
            <th>Score</th>
            <th>Total</th>
            <th>Percentage</th>
            <th>Timestamp</th>
        </tr>
        <%
            if (results != null) {
                for (Result r : results) {
                    double percent = ((double) r.getScore() / r.getTotal()) * 100;
        %>
        <tr>
            <td><%= r.getId() %></td>
            <td><%= r.getUsername() %></td>
            <td><%= r.getScore() %></td>
            <td><%= r.getTotal() %></td>
            <td><%= String.format("%.2f", percent) %> %</td>
            <td><%= r.getTimestamp() %></td>
        </tr>
        <%      }
            }
        %>
    </table>
</body>
</html>
