<%@ page import="com.mocktest.Question" %>
<%
    Question q = (Question) request.getAttribute("question");
%>

<html>
<head>
    <title>Edit Question</title>
</head>
<body>
    <h2>Edit Question</h2>
    <form action="UpdateQuestionServlet" method="post">
        <input type="hidden" name="id" value="<%= q.getId() %>" />

        Question: <input type="text" name="question" value="<%= q.getQuestion() %>" /><br><br>
        Option A: <input type="text" name="optionA" value="<%= q.getOptionA() %>" /><br><br>
        Option B: <input type="text" name="optionB" value="<%= q.getOptionB() %>" /><br><br>
        Option C: <input type="text" name="optionC" value="<%= q.getOptionC() %>" /><br><br>
        Option D: <input type="text" name="optionD" value="<%= q.getOptionD() %>" /><br><br>
        Correct Option (A/B/C/D): <input type="text" name="correctOption" value="<%= q.getCorrectOption() %>" /><br><br>

        <input type="submit" value="Update Question" />
    </form>
</body>
</html>
