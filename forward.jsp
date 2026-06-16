<%-- 
    Document   : forward
    Created on : 21 Apr 2026, 3:38:11 pm
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Using JSP Standard Action (Forward)</title>
</head>
<body> 
    <jsp:forward page="forwardInfo.jsp">
        <jsp:param name="uname" value="Nur Alia Farisya Binti Mohd Khairy" />
        <jsp:param name="email" value="S75892@ocean.umt.edu.my" />
        <jsp:param name="nationality" value="Malaysia" />
        <jsp:param name="background" value="Student" />
    </jsp:forward>
</body>
</html>
