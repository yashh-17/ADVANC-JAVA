<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Users List</title>
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
        }

        /* Heading styles */
        h2 {
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }

        /* Table styles */
        table {
            width: 100%;
            border-collapse: collapse;
            border: 1px solid #ccc;
            margin-bottom: 20px;
        }

        th, td {
            padding: 10px;
            border: 1px solid #ccc;
            text-align: left;
        }

        th {
            background-color: #f0f0f0;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #ddd;
        }

        /* Link styles */
        a {
            color: #333;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }

        /* Message styles */
        .message {
            margin-bottom: 20px;
            padding: 10px;
            color: red;
            background-color: #ffe0e0;
            border: 1px solid #f5c6cb;
            border-radius: 4px;
        }
    </style>
</head>
<body>

<h2>Users List</h2>
<a href="/new">Add User</a>
<c:if test="${empty users}">
    <p class="message">No users found.</p>
</c:if>
<table>
    <tr>
        <th>Name</th>
        <th>Email</th>
        <th>Bio</th>
        <th>Update</th>
    </tr>
    <c:forEach items="${users}" var="user">
        <tr>
            <td>${user.name}</td>
            <td>${user.email}</td>
            <td>${user.bio}</td>
            <td><a href="/admin/edit/${user.id}/">Edit</a></td>
            <td><a href="/admin/delete/${user.id}">Delete</a></td>
        </tr>
    </c:forEach>
</table>

<c:if test="${not empty message}">
    <div class="message">${message}</div>
</c:if>

<c:if test="${not empty error}">
    <div class="message">${error}</div>
</c:if>

</body>
</html>
