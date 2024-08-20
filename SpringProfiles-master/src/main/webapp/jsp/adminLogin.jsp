<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <style>
        /* Resetting default browser styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* Body styles */
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            padding: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        /* Form container styles */
        .form-container {
            width: 300px;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        /* Heading styles */
        h1 {
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }

        /* Form styles */
        form {
            text-align: center;
        }

        label {
            display: block;
            margin-bottom: 5px;
            color: #333;
        }

        input[type="text"],
        input[type="password"] {
            width: calc(100% - 12px);
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
            transition: border-color 0.3s;
            margin-bottom: 10px;
        }

        input[type="text"]:focus,
        input[type="password"]:focus {
            border-color: #666;
        }

        input[type="submit"] {
            background-color: #333;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #666;
        }

        /* Error message styles */
        .error {
            color: red;
            margin-top: 10px;
        }
    </style>
</head>
<body>
<div class="form-container">
    <h1>Login</h1>
    <form action="authenticate" method="post">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required><br><br>
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required><br><br>
        <c:if test="${not empty error}">
            <div class="error">${error}</div>
        </c:if>
        <input type="submit" value="Login">
    </form>
</div>
</body>
</html>
