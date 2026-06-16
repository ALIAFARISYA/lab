<%-- 
    Document   : processCurrency
    Created on : 21 Apr 2026, 3:18:01 pm
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Currency Conversion Result</title>
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
            border-bottom: 1px dashed #e0e0e0;
        }
        .result-group label {
            display: inline-block;
            font-weight: 600;
            color: #555;
            min-width: 180px;
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
    <%!
        // Define constant exchange rates (JSP Declaration)
        final double USD = 0.25;    // 1 RM = 0.25 USD
        final double EURO = 0.21;   // 1 RM = 0.21 EURO
        final double JPY = 40.0;     // 1 RM = 40 JPY
        final double SGD = 0.32;     // 1 RM = 0.32 SGD
        
        // Method to calculate conversion (JSP Declaration)
        private double calculateRate(String currency, double amount) {
            double currencyChange = 0.0;
            
            if (currency != null) {
                if (currency.equals("1")) {
                    currencyChange = amount * USD;
                } else if (currency.equals("2")) {
                    currencyChange = amount * EURO;
                } else if (currency.equals("3")) {
                    currencyChange = amount * JPY;
                } else if (currency.equals("4")) {
                    currencyChange = amount * SGD;
                }
            }
            return currencyChange;
        }
    %>
    
    <div class="container">
        <h1 class="title">JSP Application Result</h1>
        <div class="card">
            <h1 class="form-title">Conversion Result</h1>
            
            <%
                // JSP Scriptlet - Retrieve and process data
                String currencyType = request.getParameter("currencyType");
                String amountRaw = request.getParameter("amount");
                double amount = 0;
                double total = 0;
                
                try {
                    if (amountRaw != null) {
                        amount = Double.parseDouble(amountRaw);
                        total = calculateRate(currencyType, amount);
                    }
                } catch (Exception e) {
                    amount = 0;
                }
                
                // Determine currency name for display
                String currencyName = "N/A";
                String currencySymbol = "";
                if ("1".equals(currencyType)) {
                    currencyName = "USD";
                } else if ("2".equals(currencyType)) {
                    currencyName = "EUR";
                } else if ("3".equals(currencyType)) {
                    currencyName = "JPY";
                } else if ("4".equals(currencyType)) {
                    currencyName = "SGD";
                }
            %>
            
            <div class="result-group">
                <label>Amount in Ringgit Malaysia (RM):</label><br>
                <p>RM <%= String.format("%.2f", amount) %></p>
            </div>
            <div class="result-group">
                <label>Converted to (<%= currencyName %>):</label><br>
                <p><%= String.format("%.2f", total) %></p>
            </div>
            
            <div style="margin-top: 20px;">
                <a href="currencyConversion.html" class="btn-back">New Conversion</a>
            </div>
        </div>
    </div>
</body>
</html>