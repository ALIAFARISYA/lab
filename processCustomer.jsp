<%-- 
    Document   : processCustomer
    Created on : 21 Apr 2026, 2:26:54 pm
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Customer Discount Result</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f7f6;
            margin: 0;
            padding: 20px;
        }
        .container {
            width: 100%;
            max-width: 500px;
            margin: 0 auto;
        }
        .card {
            background: #ffffff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }
        .title{
            margin-bottom: 20px;
            padding-left: 15px;
            border-left: 5px solid #6f42c1;
        }
        .form-title {
            color: #6f42c1;
            font-size: 1.8rem;
            font-weight: 600;
            margin-top: 0;
            margin-bottom: 25px;
        }
        .result-group {
            margin-bottom: 15px;
            padding: 8px 0;
        }
        .result-group label {
            display: inline-block;
            font-weight: 600;
            color: #555;
            min-width: 140px;
        }
        .result-group p {
            display: inline-block;
            margin: 0;
            color: #333;
            font-weight: 500;
        }
        .btn-back {
            background-color: #6f42c1;
            color: white;
            border: none;
            padding: 10px 25px;
            border-radius: 4px;
            cursor: pointer;
            font-weight: bold;
            text-decoration: none;
            display: inline-block;
        }
        .btn-back:hover {
            background-color: #5a32a3;
        }
    </style>
</head>
<body>
    
    <div class="container">
        <h1 class="title">Customer Discount Result</h1>
        <div class="card">
            <h1 class="form-title">Transaction Summary</h1>
            
            <%
                // Fixed price per unit
                final double price = 10.0;
                
                // Retrieve form data
                String cust_no = request.getParameter("customerCode");
                String cust_type = request.getParameter("customerType");
                int quantity = 0;
                
                try {
                    quantity = Integer.parseInt(request.getParameter("quantity"));
                } catch (Exception e) {
                    quantity = 0;
                }
                
                // Business logic for discount calculation
                double total = 0;
                String message = "";
                String discountStatus = "";
                
                if (cust_type != null) {
                    if (cust_type.equals("1") && quantity > 100) {
                        message = "You're entitled to 10% discount";
                        discountStatus = "10%";
                        total = quantity * price * 0.9;
                    } else if (cust_type.equals("2") && quantity > 100) {
                        message = "You're entitled to 25% discount";
                        discountStatus = "25%";
                        total = quantity * price * 0.75;
                    } else {
                        message = "You're not entitled to any discount";
                        discountStatus = "0%";
                        total = quantity * price;
                    }
                }
                
                // Display customer type
                String custTypeDisplay = "";
                if (cust_type != null) {
                    custTypeDisplay = cust_type.equals("1") ? "Normal Customer" : "Privilege Customer";
                }
            %>
            
            <div class="result-group">
                <label>Customer Code:</label><br>
                <p><%= cust_no %></p>
            </div>
            <div class="result-group">
                <label>Quantity:</label><br>
                <p><%= quantity %></p>
            </div>
            <div class="result-group">
                <label>Customer Type:</label><br>
                <p><%= custTypeDisplay %></p>
            </div>
            <div class="message">
                <label>Status:</label><br>
                <p><%= message %></p>
            </div>
            
            <div class="result-group">
                <label>Total Amount:</label><br>
                <p>RM <%= String.format("%.2f", total) %></p>
            </div>
            
            <div style="margin-top: 20px;">
                <a href="customer.html" class="btn-back">Back</a>
            </div>
        </div>
    </div>
</body>
</html>