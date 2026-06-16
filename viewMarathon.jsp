<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="lab6.com.Marathon, lab6.com.MarathonDAO, java.util.List"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>View Marathon Registrations</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            margin: 0;
            padding: 20px;
            min-height: 100vh;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            background: white;
            padding: 25px;
            border-radius: 15px;
            box-shadow: 0 20px 40px rgba(0,0,0,0.2);
        }
        h1 {
            text-align: center;
            color: #333;
        }
        .subtitle {
            text-align: center;
            color: #666;
            margin-bottom: 30px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }
        th {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
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
        .stats {
            background-color: #e2f0fb;
            padding: 15px;
            border-radius: 10px;
            margin-bottom: 20px;
            display: flex;
            justify-content: space-around;
            text-align: center;
        }
        .stat-box {
            text-align: center;
        }
        .stat-number {
            font-size: 28px;
            font-weight: bold;
            color: #667eea;
        }
        .stat-label {
            color: #666;
        }
        .btn {
            display: inline-block;
            padding: 10px 25px;
            margin-top: 20px;
            border-radius: 25px;
            text-decoration: none;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            transition: transform 0.2s;
        }
        .btn:hover {
            transform: scale(1.02);
        }
        .delete-btn {
            background-color: #f44336;
            color: white;
            padding: 5px 10px;
            border-radius: 5px;
            text-decoration: none;
            font-size: 12px;
        }
        .delete-btn:hover {
            background-color: #d32f2f;
        }
        .no-records {
            text-align: center;
            padding: 40px;
            color: #666;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Marathon Registrations</h1>
        <div class="subtitle">List of all registered participants</div>
        
        <%
            MarathonDAO dao = new MarathonDAO();
            List<Marathon> marathons = dao.getAllMarathons();
            int totalReg = dao.getTotalRegistrations();
        %>
        
        <div class="stats">
            <div class="stat-box">
                <div class="stat-number"><%= totalReg %></div>
                <div class="stat-label">Total Registrations</div>
            </div>
            <div class="stat-box">
                <div class="stat-number">4</div>
                <div class="stat-label">Race Categories</div>
            </div>
            <div class="stat-box">
                <div class="stat-number">6</div>
                <div class="stat-label">T-Shirt Sizes</div>
            </div>
        </div>
        
        <% if (marathons.isEmpty()) { %>
            <div class="no-records">
                <h3>No registrations found.</h3>
                <p>Be the first to register for the marathon!</p>
            </div>
        <% } else { %>
        
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Full Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Category</th>
                    <th>T-Shirt</th>
                    <th>Registration Date</th>
                    <th>Fee</th>
                </tr>
            </thead>
            <tbody>
                <% for (Marathon m : marathons) { %>
                <tr>
                    <td><%= m.getId() %></td>
                    <td><%= m.getFullname() %></td>
                    <td><%= m.getEmail() %></td>
                    <td><%= m.getPhone() %></td>
                    <td><%= m.getCategory() %></td>
                    <td><%= m.getTshirtSize() %></td>
                    <td><%= m.getRegistrationDate() %></td>
                    <td>RM <%= String.format("%.2f", m.getFee()) %></td>
                </tr>
                <% } %>
            </tbody>
        </table>
        
        <% } %>
        
        <div style="text-align: center;">
            <a href="registerMarathon.jsp" class="btn">+ New Registration</a>
        </div>
    </div>
</body>
</html>