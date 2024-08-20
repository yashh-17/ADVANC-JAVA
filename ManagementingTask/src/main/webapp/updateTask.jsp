<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.util.List" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="model.Task" %>
<%@ page import="helper.FactoryProvider" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Task</title>
    <style>
        /* Add your CSS styles here */
        body {
            font-family: Arial, sans-serif;
        }
        h1 {
            color: #333;
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
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<h1>List of Tasks</h1>

<table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Description</th>
        <th>Due Date</th>
        <th>Priority</th>
    </tr>
    
    <% 
        Session session1 = FactoryProvider.getFactory().openSession();
        
        try {
            session1.beginTransaction();
            List<Task> tasks = session1.createQuery("from Task").getResultList();
            
            for (Task task : tasks) {
    %>
            <tr>
                <td><%= task.getId() %></td>
                <td><%= task.getName() %></td>
                <td><%= task.getDescription() %></td>
                <td><%= task.getDueDate() %></td>
                <td><%= task.getPriority() %></td>
            </tr>
    <%
            }
            session1.getTransaction().commit();
        } finally {
            if (session1 != null && session1.isOpen()) {
                session1.close();
            }
        }
    %>
    <div class="container text-center mt-2">
        <a href="index.jsp" class="btn btn-primary">Home</a>
    </div>
</table>

<h1>Update Task</h1>

<form action="UpdateTaskAction" method="post">
    <label for="id">Task ID:</label>
    <input type="text" id="id" name="id" placeholder="Enter Task ID" required />

    <label for="name">Name:</label>
    <input type="text" id="name" name="task.name" placeholder="Enter Name" required />

    <label for="description">Description:</label>
    <input type="text" id="description" name="task.description" placeholder="Enter Description" required />

    <label for="dueDate">Due Date:</label>
    <input type="date" id="dueDate" name="task.dueDate" required />

    <label for="priority">Priority:</label>
    <select id="priority" name="task.priority" required>
        <option value="High">High</option>
        <option value="Medium">Medium</option>
        <option value="Low">Low</option>
    </select>

    <button type="submit">Update Task</button>
</form>
</body>
</html>
