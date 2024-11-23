package com.example.servlet;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
public class SignUpServlet extends HttpServlet{
	 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        RequestDispatcher dispatcher = request.getRequestDispatcher("signup.jsp");
	        dispatcher.forward(request, response);
	    }

	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        String username = request.getParameter("username");
	        String password = request.getParameter("password");
	        System.out.println("Received username: " + username);
	        System.out.println("Received password: " + password);
	        // Default role is "Employee"
	        String role =  request.getParameter("role");

	   
	        try (Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/user_access_db", "postgres", "yogeesh")) {
	            System.out.println("Database connected successfully!");

	            String sql = "INSERT INTO users (username, password, role) VALUES (?, ?, ?)";
	            PreparedStatement stmt = conn.prepareStatement(sql);
	            stmt.setString(1, username); // Bind username
	            stmt.setString(2, password); // Bind password
	            stmt.setString(3, role);     // Bind role

	            int rowsAffected = stmt.executeUpdate();
	            System.out.println("Rows affected: " + rowsAffected); // Check how many rows were inserted

	            if (rowsAffected > 0) {
	                response.sendRedirect("login.jsp"); // Redirect to login page if insert is successful
	            } else {
	                response.getWriter().println("Error: User registration failed.");
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	            response.getWriter().println("Database error: " + e.getMessage());
	        }
	        
	      
	    }
}

