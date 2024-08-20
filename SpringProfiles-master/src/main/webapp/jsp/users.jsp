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

        /* Container styles */
        .container {
            max-width: 800px;
            margin: 0 auto;
        }

        /* Heading styles */
        h2 {
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }

        /* Link styles */
        a {
            color: #333;
            text-decoration: none;
            display: inline-block;
            margin-bottom: 10px;
        }

        a.admin-link {
            float: right;
        }

        a.admin-link:hover,
        a.action-link:hover {
            text-decoration: underline;
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

<div class="container">
    <a href="${pageContext.request.contextPath}/admin/login" class="admin-link">Admin</a>
    <h2>Users List</h2>
    <a href="/new" class="action-link">Add User</a>
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
                <td><a href="/edit/${user.id}" class="action-link">Edit</a></td>
                <td><a href="/delete/${user.id}" class="action-link">Delete</a></td>
            </tr>
        </c:forEach>
    </table>
</div>

</body>
</html>
