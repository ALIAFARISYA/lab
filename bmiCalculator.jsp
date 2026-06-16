<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<div class="card">
    <h2 class="form-title">BMI Calculator</h2>
    <form action="processBMI.jsp" method="POST">
        <div class="form-group">
            <label for="weight">Weight (kg):</label>
            <input type="number" id="weight" name="weight" step="0.1" required placeholder="Enter your weight in kg">
        </div>
        <div class="form-group">
            <label for="height">Height (m):</label>
            <input type="number" id="height" name="height" step="0.01" required placeholder="Enter your height in meters">
        </div>
        <div class="button-group">
            <input type="submit" value="Calculate BMI" class="btn btn-submit">
            <input type="reset" value="Clear" class="btn btn-reset">
        </div>
    </form>
</div>

<%@ include file="footer.jsp" %>