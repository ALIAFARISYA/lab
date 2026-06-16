<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Lab 6 - Task 3 - Student Registration</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 500px;
            margin: 0 auto;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h1 {
            color: #333;
            text-align: center;
        }
        label {
            display: block;
            margin-top: 10px;
            font-weight: bold;
        }
        input[type="text"], select {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .buttons {
            margin-top: 20px;
            text-align: center;
        }
        input[type="submit"], input[type="reset"] {
            padding: 10px 20px;
            margin: 0 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
        }
        input[type="reset"] {
            background-color: #f44336;
            color: white;
        }
        .note {
            font-size: 12px;
            color: #666;
            margin-top: 5px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Student Registration Form</h1>
        <form action="processStudent.jsp" method="post">
            <label for="stuno">Student Number:</label>
            <input type="text" name="stuno" id="stuno" required 
                   pattern="[A-Z]{2}[0-9]{5}" 
                   title="Must start with 2 capital letters followed by 5 numbers (e.g., UK12345)">
            <div class="note">Format: 2 capital letters + 5 numbers (e.g., UK12345)</div>

            <label for="stuname">Student Name:</label>
            <input type="text" name="stuname" id="stuname" required>

            <label for="stuprogram">Program:</label>
            <select name="stuprogram" id="stuprogram" required>
                <option value="">-- Select Program --</option>
                <option value="BSc in Computer Science">BSc in Computer Science</option>
                <option value="BSc in Software Engineering">BSc in Software Engineering</option>
                <option value="BSc in Information Technology">BSc in Information Technology</option>
                <option value="BSc in Data Science">BSc in Data Science</option>
                <option value="BSc in Robotics">BSc in Robotics</option>
            </select>

            <div class="buttons">
                <input type="submit" value="Register">
                <input type="reset" value="Clear">
            </div>
        </form>
    </div>
</body>
</html>