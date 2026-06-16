<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Error Page</title>
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
            border-left: 5px solid #f44336;
        }
        h1 {
            color: #f44336;
            text-align: center;
        }
        .error-details {
            background-color: #f8f9fa;
            padding: 15px;
            border-radius: 4px;
            margin: 20px 0;
            font-family: monospace;
        }
        .back-link {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 4px;
        }
        .back-link:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>⚠️ An Error Occurred</h1>
        
        <div class="error-details">
            <h3>Error Details:</h3>
            <p><strong>Exception Type:</strong> <%= exception.getClass().getName() %></p>
            <p><strong>Error Message:</strong> <%= exception.getMessage() %></p>
        </div>
        
        <div class="error-details">
            <h3>Possible Causes:</h3>
            <ul>
                <li>Invalid Student Number format (must be 2 capital letters + 5 numbers)</li>
                <li>Database connection issues</li>
                <li>Missing required fields</li>
                <li>Duplicate student number</li>
            </ul>
        </div>
        
        <div style="text-align: center;">
            <a href="insertStudent.jsp" class="back-link">← Back to Registration Form</a>
        </div>
    </div>
</body>
</html>