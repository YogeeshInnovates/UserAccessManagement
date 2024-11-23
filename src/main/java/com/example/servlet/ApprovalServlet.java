package com.example.servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ApprovalServlet extends HttpServlet {
	  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        int requestId = Integer.parseInt(request.getParameter("request_id"));
	        String action = request.getParameter("action");

	        // Update request status in the database
	        String status = "Approve".equals(action) ? "Approved" : "Rejected";

	        try (Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/user_access_db", "postgres", "yogeesh")) {
	            String sql = "UPDATE requests SET status = ? WHERE id = ?";
	            PreparedStatement stmt = conn.prepareStatement(sql);
	            stmt.setString(1, status);
	            stmt.setInt(2, requestId);
	            stmt.executeUpdate();
	            
	            String sqll = "SELECT r.id AS request_id, u.username AS employee_name, s.name AS software_name, r.access_type, r.reason " +
                        "FROM requests r " +
                        "JOIN users u ON r.user_id = u.id " +
                        "JOIN software s ON r.software_id = s.id " +
                        "WHERE r.status = 'Pending'";

          try (Connection connn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/user_access_db", "postgres", "yogeesh");
               PreparedStatement stmts = connn.prepareStatement(sqll);
               ResultSet rsr = stmts.executeQuery()) { // All resources are declared here

              // Create a list to store pending requests
              List<Map<String, String>> pendingRequests = new ArrayList<>();

              // Iterate through the result set
              while (rsr.next()) {
                  Map<String, String> requestDetails = new HashMap<>();
                  requestDetails.put("request_id", rsr.getString("request_id")); // Corrected to 'rsr'
                  requestDetails.put("employee_name", rsr.getString("employee_name"));
                  requestDetails.put("software_name", rsr.getString("software_name"));
                  requestDetails.put("access_type", rsr.getString("access_type"));
                  requestDetails.put("reason", rsr.getString("reason"));
                  pendingRequests.add(requestDetails);
              }

              // Pass the pending requests data to the JSP
              request.setAttribute("pendingRequests", pendingRequests);
            
              RequestDispatcher dispatcher = request.getRequestDispatcher("pendingRequests.jsp");
              dispatcher.forward(request, response);

          } catch (SQLException e) {
              e.printStackTrace();
              response.getWriter().write("Error fetching pending requests: " + e.getMessage());
          }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
}
