<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, lab6.com.Student"%>
<%@page errorPage="errorStudent.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Process Student Registration</title>
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
        .success {
            background-color: #d4edda;
            color: #155724;
            padding: 15px;
            border-radius: 4px;
            margin: 20px 0;
            border: 1px solid #c3e6cb;
        }
        .info {
            background-color: #e2f0fb;
            color: #0c5460;
            padding: 15px;
            border-radius: 4px;
            margin: 20px 0;
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
        <h1>Student Registration Processing</h1>
        
        <jsp:useBean id="student" class="lab6.com.Student" scope="page" />
        <jsp:setProperty name="student" property="*" />
        
        <%
            // Database connection parameters
            String driver = "com.mysql.jdbc.Driver";
            String url = "jdbc:mysql://localhost:3306/CSA3023";
            String username = "root";
            String password = "admin"; 
            
            Connection conn = null;
            PreparedStatement pstmt = null;
            
            try {
                // Load database driver
                Class.forName(driver);
                
                // Create connection
                conn = DriverManager.getConnection(url, username, password);
                
                // Create SQL insert statement
                String sql = "INSERT INTO student (stuno, stuname, stuprogram) VALUES (?, ?, ?)";
                pstmt = conn.prepareStatement(sql);
                
                // Set parameters
                pstmt.setString(1, student.getStuno());
                pstmt.setString(2, student.getStuname());
                pstmt.setString(3, student.getStuprogram());
                
                // Execute the query
                int result = pstmt.executeUpdate();
                
                if (result > 0) {
                    out.println("<div class='success'>");
                    out.println("<h3>Registration Successful!</h3>");
                    out.println("<p>Student record has been successfully saved to the database.</p>");
                    out.println("</div>");
                    
                    out.println("<div class='info'>");
                    out.println("<h4>Registered Student Information:</h4>");
                    out.println("<p><strong>Student Number:</strong> " + student.getStuno() + "</p>");
                    out.println("<p><strong>Student Name:</strong> " + student.getStuname() + "</p>");
                    out.println("<p><strong>Program:</strong> " + student.getStuprogram() + "</p>");
                    out.println("</div>");
                }
                
            } catch (SQLIntegrityConstraintViolationException e) {
                out.println("<div class='error' style='background-color:#f8d7da;color:#721c24;padding:15px;border-radius:4px;margin:20px 0;'>");
                out.println("<h3>Error: Duplicate Entry</h3>");
                out.println("<p>Student number '" + student.getStuno() + "' already exists in the database.</p>");
                out.println("</div>");
            } catch (Exception e) {
                out.println("<div class='error' style='background-color:#f8d7da;color:#721c24;padding:15px;border-radius:4px;margin:20px 0;'>");
                out.println("<h3>✗ Error Occurred</h3>");
                out.println("<p>" + e.getMessage() + "</p>");
                out.println("</div>");
                e.printStackTrace();
            } finally {
                // Close resources
                if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
                if (conn != null) try { conn.close(); } catch (SQLException e) {}
            }
        %>
        
        <div style="text-align: center;">
            <a href="insertStudent.jsp" class="back-link">Register Another Student</a>
            <a href="queryStudent.jsp" class="back-link" style="background-color:#007bff;">View All Students</a>
        </div>
    </div>
</body>
</html>