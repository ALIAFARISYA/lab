<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lab 6 - Task 1</title>
    </head>
    <body>
        <div class="container">
            <h1>Lab 6 - Task 1: Sample Insertion Records into MySQL through JSP's Page</h1>
            
            <div class="steps">
                <h3>Steps to Connect with MySQL Database:</h3>
                <ol>
                    <li>Load and Register the JDBC Driver - Class.forName("com.mysql.jdbc.Driver")</li>
                    <li>Establish Connection - DriverManager.getConnection(url, username, password)</li>
                    <li>Create Statement - connection.createStatement()</li>
                    <li>Execute Query - statement.executeUpdate() or statement.executeQuery()</li>
                    <li>Process Results - Handle ResultSet if needed</li>
                    <li>Close Connection - connection.close()</li>
                </ol>
            </div>
            
            <%
                // Database connection parameters
                String url = "jdbc:mysql://localhost:3306/CSA3203";
                String username = "root";
                String password = "admin";
                String message = "Welcome to access MySQL database with JSP...!";
                boolean isInserted = false;
                String errorMessage = null;
                
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    
                    Connection conn = DriverManager.getConnection(url, username, password);
                    
                    Statement stmt = conn.createStatement();
                    
                    String sql = "INSERT INTO FirstTable (message) VALUES ('" + message + "')";
                    int result = stmt.executeUpdate(sql);
                    
                    if (result > 0) {
                        isInserted = true;
                    }
                    
                    stmt.close();
                    conn.close();
                    
                } catch (ClassNotFoundException e) {
                    errorMessage = "JDBC Driver not found: " + e.getMessage();
                } catch (SQLException e) {
                    errorMessage = "Database error: " + e.getMessage();
                } catch (Exception e) {
                    errorMessage = "General error: " + e.getMessage();
                }
            %>
            
            <% if (isInserted) { %>
                <div class="success">
                    <strong>Success!</strong> Record has been inserted successfully into FirstTable.
                    <p>Message inserted: "<%= message %>"</p>
                </div>
            <% } else if (errorMessage != null) { %>
                <div class="error" style="background-color:#f8d7da; color:#721c24; padding:15px; border-radius:5px;">
                    <strong>Error!</strong> <%= errorMessage %>
                </div>
            <% } %>
            
            <div class="steps">
                <h3>Database Connection Status:</h3>
                <ul>
                    <li>Database: CSA3203</li>
                    <li>Table: FirstTable</li>
                    <li>Status: <%= (isInserted) ? "Connected and Inserted Successfully" : "Connection Failed" %></li>
                </ul>
            </div>
        </div>
    </body>
</html>