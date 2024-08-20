<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="org.hibernate.SessionFactory" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="com.example.Book" %>
<%@ page import="com.example.FactoryProvider" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Search Book</title>
    <!-- Linking a Google Font for a more stylish font -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <style>
        /* Add your CSS styles here */
        body {
            font-family: 'Roboto', sans-serif; /* Applying the Google Font */
            background-color: #f9f9f9; /* Setting a light background color */
            margin: 0; /* Remove default margin */
            padding: 0; /* Remove default padding */
        }
        h1 {
            color: #333;
            text-align: center;
            margin-top: 30px; /* Add some top margin */
        }
        form {
            text-align: center; /* Center align the form */
            margin-top: 20px; /* Add some top margin */
        }
        label {
            font-size: 18px; /* Increase label font size */
        }
        input[type="text"] {
            padding: 8px; /* Increase input field padding */
            font-size: 16px; /* Increase input field font size */
            border-radius: 5px; /* Add border radius to input fields */
            border: 1px solid #ccc; /* Add border to input fields */
        }
        button[type="submit"] {
            padding: 10px 20px; /* Increase button padding */
            font-size: 16px; /* Increase button font size */
            border-radius: 5px; /* Add border radius to button */
            background-color: #007bff; /* Blue button color */
            color: #fff; /* White button text color */
            border: none; /* Remove button border */
            cursor: pointer; /* Add cursor pointer on hover */
        }
        button[type="submit"]:hover {
            background-color: #0056b3; /* Darker blue on hover */
        }
        .container {
            text-align: center; /* Center align container */
            margin-top: 20px; /* Add some top margin */
        }
        .btn {
            padding: 10px 20px; /* Increase button padding */
            font-size: 16px; /* Increase button font size */
            border-radius: 5px; /* Add border radius to button */
            background-color: #28a745; /* Green button color */
            color: #fff; /* White button text color */
            border: none; /* Remove button border */
            cursor: pointer; /* Add cursor pointer on hover */
            text-decoration: none; /* Remove default underline */
        }
        .btn:hover {
            background-color: #218838; /* Darker green on hover */
        }
    </style>
</head>
<body>
    <h1>Search for a Book</h1>
    
    <form method="post" action="searchResult.jsp">
        <label for="bookTitle">Enter Book Title:</label>
        <input type="text" id="bookTitle" name="bookTitle" required>
        <button type="submit">Search</button>
    </form>
    
    <div class="container">
        <a href="index.jsp" class="btn">Home</a>
    </div>
</body>
</html>
