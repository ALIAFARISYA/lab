<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Process Registration</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 500px;
            margin: 0 auto;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            text-align: center;
        }
        .success {
            background-color: #d4edda;
            color: #155724;
            padding: 15px;
            border-radius: 4px;
            margin: 20px 0;
        }
        .error {
            background-color: #f8d7da;
            color: #721c24;
            padding: 15px;
            border-radius: 4px;
            margin: 20px 0;
        }
        .back-link {
            display: inline-block;
            margin: 10px;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 4px;
        }
        .login-link {
            background-color: #007bff;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>User Registration Processing</h1>
        
        <%
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String firstname = request.getParameter("firstname");
            String lastname = request.getParameter("lastname");
            
            String driver = "com.mysql.jdbc.Driver";
            String url = "jdbc:mysql://localhost:3306/CSA3023";
            String dbUsername = "root";
            String dbPassword = "admin";
            
            Connection conn = null;
            PreparedStatement pstmt = null;
            
            try {
                Class.forName(driver);
                conn = DriverManager.getConnection(url, dbUsername, dbPassword);
                
                String sql = "INSERT INTO userprofile (username, password, firstname, lastname) VALUES (?, ?, ?, ?)";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, username);
                pstmt.setString(2, password);
                pstmt.setString(3, firstname);
                pstmt.setString(4, lastname);
                
                int result = pstmt.executeUpdate();
                
                if (result > 0) {
                    out.println("<div class='success'>");
                    out.println("<h3>✓ Registration Successful!</h3>");
                    out.println("<p>Welcome, " + firstname + " " + lastname + "!</p>");
                    out.println("<p>You can now login to your account.</p>");
                    out.println("</div>");
                }
                
            } catch (SQLIntegrityConstraintViolationException e) {
                out.println("<div class='error'>");
                out.println("<h3>✗ Registration Failed</h3>");
                out.println("<p>Username '" + username + "' is already taken. Please choose another username.</p>");
                out.println("</div>");
            } catch (Exception e) {
                out.println("<div class='error'>");
                out.println("<h3>✗ Error Occurred</h3>");
                out.println("<p>" + e.getMessage() + "</p>");
                out.println("</div>");
            } finally {
                if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
                if (conn != null) try { conn.close(); } catch (SQLException e) {}
            }
        %>
        
        <div>
            <a href="insertUser.html" class="back-link">Register Another User</a>
            <a href="login.jsp" class="back-link login-link">Go to Login</a>
        </div>
    </div>
</body>
</html>