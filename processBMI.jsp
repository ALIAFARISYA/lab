<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Retrieve form data
    String weightStr = request.getParameter("weight");
    String heightStr = request.getParameter("height");
    
    double weight = 0;
    double height = 0;
    double bmi = 0;
    String category = "";
    String errorMessage = null;
    
    // Validation
    if (weightStr == null || heightStr == null || weightStr.isEmpty() || heightStr.isEmpty()) {
        errorMessage = "Please provide both weight and height values.";
    } else {
        try {
            weight = Double.parseDouble(weightStr);
            height = Double.parseDouble(heightStr);
            
            // Validate numeric and height not zero
            if (height <= 0) {
                errorMessage = "Height must be greater than zero.";
            } else if (weight <= 0) {
                errorMessage = "Weight must be greater than zero.";
            } else {
                // Calculate BMI
                bmi = weight / (height * height);
                
                // Determine BMI category
                if (bmi < 18.5) {
                    category = "Underweight";
                } else if (bmi >= 18.5 && bmi <= 25) {
                    category = "Normal";
                } else {
                    category = "Overweight";
                }
            }
        } catch (NumberFormatException e) {
            errorMessage = "Invalid input. Please enter numeric values only.";
        }
    }
    
    // Forward to result page with parameters
    if (errorMessage != null) {
%>
        <jsp:forward page="resultBMI.jsp">
            <jsp:param name="error" value="<%= errorMessage %>" />
        </jsp:forward>
<%
    } else {
%>
        <jsp:forward page="resultBMI.jsp">
            <jsp:param name="weight" value="<%= weight %>" />
            <jsp:param name="height" value="<%= height %>" />
            <jsp:param name="bmi" value="<%= bmi %>" />
            <jsp:param name="category" value="<%= category %>" />
        </jsp:forward>
<%
    }
%>