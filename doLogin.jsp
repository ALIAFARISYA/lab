<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Processing Login</title>
</head>
<body>
    <%
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        String driver = "com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/CSA3023";
        String dbUsername = "root";
        String dbPassword = "admin";
        
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean isValid = false;
        String firstname = "";
        String lastname = "";
        
        try {
            Class.forName(driver);
            conn = DriverManager.getConnection(url, dbUsername, dbPassword);
            
            String sql = "SELECT * FROM userprofile WHERE username = ? AND password = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, username);
            pstmt.setString(2, password);
            
            rs = pstmt.executeQuery();
            
            if (rs.next()) {
                isValid = true;
                firstname = rs.getString("firstname");
                lastname = rs.getString("lastname");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch (SQLException e) {}
            if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
            if (conn != null) try { conn.close(); } catch (SQLException e) {}
        }
        
        if (isValid) {
            // Store user info in session
            session.setAttribute("username", username);
            session.setAttribute("firstname", firstname);
            session.setAttribute("lastname", lastname);
            
            // Redirect to main.jsp
            response.sendRedirect("main.jsp");
        } else {
            // Redirect back to login with error message
            response.sendRedirect("login.jsp?error=invalid");
        }
    %>
</body>
</html>