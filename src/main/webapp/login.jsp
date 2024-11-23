<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
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
            background: linear-gradient(to right, #4facfe, #00f2fe);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
.header {
    width: 100%;
    text-align: center;
    background: #4CAF50;   /* Green background */
    color: white;
    padding: 15px 0;
    font-size: 24px;
    font-weight: bold;
    position: fixed;  /* Fixes the header at the top */
    top: 0;           /* Ensures it's at the top of the screen */
    left: 0;          /* Ensures it spans the full width */
    z-index: 1000;    /* Ensures it stays on top of other elements */
}

        /* Form container styling */
        .login-container {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
            text-align: center;
        }

        /* Heading styling */
        .login-container h2 {
            margin-bottom: 20px;
            color: #333;
        }

        /* Input fields styling */
        .login-container input[type="text"],
        .login-container input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
            background-color: #f9f9f9;
            transition: border-color 0.3s;
        }

        /* Input focus effect */
        .login-container input:focus {
            border-color: #00bcd4;
            outline: none;
        }

        /* Button styling */
        .login-container input[type="submit"] {
            background: #00bcd4;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 10px;
            width: 100%;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
        }

        /* Button hover effect */
        .login-container input[type="submit"]:hover {
            background: #0288d1;
        }

        /* Footer styling */
        .footer {
            text-align: center;
            margin-top: 20px;
            color: white;
            font-size: 14px;
        }
    </style>
</head>
<body>
 <div class="header">User Access Management System</div>
    <!-- Login form container -->
    <div class="login-container">
        <h2>Login</h2>
        <form action="login" method="POST">
            <input type="text" name="username" placeholder="Enter your username" required><br>
            <input type="password" name="password" placeholder="Enter your password" required><br>
            <input type="submit" value="Login">
        </form>
    </div>

    <!-- Footer section -->
    <div class="footer">
        © 2024 User Access Management System
    </div>
</body>
</html>
