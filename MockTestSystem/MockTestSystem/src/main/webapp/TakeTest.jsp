<%@ page session="true" %>
<%
    String user = (String) session.getAttribute("username");
    String role = (String) session.getAttribute("role");

    if (user == null || !"student".equals(role)) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<html>
<head>
    <title>Take Test</title>
</head>
<body>
    <h2>Welcome Student: <%= user %></h2>
    <form action="StartTestServlet" method="post">
        <input type="submit" value="Start Test">
    </form>
</body>
</html>
