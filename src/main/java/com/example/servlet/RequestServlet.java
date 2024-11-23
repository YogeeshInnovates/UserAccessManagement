package com.example.servlet;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
public class RequestServlet extends HttpServlet{
	 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        String username = (String) request.getSession().getAttribute("username");
	        String softwareId = request.getParameter("software_id");
	        
	        String accessType = request.getParameter("access_type");
	        String reason = request.getParameter("reason");

	        // Insert the access request into the database
	        try (Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/user_access_db", "postgres", "yogeesh")) {
	            String sql = "INSERT INTO requests (user_id, software_id, access_type, reason, status) VALUES ((SELECT id FROM users WHERE username = ?), ?, ?, ?, 'Pending')";
	            PreparedStatement stmt = conn.prepareStatement(sql);
	            stmt.setString(1, username);
	            stmt.setInt(2, Integer.parseInt(softwareId));
	            stmt.setString(3, accessType);
	            stmt.setString(4, reason);
	            stmt.executeUpdate();
	            response.sendRedirect("login.jsp");
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
}

