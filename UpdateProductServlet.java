package com.lab.controller;

import com.lab.dao.ProductDAO;
import com.lab.model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UpdateProductServlet extends HttpServlet {
    
    private ProductDAO productDAO;
    
    public void init() {
        productDAO = new ProductDAO();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        int id = Integer.parseInt(request.getParameter("id"));
        
        Product existingProduct = productDAO.selectProduct(id);  
        
        if (existingProduct != null) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Update Product</title>");
            out.println("<style>");
            out.println("body { font-family: Arial, sans-serif; margin: 20px; }");
            out.println(".form-container { width: 400px; margin: 0 auto; padding: 20px; border: 1px solid #ddd; border-radius: 5px; }");
            out.println("input, select { width: 100%; padding: 8px; margin: 5px 0 15px 0; display: inline-block; border: 1px solid #ccc; border-radius: 4px; box-sizing: border-box; }");
            out.println("input[type=submit] { background-color: #4CAF50; color: white; padding: 10px 15px; border: none; border-radius: 4px; cursor: pointer; width: auto; }");
            out.println("input[type=submit]:hover { background-color: #45a049; }");
            out.println("h2 { text-align: center; }");
            out.println("</style>");
            out.println("</head>");
            out.println("<body>");
            
            out.println("<div class='form-container'>");
            out.println("<h2>Update Product</h2>");
            out.println("<form action='UpdateProductServlet' method='POST'>");
            out.println("<input type='hidden' name='id' value='" + existingProduct.getId() + "'>");
            
            out.println("<label for='name'>Product Name:</label>");
            out.println("<input type='text' id='name' name='name' value='" + existingProduct.getName() + "' required>");
            
            out.println("<label for='category'>Category:</label>");
            out.println("<select id='category' name='category'>");
            
            String currentCategory = existingProduct.getCategory();
            out.println("<option value='Electronics' " + (currentCategory.equals("Electronics") ? "selected" : "") + ">Electronics</option>");
            out.println("<option value='Furniture' " + (currentCategory.equals("Furniture") ? "selected" : "") + ">Furniture</option>");
            out.println("<option value='Stationery' " + (currentCategory.equals("Stationery") ? "selected" : "") + ">Stationery</option>");
            out.println("<option value='Clothing' " + (currentCategory.equals("Clothing") ? "selected" : "") + ">Clothing</option>");
            out.println("<option value='Other' " + (currentCategory.equals("Other") ? "selected" : "") + ">Other</option>");
            out.println("</select>");
            
            out.println("<label for='price'>Price (RM):</label>");
            out.println("<input type='number' id='price' name='price' step='0.01' value='" + existingProduct.getPrice() + "' required>");
            
            out.println("<label for='quantity'>Quantity:</label>");
            out.println("<input type='number' id='quantity' name='quantity' value='" + existingProduct.getQuantity() + "' required>");
            
            out.println("<input type='submit' value='Update Product'>");
            out.println("</form>");
            out.println("<br><a href='ViewProductServlet'>← Back to Product List</a>");
            out.println("</div>");
            out.println("</body>");
            out.println("</html>");
        }
    }
    
    // Save updated data
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String category = request.getParameter("category");
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        
        Product product = new Product(id, name, category, price, quantity);
        productDAO.updateProduct(product);  // NO JDBC code here!
        
        response.sendRedirect("ViewProductServlet");
    }
}