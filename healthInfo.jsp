<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Arrays"%>
<%@ include file="header.jsp" %>

<div class="card">
    <h2 class="form-title">Health Information - BMI Categories</h2>
    
    <%
        // Store BMI categories using an ArrayList
        ArrayList<String[]> bmiCategories = new ArrayList<String[]>();
        
        // Add category data: [Category, BMI Range, Health Recommendation]
        bmiCategories.add(new String[]{"Underweight", "< 18.5", "Eat nutritious foods, gain muscle mass, consult a dietitian"});
        bmiCategories.add(new String[]{"Normal", "18.5 - 25", "Maintain healthy lifestyle, balanced diet, regular exercise"});
        bmiCategories.add(new String[]{"Overweight", "> 25", "Regular physical activity, portion control, consult healthcare provider"});
        
        // Additional detailed information
        ArrayList<String[]> detailedInfo = new ArrayList<String[]>();
        detailedInfo.add(new String[]{"Underweight Risks", "Osteoporosis, anemia, fertility issues, weakened immune system"});
        detailedInfo.add(new String[]{"Normal Benefits", "Lower risk of chronic diseases, better energy levels, longer life expectancy"});
        detailedInfo.add(new String[]{"Overweight Risks", "Heart disease, diabetes, high blood pressure, joint problems"});
    %>
    
    <h3 style="color: #6f42c1;">BMI Categories Overview</h3>
    
    <table>
        <thead>
            <tr>
                <th>Category</th>
                <th>BMI Range</th>
                <th>Recommendation</th>
            </tr>
        </thead>
        <tbody>
            <%
                for (String[] category : bmiCategories) {
            %>
            <tr>
                <td><strong><%= category[0] %></strong></td>
                <td><%= category[1] %></td>
                <td><%= category[2] %></td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
    
    <h3 style="color: #6f42c1; margin-top: 30px;">Health Risks & Benefits</h3>
    
    <table>
        <thead>
            <tr>
                <th>Condition</th>
                <th>Description</th>
            </tr>
        </thead>
        <tbody>
            <%
                for (String[] info : detailedInfo) {
            %>
            <tr>
                <td><strong><%= info[0] %></strong></td>
                <td><%= info[1] %></td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
    
    <div class="button-group" style="margin-top: 30px;">
        <a href="bmiCalculator.jsp" class="btn btn-submit" style="text-decoration: none;">Calculate Your BMI</a>
    </div>
</div>

<%@ include file="footer.jsp" %>