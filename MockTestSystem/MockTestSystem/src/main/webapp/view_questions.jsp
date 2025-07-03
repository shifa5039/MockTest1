<%@ page import="java.util.*, com.mocktest.Question" %>
<%
    List<Question> questions = (List<Question>) request.getAttribute("questions");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>All MCQ Questions</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: #f1f4f9;
            margin: 0;
            padding: 0;
        }

        h2 {
            text-align: center;
            margin-top: 30px;
            color: #333;
        }

        table {
            border-collapse: collapse;
            width: 95%;
            margin: 30px auto;
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.1);
            overflow: hidden;
        }

        th, td {
            padding: 14px;
            border-bottom: 1px solid #ddd;
            text-align: center;
            font-size: 15px;
        }

        th {
            background: linear-gradient(to right, #6a11cb, #2575fc);
            color: white;
            text-transform: uppercase;
        }

        tr:hover {
            background-color: #f0f8ff;
        }

        a.button {
            padding: 8px 14px;
            text-decoration: none;
            color: white;
            border-radius: 6px;
            font-size: 14px;
            margin: 3px;
            display: inline-block;
            transition: background-color 0.3s ease;
        }

        .edit-btn {
            background-color: #28a745;
        }

        .edit-btn:hover {
            background-color: #218838;
        }

        .delete-btn {
            background-color: #dc3545;
        }

        .delete-btn:hover {
            background-color: #c82333;
        }

        .back-link {
            display: block;
            text-align: center;
            margin: 20px auto 40px;
            font-size: 16px;
            text-decoration: none;
            background: #007bff;
            color: white;
            padding: 10px 20px;
            width: fit-content;
            border-radius: 6px;
            transition: background-color 0.3s ease;
        }

        .back-link:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

    <h2>All MCQ Questions</h2>

    <table>
        <tr>
            <th>ID</th>
            <th>Question</th>
            <th>A</th>
            <th>B</th>
            <th>C</th>
            <th>D</th>
            <th>Correct</th>
            <th>Actions</th>
        </tr>
        <%
            if (questions != null) {
                for (Question q : questions) {
        %>
        <tr>
            <td><%= q.getId() %></td>
            <td><%= q.getQuestion() %></td>
            <td><%= q.getOptionA() %></td>
            <td><%= q.getOptionB() %></td>
            <td><%= q.getOptionC() %></td>
            <td><%= q.getOptionD() %></td>
            <td><%= q.getCorrectOption() %></td>
            <td>
                <a class="button edit-btn" href="EditQuestionServlet?id=<%= q.getId() %>">Edit</a>
                <a class="button delete-btn" href="DeleteQuestionServlet?id=<%= q.getId() %>" onclick="return confirm('Are you sure you want to delete this question?');">Delete</a>
            </td>
        </tr>
        <%
                }
            }
        %>
    </table>

    <a class="back-link" href="admin_dashboard.jsp"> Back to Dashboard</a>

</body>
</html>
