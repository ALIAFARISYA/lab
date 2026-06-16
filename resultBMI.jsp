<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<div class="card">
    <h2 class="form-title">BMI Result</h2>
    
    <%
        // Retrieve forwarded parameters
        String error = request.getParameter("error");
        
        if (error != null) {
    %>
        <div style="background-color: #ffcccc; padding: 20px; border-radius: 8px;">
            <p style="color: red; font-weight: bold;">Error: <%= error %></p>
            <div class="button-group">
                <a href="bmiCalculator.jsp" class="btn btn-submit" style="text-decoration: none;">Go Back to Calculator</a>
            </div>
        </div>
    <%
        } else {
            String weightStr = request.getParameter("weight");
            String heightStr = request.getParameter("height");
            String bmiStr = request.getParameter("bmi");
            String category = request.getParameter("category");
            
            double weight = Double.parseDouble(weightStr);
            double height = Double.parseDouble(heightStr);
            double bmi = Double.parseDouble(bmiStr);
            
            // Determine category color
            String categoryColor = "";
            if (category.equals("Underweight")) {
                categoryColor = "#ffc107";
            } else if (category.equals("Normal")) {
                categoryColor = "#28a745";
            } else {
                categoryColor = "#dc3545";
            }
    %>
    
    <div class="result-grid" style="display: grid; grid-template-columns: 1fr; gap: 20px;">
        <div class="result-box" style="background: #f9f9fb; padding: 20px; border-radius: 8px;">
            <h3 style="color: #6f42c1;">Your BMI Information</h3>
            
            <div class="result-group-flex" style="display: flex; justify-content: space-between; margin-bottom: 12px;">
                <label>Weight:</label>
                <p><%= String.format("%.2f", weight) %> kg</p>
            </div>
            
            <div class="result-group-flex" style="display: flex; justify-content: space-between; margin-bottom: 12px;">
                <label>Height:</label>
                <p><%= String.format("%.2f", height) %> m</p>
            </div>
            
            <div class="result-group-flex" style="display: flex; justify-content: space-between; margin-bottom: 12px;">
                <label>BMI Value:</label>
                <p><strong><%= String.format("%.2f", bmi) %></strong></p>
            </div>
            
            <div class="result-group-flex" style="display: flex; justify-content: space-between; margin-bottom: 12px;">
                <label>BMI Category:</label>
                <p style="color: <%= categoryColor %>; font-weight: bold;"><%= category %></p>
            </div>
        </div>
        
        <div class="result-box" style="background: #f9f9fb; padding: 20px; border-radius: 8px;">
            <h3 style="color: #6f42c1;">BMI Category Guide</h3>
            <div class="result-group-flex" style="display: flex; justify-content: space-between; margin-bottom: 12px;">
                <label>Underweight:</label>
                <p>BMI &lt; 18.5</p>
            </div>
            <div class="result-group-flex" style="display: flex; justify-content: space-between; margin-bottom: 12px;">
                <label>Normal:</label>
                <p>18.5 ≤ BMI ≤ 25</p>
            </div>
            <div class="result-group-flex" style="display: flex; justify-content: space-between; margin-bottom: 12px;">
                <label>Overweight:</label>
                <p>BMI &gt; 25</p>
            </div>
        </div>
    </div>
    
    <div class="button-group">
        <a href="bmiCalculator.jsp" class="btn btn-submit" style="text-decoration: none;">Calculate Again</a>
    </div>
    
    <%
        }
    %>
</div>

<%@ include file="footer.jsp" %>