package com.example.servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;

public class LoginServlet extends HttpServlet {


    // Handle GET request: Show login form (login.jsp)
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
        dispatcher.forward(request, response);
    }

    // Handle POST request: Process login form submission
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        System.out.println("LoginServlet - Username: " + username);  // This will print the username to the console
        System.out.println("LoginServlet - Password: " + password);  // This will print the password to the console


        try (Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/user_access_db", "postgres", "yogeesh")) {
            String sql = "SELECT * FROM users WHERE username = ? AND password = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                String role = rs.getString("role");
                
                // Set the session attributes
                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                session.setAttribute("role", role);
                
                
                
                // Redirect based on role
                if ("Employee".equals(role)) {
                	  // Prepare the query to fetch software details
                    String sqll = "SELECT s.id AS software_id, s.name AS software_name FROM software s";

                    try (Connection connn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/user_access_db", "postgres", "yogeesh");
                         PreparedStatement stmts = connn.prepareStatement(sqll);
                         ResultSet rsr = stmts.executeQuery()) { // All resources are declared here

                        // Create a list to store software details
                        List<Map<String, String>> softwareDetails = new ArrayList<>();

                        // Iterate through the result set to get software details
                        while (rsr.next()) {
                            Map<String, String> softwareInfo = new HashMap<>();
                            softwareInfo.put("software_id", rsr.getString("software_id"));
                            softwareInfo.put("software_name", rsr.getString("software_name"));
                            softwareDetails.add(softwareInfo);
                        }

                        // Pass the software details to the JSP
                        request.setAttribute("softwareDetails", softwareDetails);

                        // Redirect to requestAccess.jsp for the employee role
//                        response.sendRedirect("requestAccess.jsp");
                        RequestDispatcher dispatcher = request.getRequestDispatcher("requestAccess.jsp");
                        dispatcher.forward(request, response);

                    } catch (SQLException e) {
                        e.printStackTrace();
                        response.getWriter().write("Error fetching software details: " + e.getMessage());
                    }  // Redirect to employee access request page
                }
                
                
                
                else if ("Manager".equals(role)) {
                	
                    // Query to fetch pending requests
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
                }


                else if ("Admin".equals(role)) {
                    response.sendRedirect("createSoftware.jsp");  // Redirect to admin software creation page
                }
            } else {
                // Login failed: invalid credentials
                response.setContentType("text/html");
                PrintWriter out = response.getWriter();
                out.println("<html>");
                out.println("<body>");
                out.println("<h2>Login Failed</h2>");
                out.println("<p>Invalid username or password. Please try again.</p>");
                out.println("<a href='login'>Go back to login</a>");
                out.println("</body>");
                out.println("</html>");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}


