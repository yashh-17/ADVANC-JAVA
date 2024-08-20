<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>TransitOccupancy Tracker </title>
    <style>
        /* Add your CSS styles here */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        h1 {
            color: #333;
            margin: 20px 0;
        }
        .operation-buttons {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }
        .operation-buttons button {
            margin-right: 10px;
            padding: 5px 10px;
            background-color: #007bff;
            color: #fff;
            border: 1px solid #007bff;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s, border-color 0.3s, transform 0.3s;
        }
        .operation-buttons button:hover {
            background-color: #0056b3;
            border-color: #0056b3;
            transform: scale(1.1);
        }

    </style>
</head>
<body>
    <h1>Recipes</h1>
    
    <div class="operation-buttons">
        <button onclick="location.href='createRecipe.jsp'">Create </button>
        <button onclick="location.href='listRecipe.jsp'">View </button>
        <button onclick="location.href='updateRecipe.jsp'">Update </button>
        <button onclick="location.href='deleteRecipe.jsp'">Delete </button>
    </div>
</body>
</html>