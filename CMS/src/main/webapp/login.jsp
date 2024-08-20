<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Form</title>
    <style>
        /* Add your CSS styling here */
        .form-element {
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
    <form action="loginAction" method="post">
        <div class="form-element form-stack">
            <label for="username" class="form-label">Username</label>
            <input type="text" id="username" name="username" required>
        </div>
        <div class="form-element form-stack">
            <label for="password" class="form-label">Password</label>
            <input type="password" id="password" name="password" required>
        </div>
        <div class="form-element form-submit">
            <button type="submit">Login</button>
        </div>
    </form>
</body>
</html>
