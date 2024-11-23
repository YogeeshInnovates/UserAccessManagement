<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Create Software</title>
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
            background: #f5f7fa;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
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
        .form-container {
            width: 100%;
            max-width: 500px;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        /* Form title styling */
        .form-title {
            text-align: center;
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
            color: #4CAF50;
        }

        /* Form styling */
        form {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        form label {
            font-size: 14px;
            font-weight: bold;
            color: #333;
        }

        form input[type="text"],
        form textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
        }

        form textarea {
            resize: none;
            height: 80px;
        }

        form input[type="checkbox"] {
            margin-right: 10px;
        }

        .checkbox-group {
            display: flex;
            gap: 15px;
            align-items: center;
        }

        form input[type="submit"] {
            padding: 10px 15px;
            background: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.3s;
        }

        form input[type="submit"]:hover {
            background: #45a049;
        }

        /* Footer styling */
        .footer {
            text-align: center;
            margin-top: 20px;
            font-size: 12px;
            color: #999;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <div class="form-title">Create Software</div>
        <form action="software" method="POST">
            <label for="name">Software Name:</label>
            <input type="text" id="name" name="name" required>

            <label for="description">Description:</label>
            <textarea id="description" name="description"></textarea>

            <label>Access Levels:</label>
            <div class="checkbox-group">
                <label><input type="checkbox" name="access_levels" value="Read"> Read</label>
                <label><input type="checkbox" name="access_levels" value="Write"> Write</label>
                <label><input type="checkbox" name="access_levels" value="Admin"> Admin</label>
            </div>

            <input type="submit" value="Create Software">
        </form>
        <form action="login.jsp" method="GET">
    <button type="submit" class="bottom-left-btn">Go back to Login Page</button>
</form>
    </div>
    <div class="footer">© 2024 Software Management System.</div>
</body>
</html>
