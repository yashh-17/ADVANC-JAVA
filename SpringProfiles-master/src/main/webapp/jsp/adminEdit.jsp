<%--
  Created by IntelliJ IDEA.
  User: saiki
  Date: 23-04-2024
  Time: 09:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>
<h4>STUDENT INFORMATION SYSTEM</h4>
<h4>Update Student</h4>
<form action="update" method="post">
    <table>
        <tr>
            <td>ID</td>
            <td><input type="text" name="id" value="${user.id}" readonly></td>
        </tr>
        <tr>
            <td>Name</td>
            <td><input type="text" name="name" value="${user.name}"></td>
        </tr>
        <tr>
            <td>Email</td>
            <td><input type="text" name="email" value="${user.email}"></td>
        </tr>
        <tr>
            <td>Password</td>
            <td><input type="password" name="password" value="${user.password}"></td>
        <tr>
            <td>Bio</td>
            <td><input type="text" name="bio" value="${user.bio}"></td>
        </tr>
        <td></td>
        <td><input type="submit" value="Update User"></td>
        </tr>
    </table>
</form>
</body>
</html>

