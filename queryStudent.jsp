<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Lab 6 - Task 4 - Student Records</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 1000px;
            margin: 0 auto;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h1 {
            color: #333;
            text-align: center;
            border-bottom: 2px solid #4CAF50;
            padding-bottom: 10px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }
        th {
            background-color: #4CAF50;
            color: white;
            padding: 12px;
            text-align: left;
        }
        td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }
        tr:hover {
            background-color: #f5f5f5;
        }
        .record-count {
            background-color: #e2f0fb;
            padding: 10px;
            border-radius: 4px;
            margin-bottom: 20px;
            text-align: center;
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
        .no-records {
            text-align: center;
            color: #666;
            padding: 40px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Lab 6 - Task 4: Retrieving Records via JSP Page</h1>
        <h2>Student Records List</h2>
        
        <%
            // Database connection parameters
            String driver = "com.mysql.jdbc.Driver";
            String url = "jdbc:mysql://localhost:3306/CSA3023";
            String username = "root";
            String password = "admin";
            
            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;
            int recordCount = 0;
            
            try {
                // Load database driver
                Class.forName(driver);
                
                // Create connection
                conn = DriverManager.getConnection(url, username, password);
                
                // Create statement
                stmt = conn.createStatement();
                
                // Execute query
                String sql = "SELECT * FROM student ORDER BY stuno";
                rs = stmt.executeQuery(sql);
        %>
        
        <table>
            <thead>
                <tr>
                    <th>Student Number</th>
                    <th>Student Name</th>
                    <th>Program</th>
                    <th>Address</th>
                </tr>
            </thead>
            <tbody>
                <%
                    while (rs.next()) {
                        recordCount++;
                %>
                <tr>
                    <td><%= rs.getString("stuno") %></td>
                    <td><%= rs.getString("stuname") %></td>
                    <td><%= rs.getString("stuprogram") %></td>
                </tr>
                <%
                    }
                    
                    if (recordCount == 0) {
                %>
                <tr>
                    <td colspan="4" class="no-records">No student records found in the database.</td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
        
        <div class="record-count">
            <strong>Total Records:</strong> <%= recordCount %> student(s) found
        </div>
        
        <%
            } catch (Exception e) {
                out.println("<div class='error' style='background-color:#f8d7da;color:#721c24;padding:15px;border-radius:4px;'>");
                out.println("<h3>Error retrieving records:</h3>");
                out.println("<p>" + e.getMessage() + "</p>");
                out.println("</div>");
                e.printStackTrace();
            } finally {
                // Close resources
                if (rs != null) try { rs.close(); } catch (SQLException e) {}
                if (stmt != null) try { stmt.close(); } catch (SQLException e) {}
                if (conn != null) try { conn.close(); } catch (SQLException e) {}
            }
        %>
        
        <div style="text-align: center;">
            <a href="insertStudent.jsp" class="back-link">+ Register New Student</a>
        </div>
    </div>
</body>
</html>