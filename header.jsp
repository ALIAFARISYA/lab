<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BMI Calculator Application</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f7f6;
            margin: 0;
            padding: 20px;
            display: block;
        }
        .container {
            width: 100%;
            max-width: 900px;
            margin: 0 auto;
        }
        h1 {
            font-size: 1.8rem;
            color: #333;
            margin-bottom: 20px;
            border-left: 5px solid #6f42c1;
            padding-left: 15px;
        }
        .card {
            background: #ffffff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }
        .form-title {
            color: #6f42c1;
            font-family: 'Segoe UI', Roboto, Helvetica, Arial, sans-serif;
            font-size: 1.8rem;
            font-weight: 600;
            letter-spacing: -0.5px;
            margin-top: 0;
            margin-bottom: 25px;
            text-transform: capitalize;
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
        input[type="text"], 
        input[type="number"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .button-group {
            margin-top: 30px;
            display: flex;
            gap: 10px;
        }
        .btn {
            padding: 10px 25px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-weight: bold;
            transition: 0.3s;
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
            background-color: #ffcccc;
        }
        nav {
            background: #6f42c1;
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 20px;
        }
        nav a {
            color: white;
            text-decoration: none;
            padding: 10px 20px;
            margin: 0 5px;
            border-radius: 4px;
            transition: 0.3s;
        }
        nav a:hover {
            background-color: #5a32a3;
        }
        .error {
            color: red;
            font-size: 0.9em;
            margin-top: 5px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: left;
        }
        th {
            background-color: #6f42c1;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f9f9fb;
        }
    </style>
</head>
<body>
    <div class="container">
        <nav>
            <a href="bmiCalculator.jsp">BMI Calculator</a>
            <a href="healthInfo.jsp">Health Information</a>
        </nav>