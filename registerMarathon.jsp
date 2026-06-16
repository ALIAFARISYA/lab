<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Marathon Registration</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            margin: 0;
            padding: 20px;
            min-height: 100vh;
        }
        .container {
            max-width: 550px;
            margin: 0 auto;
            background: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 20px 40px rgba(0,0,0,0.2);
        }
        h1 {
            color: #333;
            text-align: center;
            margin-bottom: 10px;
        }
        .subtitle {
            text-align: center;
            color: #666;
            margin-bottom: 30px;
            padding-bottom: 20px;
            border-bottom: 2px solid #667eea;
        }
        label {
            display: block;
            margin-top: 15px;
            font-weight: 600;
            color: #333;
        }
        input[type="text"], input[type="email"], select {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-sizing: border-box;
            font-size: 14px;
        }
        input:focus, select:focus {
            outline: none;
            border-color: #667eea;
            box-shadow: 0 0 5px rgba(102,126,234,0.3);
        }
        .radio-group {
            margin-top: 10px;
        }
        .radio-group label {
            display: inline-block;
            margin-right: 20px;
            font-weight: normal;
        }
        .radio-group input {
            width: auto;
            margin-right: 5px;
        }
        .buttons {
            margin-top: 30px;
            text-align: center;
        }
        input[type="submit"], input[type="reset"] {
            padding: 12px 30px;
            margin: 0 10px;
            border: none;
            border-radius: 25px;
            cursor: pointer;
            font-size: 16px;
            transition: transform 0.2s;
        }
        input[type="submit"] {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
        }
        input[type="reset"] {
            background-color: #f44336;
            color: white;
        }
        input[type="submit"]:hover, input[type="reset"]:hover {
            transform: scale(1.02);
        }
        .view-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #667eea;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Marathon 2026</h1>
        <div class="subtitle">Register for the Annual Charity Marathon</div>
        
        <form action="processMarathon.jsp" method="post">
            <label for="fullname">Full Name:</label>
            <input type="text" name="fullname" id="fullname" required>

            <label for="email">Email Address:</label>
            <input type="email" name="email" id="email" required>

            <label for="phone">Phone Number:</label>
            <input type="text" name="phone" id="phone" required>

            <label for="category">Race Category:</label>
            <select name="category" id="category" required>
                <option value="">-- Select Category --</option>
                <option value="5km Fun Run">5km Fun Run (RM 30)</option>
                <option value="10km Competitive">10km Competitive (RM 50)</option>
                <option value="21km Half Marathon">21km Half Marathon (RM 80)</option>
                <option value="42km Full Marathon">42km Full Marathon (RM 120)</option>
            </select>

            <label>T-Shirt Size:</label>
            <div class="radio-group">
                <label><input type="radio" name="tshirt_size" value="XS" required> XS</label>
                <label><input type="radio" name="tshirt_size" value="S"> S</label>
                <label><input type="radio" name="tshirt_size" value="M"> M</label>
                <label><input type="radio" name="tshirt_size" value="L"> L</label>
                <label><input type="radio" name="tshirt_size" value="XL"> XL</label>
                <label><input type="radio" name="tshirt_size" value="XXL"> XXL</label>
            </div>

            <div class="buttons">
                <input type="submit" value="Register Now">
                <input type="reset" value="Clear Form">
            </div>
        </form>
        
        <a href="viewMarathon.jsp" class="view-link">View All Registrations</a>
    </div>
</body>
</html>