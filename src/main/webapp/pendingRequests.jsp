<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Pending Requests</title>
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
            background: #f3f4f6;
            padding: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
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
        /* Container styling */
        .container {
            width: 100%;
            max-width: 1000px;
            background: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }

        /* Header styling */
        .header {
            background: #4CAF50;
            color: white;
            padding: 20px;
            text-align: center;
            font-size: 24px;
            font-weight: bold;
        }

        /* Table styling */
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }

        table th,
        table td {
            text-align: left;
            padding: 12px 15px;
        }

        table thead th {
            background: #4CAF50;
            color: white;
            font-weight: bold;
            border-bottom: 2px solid #e0e0e0;
        }

        table tbody tr:nth-child(odd) {
            background: #f9f9f9;
        }

        table tbody tr:nth-child(even) {
            background: #fff;
        }

        /* Action buttons styling */
        .action-buttons button {
            padding: 8px 12px;
            border: none;
            border-radius: 5px;
            font-size: 14px;
            cursor: pointer;
            margin-right: 5px;
            transition: background-color 0.3s ease;
        }

        .action-buttons button[type="submit"][value="Approve"] {
            background-color: #4CAF50;
            color: white;
        }

        .action-buttons button[type="submit"][value="Approve"]:hover {
            background-color: #45a049;
        }

        .action-buttons button[type="submit"][value="Reject"] {
            background-color: #f44336;
            color: white;
        }

        .action-buttons button[type="submit"][value="Reject"]:hover {
            background-color: #e41e26;
        }

        /* Footer styling */
        .footer {
            text-align: center;
            padding: 10px;
            background: #4CAF50;
            color: white;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <!-- Main Container -->
    <div class="container">
        <!-- Header -->
        <div class="header">Pending Requests</div>

        <!-- Table Section -->
        <table>
            <thead>
                <tr>
                    <th>Employee Name</th>
                    <th>Software Name</th>
                    <th>Access Type</th>
                    <th>Reason</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <!-- Dynamic Data Iteration -->
                <c:forEach var="request" items="${pendingRequests}">
                    <tr>
                        <td>${request.employee_name}</td>
                        <td>${request.software_name}</td>
                        <td>${request.access_type}</td>
                        <td>${request.reason}</td>
                        <td class="action-buttons">
                            <form action="approvalServlet" method="post" style="display:inline;">
                                <input type="hidden" name="request_id" value="${request.request_id}" />
                                <button type="submit" name="action" value="Approve">Approve</button>
                                <button type="submit" name="action" value="Reject">Reject</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
 <form action="login.jsp" method="GET">
    <button type="submit" class="bottom-left-btn">Go back to Login Page</button>
</form>
    <!-- Footer -->
    <div class="footer">
        © 2024 Pending Requests System.
    </div>
</body>
</html>
