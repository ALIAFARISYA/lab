<%-- 
    Document   : jspParameter
    Created on : 21 Apr 2026, 3:26:36 pm
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Using JSP Standard Action</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f7f6;
            margin: 0;
            padding: 20px;
        }
        .title{
            margin-bottom: 20px;
            padding-left: 15px;
            border-left: 5px solid #6f42c1;
        }
        .container {
            width: 100%;
            max-width: 700px;
            margin: 0 auto;
        }
        .card {
            background: #ffffff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }
        .form-title {
            color: #6f42c1;
            font-size: 1.8rem;
            font-weight: 600;
            margin-top: 0;
            margin-bottom: 25px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="title">Using jsp:include and jsp:param to display information</h1>
        <div class="card">
            <h1 class="form-title">Calling SubjectInfo.Jsp Page</h1>
            
            <%
                String sCode = "CSE3023";
                String sSubject = "Web-based Application Development";
                String sCredit = "3(2+1)";
            %>
                        
            <jsp:include page="subjectInfo.jsp">
                <jsp:param name="code" value="<%= sCode %>" />
                <jsp:param name="subject" value="<%= sSubject %>" />
                <jsp:param name="credit" value="<%= sCredit %>" />
            </jsp:include>
        </div>
    </div>
</body>
</html>
