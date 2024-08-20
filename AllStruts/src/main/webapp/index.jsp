<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Library Management</title>
    <style>
        /* Add your CSS styles here */
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f2f5;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            text-align: center;
        }
        h1 {
            color: #333;
            font-size: 2.5rem;
            margin-bottom: 30px;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.2);
            animation: fadeIn 1s ease;
        }
        .operation-links {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
        }
        .operation-links a {
            margin: 10px;
            text-decoration: none;
            padding: 15px 30px;
            background-color: #007bff;
            color: #fff;
            border: 1px solid #007bff;
            border-radius: 5px;
            display: inline-block;
            box-shadow: 0px 2px 5px 0px rgba(0,0,0,0.3);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            animation: fadeIn 1s ease;
        }
        .operation-links a:hover {
            transform: translateY(-5px);
            box-shadow: 0px 5px 10px 0px rgba(0,0,0,0.4);
        }

        @keyframes fadeIn {
            0% {
                opacity: 0;
            }
            100% {
                opacity: 1;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Library Management</h1>
        
        <div class="operation-links">
            <s:a href="addBook.jsp">Add Book</s:a>
            <s:a href="displayBooks.jsp">Display Books</s:a>
            <s:a href="updateBook.jsp">Update Book</s:a>
            <s:a href="deleteBook.jsp">Delete Book</s:a>
            <s:a href="search.jsp">Search Book</s:a>
        </div>
    </div>
</body>
</html>
