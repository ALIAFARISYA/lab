<%-- 
    Document   : processInsuranceQuo
    Created on : 21 Apr 2026, 4:00:58 pm
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insurance Quotation Result</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f7f6;
            margin: 0;
            padding: 20px;
        }
        .container {
            width: 100%;
            max-width: 700px;
            margin: 0 auto;
        }
        .card {
            background: #ffffff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }
        .form-title {
            color: #6f42c1;
            font-size: 1.8rem;
            font-weight: 600;
            margin-top: 0;
            margin-bottom: 25px;
            border-left: 5px solid #6f42c1;
            padding-left: 15px;
        }
        .result-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
            margin-bottom: 25px;
        }
        .result-box {
            background: #f9f9fb;
            padding: 20px;
            border-radius: 8px;
            border: 1px solid #e0e0e0;
        }
        .result-box h3 {
            margin-top: 0;
            margin-bottom: 20px;
            color: #6f42c1;
            font-size: 1.3rem;
            border-bottom: 2px solid #6f42c1;
            padding-bottom: 10px;
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
            min-width: 140px;
        }
        .result-group p {
            display: inline-block;
            margin: 0;
            color: #333;
            font-weight: 500;
        }
        .total-amount {
            background-color: #6f42c1;
            color: white;
            padding: 15px;
            border-radius: 8px;
            text-align: center;
            margin-top: 20px;
        }
        .total-amount label {
            font-size: 1.2rem;
            font-weight: bold;
        }
        .total-amount p {
            font-size: 1.8rem;
            font-weight: bold;
            margin: 10px 0 0 0;
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
            margin-top: 20px;
        }
        .btn-back:hover {
            background-color: #5a32a3;
        }
        .error-message {
            background-color: #f8d7da;
            color: #721c24;
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 20px;
            border-left: 4px solid #dc3545;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="card">
            <h1 class="form-title">Insurance Quotation Result</h1>
            
            <%
                String icno = request.getParameter("icno");
                String name = request.getParameter("name");
                String coverage = request.getParameter("coverageDisplay");  // ← FIXED: match with form
                String ncdStr = request.getParameter("ncd");
                String priceStr = request.getParameter("price");
                
                double price = 0;
                double ncd = 0;
                boolean hasError = false;
                String errorMessage = "";
                
                System.out.println("Coverage value: " + coverage);
                System.out.println("Price: " + priceStr);
                System.out.println("NCD: " + ncdStr);
                
                try {
                    if (priceStr != null && !priceStr.isEmpty()) {
                        price = Double.parseDouble(priceStr);
                    } else {
                        hasError = true;
                        errorMessage = "Vehicle price is required.";
                    }
                    
                    if (ncdStr != null && !ncdStr.isEmpty()) {
                        ncd = Double.parseDouble(ncdStr);
                    } else {
                        hasError = true;
                        errorMessage = "NCD selection is required.";
                    }
                    
                    if (icno == null || icno.trim().isEmpty()) {
                        hasError = true;
                        errorMessage = "IC Number is required.";
                    }
                    
                    if (name == null || name.trim().isEmpty()) {
                        hasError = true;
                        errorMessage = "Name is required.";
                    }
                    
                    if (coverage == null || coverage.trim().isEmpty()) {
                        hasError = true;
                        errorMessage = "Coverage type is required.";
                    }
                    
                } catch (NumberFormatException e) {
                    hasError = true;
                    errorMessage = "Invalid number format. Please check your input.";
                } catch (Exception e) {
                    hasError = true;
                    errorMessage = "Invalid input. Please check your data.";
                }
                
                if (!hasError) {
                    double rate = 0;
                    String coverageDisplay = "";
                    
                    if ("1".equals(coverage)) { 
                        rate = 0.05; 
                        coverageDisplay = "Comprehensive";
                    } else if ("2".equals(coverage)) {  
                        rate = 0.03; 
                        coverageDisplay = "Third Party";
                    } else {
                        rate = 0.03;
                        coverageDisplay = "Third Party";
                    }
                    
                    double insurance = price * rate;
                    
                    double discount = insurance * ncd;
                    double afterNCD = insurance - discount;
                    
                    double sst = afterNCD * 0.08;
                    double finalAmount = afterNCD + sst;
                    
                    int ncdPercentage = (int)(ncd * 100);
            %>
            
            <div class="result-box">
                <h3>Personal Information</h3>
                <div class="result-group">
                    <label>IC No:</label>
                    <p><%= icno %></p>
                </div>
                <div class="result-group">
                    <label>Name:</label>
                    <p><%= name %></p>
                </div>
            </div>
            
            <div class="result-box">
                <h3>Insurance Calculation</h3>
                <div class="result-group">
                    <label>Market Price:</label>
                    <p>RM <%= String.format("%,.2f", price) %></p>
                </div>
                <div class="result-group">
                    <label>Coverage Type:</label>
                    <p><%= coverageDisplay %></p>
                </div>
                <div class="result-group">
                    <label>NCD:</label>
                    <p><%= ncd %>%</p>
                </div>
                <div class="result-group">
                    <label>Base Insurance:</label>
                    <p>RM <%= String.format("%,.2f", insurance) %></p>
                </div>
                <div class="result-group">
                    <label>NCD Discount (<%= ncdPercentage %>%):</label>
                    <p>- RM <%= String.format("%,.2f", discount) %></p>
                </div>
                <div class="result-group">
                    <label>After NCD:</label>
                    <p>RM <%= String.format("%,.2f", afterNCD) %></p>
                </div>
                <div class="result-group">
                    <label>SST (8%):</label>
                    <p>RM <%= String.format("%,.2f", sst) %></p>
                </div>
                <div class="result-group">
                    <label><strong>Final Insurance Amount:</strong></label><br>
                    <p>RM <%= String.format("%,.2f", finalAmount) %></p>
                </div>
            </div>
            <%
                } else {
            %>
            
            <div class="error-message">
                <strong>Error:</strong> <%= errorMessage %>
                <p>Please go back and try again.</p>
            </div>
            
            <%
                }
            %>
            
            <div style="text-align: center;">
                <a href="insuranceQuotation.jsp" class="btn-back">Back</a>
            </div>
        </div>
    </div>
</body>
</html>