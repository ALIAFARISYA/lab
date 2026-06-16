package com.lab.controller;

import com.lab.dao.UserDAO;
import com.lab.model.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ViewServlet extends HttpServlet {
    
    private UserDAO userDAO;
    
    public void init() {
        userDAO = new UserDAO();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        List<User> listUser = userDAO.selectAllUsers();  // Call DAO
        
        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head><title>User List (Using DAO)</title></head>");
        out.println("<body>");
        out.println("<h2>User List (Using DAO Pattern)</h2>");
        out.println("<table border='1'>");
        out.println("<tr><th>ID</th><th>Username</th><th>Password</th><th>Role</th><th>Actions</th></tr>");
        
        for (User user : listUser) {
            out.println("<tr>");
            out.println("<td>" + user.getId() + "</td>");
            out.println("<td>" + user.getUsername() + "</td>");
            out.println("<td>" + user.getPassword() + "</td>");
            out.println("<td>" + user.getRoles() + "</td>");
            out.println("<td><a href='UpdateServlet?id=" + user.getId() + "'>Edit</a> | ");
            out.println("<a href='DeleteServlet?id=" + user.getId() + "' onclick='return confirm(\"Are you sure?\")'>Delete</a></td>");
            out.println("</tr>");
        }
        
        out.println("</table>");
        out.println("<br><a href='index.html'>Add New User</a>");
        out.println("</body>");
        out.println("</html>");
    }
}