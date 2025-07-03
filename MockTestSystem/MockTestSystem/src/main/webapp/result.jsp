<%@ page session="true" %>
<%
    Integer score = (Integer) session.getAttribute("score");
    Integer total = (Integer) session.getAttribute("total");
    String username = (String) session.getAttribute("username");
%>

<html>
<head><title>Test Result</title></head>
<body>
    <h2>Test Result</h2>
    <p>Username: <%= username %></p>
    <p>Your Score: <%= score %> out of <%= total %></p>
    <a href="student_dashboard.jsp">Back to Dashboard</a>
</body>
</html>
