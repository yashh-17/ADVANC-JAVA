<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="org.hibernate.SessionFactory" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="cms.Content" %>
<%@ page import="helper.FactoryProvider" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>List Books</title>
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
    </style>
</head>
<body>
    <h1>List of Contents</h1>

	<table>
		<tr>
			<th>Id</th>
			<th>Title</th>
			<th>Content</th>
			<th>Publication Date</th>
			<th>Author Information</th>
			<th>Category</th>
		</tr>

		<% 
   
            Session session3 = FactoryProvider.getFactory().openSession();
            
            try {
                session3.beginTransaction();
                List<Content> contents = session3.createQuery("from Content").getResultList();
                
                for (Content c : contents) {
        %>
		<tr>
			<td><%= c.getId() %></td>
			<td><%= c.getTitle() %></td>
			<td><%= c.getContent() %></td>
			<td><%= c.getPublication_date() %></td>
			<td><%= c.getAuthor_information() %></td>
			<td><%= c.getCategory() %></td>
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
        	<a href="list.jsp" class="btn btn-primary">Home</a>
        </div>
    </table>
</body>
</html>
