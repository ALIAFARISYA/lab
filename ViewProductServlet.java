package com.lab.controller;

import com.lab.dao.ProductDAO;
import com.lab.model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ViewProductServlet extends HttpServlet {
    
    private ProductDAO productDAO;
    
    public void init() {
        productDAO = new ProductDAO();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        List<Product> productList = productDAO.selectAllProducts(); 
        
        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Product Inventory System</title>");
        out.println("<style>");
        out.println("body { font-family: Arial, sans-serif; margin: 20px; }");
        out.println("table { border-collapse: collapse; width: 100%; }");
        out.println("th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }");
        out.println("th { background-color: #4CAF50; color: white; }");
        out.println("tr:nth-child(even) { background-color: #f2f2f2; }");
        out.println("tr:hover { background-color: #ddd; }");
        out.println(".btn { display: inline-block; padding: 6px 12px; margin: 2px; text-decoration: none; }");
        out.println(".btn-add { background-color: #4CAF50; color: white; padding: 10px 15px; }");
        out.println(".btn-edit { background-color: #2196F3; color: white; }");
        out.println(".btn-delete { background-color: #f44336; color: white; }");
        out.println("</style>");
        out.println("</head>");
        out.println("<body>");
        
        out.println("<h1>Product Inventory System</h1>");
        out.println("<hr>");
        
        out.println("<a href='add_product.html' class='btn btn-add'>+ Add New Product</a>");
        out.println("<br><br>");
        
        out.println("<h2>Product List</h2>");
        out.println("<table>");
        out.println("<tr>");
        out.println("<th>ID</th>");
        out.println("<th>Name</th>");
        out.println("<th>Category</th>");
        out.println("<th>Price (RM)</th>");
        out.println("<th>Quantity</th>");
        out.println("<th>Actions</th>");
        out.println("</tr>");
        
        for (Product product : productList) {
            out.println("<tr>");
            out.println("<td>" + product.getId() + "</td>");
            out.println("<td>" + product.getName() + "</td>");
            out.println("<td>" + product.getCategory() + "</td>");
            out.println("<td>" + String.format("%.2f", product.getPrice()) + "</td>");
            out.println("<td>" + product.getQuantity() + "</td>");
            out.println("<td>");
            out.println("<a href='UpdateProductServlet?id=" + product.getId() + "' class='btn btn-edit'>Edit</a>");
            out.println("<a href='DeleteProductServlet?id=" + product.getId() + "' class='btn btn-delete' onclick='return confirm(\"Are you sure you want to delete this product?\")'>Delete</a>");
            out.println("</td>");
            out.println("</tr>");
        }
        
        out.println("</table>");
        out.println("</body>");
        out.println("</html>");
    }
}