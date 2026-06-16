<%-- 
    Document   : insuranceQuotation
    Created on : 21 Apr 2026, 4:00:27 pm
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insurance Quotation System</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f7f6;
            margin: 0;
            padding: 20px;
        }
        .container {
            width: 100%;
            max-width: 600px;
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
        .form-group {
            margin-bottom: 20px;
        }
        label {
            display: block;
            font-weight: bold;
            margin-bottom: 8px;
            color: #555;
        }
        input[type="text"], input[type="number"], select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .radio-group {
            display: flex;
            gap: 20px;
            align-items: center;
        }
        .radio-label {
            font-weight: normal;
            cursor: pointer;
            display: flex;
            align-items: center;
            gap: 5px;
        }
        .btn {
            padding: 10px 25px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-weight: bold;
        }
        .btn-submit {
            background-color: #6f42c1;
            color: white;
        }
        .btn-submit:hover {
            background-color: #5a32a3;
        }
        .btn-reset {
            background-color: #e0e0e0;
            color: #333;
            border: 1px solid #adadad;
        }
        .btn-reset:hover {
            background-color: #d0d0d0;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="title">Insurance Quotation</h1>
        <div class="card">
            <h1 class="form-title">Insurance Calculation</h1>
            <form action="processInsuranceQuo.jsp" method="POST" onsubmit="return validateForm()">
                <div class="form-group">
                    <label>IC No*</label>
                    <input type="text" name="icno" id="icno" required placeholder="e.g., 900101-10-1234">
                </div>
                <div class="form-group">
                    <label>Name*</label>
                    <input type="text" name="name" id="name" required placeholder="Enter name">
                </div>
                <div class="form-group">
                    <label>Market Price*</label>
                    <input type="number" name="price" id="price" step="any" min="0" required placeholder="Price">
                </div>
                <div class="form-group">
                    <label>Coverage Type</label>
                    <select name="coverageDisplay" required>
                        <option value="1">Comprehensive</option>
                        <option value="2">Third Party</option>
                    </select>
                </div>
                <div class="form-group">
                    <label>No Claim Discount (NCD)</label>
                    <select name="ncd" required>
                        <option value="0.10">10%</option>
                        <option value="0.25">25%</option>
                        <option value="0.30">30%</option>
                        <option value="0.35">35%</option>
                        <option value="0.40">40%</option>
                        <option value="0.45">45%</option>
                        <option value="0.50">50%</option>
                        <option value="0.55">55%</option>
                    </select>
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-submit">Submit</button>
                    <button type="reset" class="btn btn-reset">Cancel</button>
                </div>
            </form>
        </div>
    </div>
    
    <script>
        function validateForm() {
            let icno = document.getElementById('icno').value;
            let name = document.getElementById('name').value;
            let price = document.getElementById('price').value;
            
            if (icno.trim() === "") {
                alert("Please enter IC Number");
                return false;
            }
            if (name.trim() === "") {
                alert("Please enter Full Name");
                return false;
            }
            if (price === "" || parseFloat(price) <= 0) {
                alert("Please enter a valid market price");
                return false;
            }
            return true;
        }
    </script>
</body>
</html>