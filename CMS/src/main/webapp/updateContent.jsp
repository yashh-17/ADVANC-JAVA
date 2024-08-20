<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.util.List" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="cms.Content" %>
<%@ page import="helper.FactoryProvider" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Content</title>
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
    
    <h1>Update Content</h1>
    
    <form action="updateContentAction" method="post">
        <label for="id">Content ID:</label>
        <input type="text" id="id" name="id" placeholder="Enter Book ID" required />

        <label for="title">Title:</label>
        <input type="text" id="title" name="content.title" placeholder="Enter Title" required />

        <label for="content">Content:</label>
        <input type="text" id="content" name="content.content" placeholder="Enter Content" required />

        <label for="publication_date">Publication Date:</label>
        <input type="text" id="publication_date" name="content.publication_date" placeholder="Enter Publication Date" required />

        <label for="author_information">Author_Information:</label>
        <input type="text" id="author_information" name="content.author_information" placeholder="Enter Author Information" required />

        <label for="category">Category:</label>
        <input type="text" id="category" name="content.category" placeholder="Enter Category" required />

        <button type="submit">Update Content</button>
    </form>
</body>
</html>
