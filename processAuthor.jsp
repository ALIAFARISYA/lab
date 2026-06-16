<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="lab6.com.Author"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Process Author Registration</title>
    </head>
    <body>
        <div class="container">
            <h1>Author Registration Processing</h1>
            
            <%-- Use JSP Standard Action to create Author object --%>
            <jsp:useBean id="author" class="lab6.com.Author" scope="page" />
            
            <%-- Assign data from insertAuthor.jsp into author's bean --%>
            <jsp:setProperty name="author" property="*" />
            
            <div class="info">
                <h3>Author Information Submitted:</h3>
                <p><strong>Author No:</strong> <jsp:getProperty name="author" property="authno" /></p>
                <p><strong>Name:</strong> <jsp:getProperty name="author" property="name" /></p>
                <p><strong>Address:</strong> <jsp:getProperty name="author" property="address" /></p>
                <p><strong>City:</strong> <jsp:getProperty name="author" property="city" /></p>
                <p><strong>State:</strong> <jsp:getProperty name="author" property="state" /></p>
                <p><strong>Zip Code:</strong> <jsp:getProperty name="author" property="zip" /></p>
            </div>
            
            <%
                // Database connection parameters
                String url = "jdbc:mysql://localhost:3306/CSA3203";
                String dbUsername = "root";
                String dbPassword = "admin";
                boolean isInserted = false;
                String errorMessage = null;
                
                try {
                    // Load JDBC Driver
                    Class.forName("com.mysql.jdbc.Driver");
                    
                    // Create connection
                    Connection conn = DriverManager.getConnection(url, dbUsername, dbPassword);
                    
                    // Create PreparedStatement
                    String sql = "INSERT INTO Author (authno, name, address, city, state, zip) VALUES (?, ?, ?, ?, ?, ?)";
                    PreparedStatement pstmt = conn.prepareStatement(sql);
                    
                    // Set parameters
                    pstmt.setString(1, author.getAuthno());
                    pstmt.setString(2, author.getName());
                    pstmt.setString(3, author.getAddress());
                    pstmt.setString(4, author.getCity());
                    pstmt.setString(5, author.getState());
                    pstmt.setString(6, author.getZip());
                    
                    // Execute query
                    int result = pstmt.executeUpdate();
                    
                    if (result > 0) {
                        isInserted = true;
                    }
                    
                    // Close connections
                    pstmt.close();
                    conn.close();
                    
                } catch (ClassNotFoundException e) {
                    errorMessage = "JDBC Driver not found: " + e.getMessage();
                } catch (SQLException e) {
                    if (e.getMessage().contains("Duplicate entry")) {
                        errorMessage = "Author No already exists. Please use a unique Author No.";
                    } else {
                        errorMessage = "Database error: " + e.getMessage();
                    }
                } catch (Exception e) {
                    errorMessage = "General error: " + e.getMessage();
                }
            %>
            
            <% if (isInserted) { %>
                <div class="success">
                    <strong>Success!</strong> Author record has been successfully saved to the database.
                    <p>Record for <strong><%= author.getName() %></strong> (Author No: <%= author.getAuthno() %>) has been inserted.</p>
                </div>
            <% } else if (errorMessage != null) { %>
                <div class="error">
                    <strong>Error!</strong> <%= errorMessage %>
                </div>
            <% } %>
            
            <a href="insertAuthor.jsp" class="btn-back">Register Another Author</a>
        </div>
    </body>
</html>