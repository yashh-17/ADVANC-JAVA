<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="org.hibernate.SessionFactory"%>
<%@ page import="org.hibernate.Session"%>
<%@ page import="com.example.task"%>
<%@ page import="com.example.FactoryProvider"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete task</title>
<style>
/* Add your CSS styles here */
body {
	font-family: Arial, sans-serif;
}

h1 {
	color: #333;
}

form {
	width: 50%;
	margin: 20px auto;
}

label {
	display: block;
	margin-bottom: 5px;
}

input {
	width: 100%;
	padding: 8px;
	margin-bottom: 10px;
}

button {
	padding: 10px;
	background-color: #d9534f;
	color: #fff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

button:hover {
	background-color: #c9302c;
}

table {
	width: 80%;
	margin: 20px auto;
	border-collapse: collapse;
}

th, td {
	border: 1px solid #ccc;
	padding: 8px;
	text-align: left;
}

th {
	background-color: #f2f2f2;
}
</style>
</head>
<body>
	<h1>List of tasks</h1>

	<table>
		<tr>
			<th>Id</th>
            <th>Task name</th>
            <th>Description</th>
            <th>date</th>
			<th>priority level</th>
		</tr>

		<% 
   
            Session session3 = FactoryProvider.getFactory().openSession();
            
            try {
                session3.beginTransaction();
                List<task> tasks = session3.createQuery("from task").getResultList();
                
                for (task task : tasks) {
        %>
		<tr>
			<td><%= task.getId() %></td>
			<td><%= task.getTaskname() %></td>
            <td><%= task.getDescription() %></td>
			<td><%= task.getDate() %></td>
			<td><%= task.getPrioritylevel() %></td>
		</tr>
		<%
                }
                session3.getTransaction().commit();
            } finally {
                if (session3 != null && session3.isOpen()) {
                    session3.close();
                }
            }
        %>
		<div class="container text-center mt-2">
			<a href="index.jsp" class="btn btn-primary">Home</a>
		</div>
	</table>
	<h1>Delete task</h1>

	<form action="deletetaskAction" method="post">
		<label for="id">task ID:</label> <input type="text" id="id" name="id"
			placeholder="Enter task ID to Delete" required />

		<button type="submit">Delete task</button>
	</form>
</body>
</html>
