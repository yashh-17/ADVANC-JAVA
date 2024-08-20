<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="org.hibernate.SessionFactory" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="recipe.Recipe" %>
<%@ page import="helper.FactoryProvider" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>List of Vehicle Data</title>
    <style>
        /* Add your CSS styles here */
        body {
            font-family: Arial, sans-serif;
            padding: 20px;
            background-color: #f5f5f5;
        }
        h1 {
            color: #333;
            text-align: center;
            margin-bottom: 50px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: left;
            font-size: 16px;
        }
        th {
            background-color: #f2f2f2;
            font-weight: bold;
        }
        .btn-primary {
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            text-decoration: none;
            font-size: 16px;
            margin-top: 30px;
        }
        .btn-primary:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <h1>List of Vehicle Data</h1>
    
    <table>
        <tr>
            <th>Vehicle ID</th>
            <th>Route</th>
            <th>Status</th>
            <th>Current Occupancy</th>
        </tr>
        
        <% 
   
            Session session2 = FactoryProvider.getFactory().openSession();
            
            try {
                session2.beginTransaction();
                List<Recipe> recipes = session2.createQuery("from Recipe").getResultList();
                
                for (Recipe recipe : recipes) {
        %>
                <tr>
                    <td><%= recipe.getId() %></td>
					<td><%= recipe.getRecipiename() %></td>
                    <td><%= recipe.getIngredients() %></td>
                    <td><%= recipe.getDifficultylevel() %></td>
                </tr>
        <%
                }
                session2.getTransaction().commit();
            } finally {
            	session2.close();
            }
        %>
    </table>
    
    <div class="container text-center mt-2">
    <br>
    	<a href="index.jsp" class="btn btn-primary">Home</a>
    </div>
</body>
</html>