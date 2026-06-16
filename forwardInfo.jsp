<%-- 
    Document   : forwardInfo
    Created on : 21 Apr 2026, 3:44:26 pm
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Forwarded Information</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f7f6;
            margin: 0;
            padding: 20px;
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
        .title{
            margin-bottom: 20px;
            padding-left: 15px;
            border-left: 5px solid #6f42c1;
        }
        .form-title {
            color: #6f42c1;
            font-size: 1.8rem;
            font-weight: 600;
            margin-top: 0;
            margin-bottom: 25px;
        }
        .result-group {
            margin-bottom: 15px;
            padding: 8px 0;
        }
        .result-group label {
            display: inline-block;
            font-weight: 600;
            color: #555;
            min-width: 100px;
        }
        .result-group p {
            display: inline-block;
            margin: 0;
            color: #333;
            font-weight: 500;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="title">Using jsp:forward to display user info</h1>
        <div class="card">
            <h1 class="form-title">Forwarded Info</h1>
            
            <%
                // Retrieve forwarded parameters using JSP Scriptlet
                String name = request.getParameter("uname");
                String email = request.getParameter("email");
                String nationality = request.getParameter("nationality");
                String background = request.getParameter("background");
            %>
            
            <div class="result-group">
                <label>Name:</label>
                <p><%= name %></p>
            </div>
            <div class="result-group">
                <label>Email:</label>
                <p><%= email %></p>
            </div>
            <div class="result-group">
                <label>Nationality:</label>
                <p><%= nationality %></p>
            </div>
            <div class="result-group">
                <label>Background:</label>
                <p><%= background %></p>
            </div>
        </div>
    </div>
</body>
</html>