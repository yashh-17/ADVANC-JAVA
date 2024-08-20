<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.util.List" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="com.example.task" %>
<%@ page import="com.example.FactoryProvider" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <taskname>Update task</taskname>
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
   
            Session session1 = FactoryProvider.getFactory().openSession();
            
            try {
                session1.beginTransaction();
                List<task> tasks = session1.createQuery("from task").getResultList();
                
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
    
    <h1>Update task</h1>
    
    <form action="updatetaskAction" method="post">
        <label for="id">task ID:</label>
        <input type="text" id="id" name="id" placeholder="Enter task ID" required />

        <label for="taskname">taskname:</label>
        <input type="text" id="taskname" name="task.taskname" placeholder="Enter taskname" required />

        <label for="description">description:</label>
        <input type="text" id="description" name="task.description" placeholder="Enter description" required />

        <label for="date">date:</label>
        <input type="text" id="date" name="task.date" placeholder="Enter date" required />

        <label for="prioritylevel">Priority level:</label>
        <input type="text" id="prioritylevel" name="task.prioritylevel" placeholder="Enter prioritylevel" required />

        <button type="submit">Update task</button>
    </form>
</body>
</html>
