<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Request Access</title>
    <style>
        /* General Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        /* Background styling */
        body {
            background: linear-gradient(to bottom, #74ebd5, #9face6);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }
 .bottom-left-btn {
            position: fixed;
            bottom: 20px;
            left: 20px;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            font-size: 16px;
            border: none;
            cursor: pointer;
            border-radius: 5px;
        }

        .bottom-left-btn:hover {
            background-color: #45a049;
        }
        /* Form container styling */
        .request-access-container {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 450px;
            text-align: center;
        }

        /* Heading styling */
        .request-access-container h2 {
            margin-bottom: 20px;
            color: #333;
            font-size: 24px;
        }

        /* Input fields styling */
        .request-access-container select,
        .request-access-container textarea,
        .request-access-container input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
            background-color: #f9f9f9;
            transition: border-color 0.3s;
        }

        /* Select and textarea focus effect */
        .request-access-container select:focus,
        .request-access-container textarea:focus {
            border-color: #5e60ce;
            outline: none;
        }

        /* Textarea customization */
        .request-access-container textarea {
            resize: none;
            height: 100px;
        }

        /* Button styling */
        .request-access-container input[type="submit"] {
            background: #5e60ce;
            color: white;
            border: none;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
        }

        /* Button hover effect */
        .request-access-container input[type="submit"]:hover {
            background: #4a4bb8;
        }

        /* Footer styling */
        .footer {
            text-align: center;
            margin-top: 20px;
            color: #333;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <!-- Request Access form container -->
    <div class="request-access-container">
        <h2>Request Access</h2>
        <form action="requestAccess" method="POST">
            <!-- Software Selection -->
            <select name="software_id" required>
                <c:forEach var="software" items="${softwareDetails}">
                    <option value="${software.software_id}">${software.software_name}</option>
                </c:forEach>
            </select>

            <!-- Access Type Selection -->
            <select name="access_type" required>
                <option value="Read">Read</option>
                <option value="Write">Write</option>
                <option value="Admin">Admin</option>
            </select>

            <!-- Reason for Access -->
            <textarea name="reason" placeholder="Enter your reason for access..." required></textarea>

            <!-- Submit Button -->
            <input type="submit" value="Request Access">
        </form>
    </div>
  <form action="login.jsp" method="GET">
    <button type="submit" class="bottom-left-btn">Go back to Login Page</button>
</form>
    <!-- Footer section -->
    <div class="footer">
        © 2024 Access Request System
    </div>
</body>
</html>
