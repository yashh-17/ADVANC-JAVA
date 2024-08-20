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
    <title>Update recipe Data</title>
    <style>
        /* Add your CSS styles here */
        body {
            font-family: Arial, sans-serif;
        }
        h1 {
            color: #333;
        }
        form {
            max-width: 400px;
            margin: 0 auto;
        }
        label {
            display: block;
            margin-bottom: 5px;
        }
        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
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
    <h1>Update Vehicle Data</h1>
    
    <h2>List of Vehicles Data</h2>
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
    
    <form action="updateRecipeServlet" method="post">
        <label for="recipeid">Vehicle ID:</label>
        <input type="text" name="recipeid" required>
        
        <label for="recipename">Route</label>
        <input type="text" name="recipename" required>
        
        <label for="ingredients">Status:</label>
        <input type="text" name="ingredients" required>
        

        
        <label for="difficultylevel">Current Occupancy:</label>
        <input type="text" name="difficultylevel" required>
        
        <br><br>
        <input type="submit" value="Update recipe Data">
    </form>
</body>
</html>
