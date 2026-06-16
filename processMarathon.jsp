<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="lab6.com.Marathon, lab6.com.MarathonDAO"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Processing Marathon Registration</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            margin: 0;
            padding: 20px;
            min-height: 100vh;
        }
        .container {
            max-width: 550px;
            margin: 0 auto;
            background: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 20px 40px rgba(0,0,0,0.2);
            text-align: center;
        }
        .success {
            background-color: #d4edda;
            color: #155724;
            padding: 20px;
            border-radius: 10px;
            margin: 20px 0;
        }
        .error {
            background-color: #f8d7da;
            color: #721c24;
            padding: 20px;
            border-radius: 10px;
            margin: 20px 0;
        }
        .info-card {
            background-color: #e2f0fb;
            padding: 20px;
            border-radius: 10px;
            margin: 20px 0;
            text-align: left;
        }
        .info-card h3 {
            margin-top: 0;
            color: #333;
        }
        .info-card p {
            margin: 8px 0;
        }
        .buttons {
            margin-top: 20px;
        }
        .btn {
            display: inline-block;
            padding: 10px 25px;
            margin: 5px;
            border-radius: 25px;
            text-decoration: none;
            color: white;
            transition: transform 0.2s;
        }
        .btn-primary {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        }
        .btn-secondary {
            background-color: #6c757d;
        }
        .btn:hover {
            transform: scale(1.02);
        }
        .fee {
            font-size: 24px;
            font-weight: bold;
            color: #28a745;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Marathon Registration</h1>
        
        <%
            // Create Marathon object using JavaBean
            Marathon marathon = new Marathon();
            
            // Set properties from request parameters
            marathon.setFullname(request.getParameter("fullname"));
            marathon.setEmail(request.getParameter("email"));
            marathon.setPhone(request.getParameter("phone"));
            marathon.setCategory(request.getParameter("category"));
            marathon.setTshirtSize(request.getParameter("tshirt_size"));
            
            // Create DAO object and perform insertion
            MarathonDAO dao = new MarathonDAO();
            boolean isInserted = dao.insertMarathon(marathon);
            
            if (isInserted) {
        %>
        
        <div class="success">
            <h2>✓ Registration Successful!</h2>
            <p>Thank you for registering for the marathon!</p>
        </div>
        
        <div class="info-card">
            <h3>📋 Registration Details:</h3>
            <p><strong>Name:</strong> <%= marathon.getFullname() %></p>
            <p><strong>Email:</strong> <%= marathon.getEmail() %></p>
            <p><strong>Phone:</strong> <%= marathon.getPhone() %></p>
            <p><strong>Category:</strong> <%= marathon.getCategory() %></p>
            <p><strong>T-Shirt Size:</strong> <%= marathon.getTshirtSize() %></p>
            <p><strong>Registration Fee:</strong> <span class="fee">RM <%= String.format("%.2f", marathon.getFee()) %></span></p>
        </div>
        
        <%
            } else {
        %>
        
        <div class="error">
            <h2>✗ Registration Failed</h2>
            <p>There was an error processing your registration. Please try again.</p>
        </div>
        
        <%
            }
        %>
        
        <div class="buttons">
            <a href="registerMarathon.jsp" class="btn btn-primary">Register Another</a>
            <a href="viewMarathon.jsp" class="btn btn-secondary">View All Registrations</a>
        </div>
    </div>
</body>
</html>