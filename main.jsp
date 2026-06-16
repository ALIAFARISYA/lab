<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Main Page - Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h1 {
            color: #333;
            text-align: center;
        }
        .welcome {
            background-color: #d4edda;
            color: #155724;
            padding: 15px;
            border-radius: 4px;
            margin: 20px 0;
            text-align: center;
        }
        .user-info {
            background-color: #e2f0fb;
            padding: 15px;
            border-radius: 4px;
            margin: 20px 0;
        }
        .logout-link {
            display: inline-block;
            padding: 10px 20px;
            background-color: #f44336;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            text-align: center;
        }
        .logout-link:hover {
            background-color: #d32f2f;
        }
    </style>
</head>
<body>
    <%
        // Check if user is logged in
        String username = (String) session.getAttribute("username");
        String firstname = (String) session.getAttribute("firstname");
        String lastname = (String) session.getAttribute("lastname");
        
        if (username == null) {
            response.sendRedirect("login.jsp");
            return;
        }
    %>
    
    <div class="container">
        <h1>Welcome to Dashboard</h1>
        
        <div class="welcome">
            <h2>Welcome, <%= firstname %> <%= lastname %>!</h2>
            <p>You have successfully logged in to the system.</p>
        </div>
        
        <div class="user-info">
            <h3>User Profile Information:</h3>
            <p><strong>Username:</strong> <%= username %></p>
            <p><strong>First Name:</strong> <%= firstname %></p>
            <p><strong>Last Name:</strong> <%= lastname %></p>
        </div>
    </div>
</body>
</html>