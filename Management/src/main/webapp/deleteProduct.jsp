<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="org.hibernate.SessionFactory"%>
<%@ page import="org.hibernate.Session"%>
<%@ page import="model.Product"%>
<%@ page import="helper.FactoryProvider"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Product</title>
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
    <h1>List of Products</h1>

    <table>
        <tr>
            <th>Id</th>
            <th>Name</th>
            <th>Description</th>
            <th>Price</th>
            <th>Stock Quantity</th>
            <th>Category</th>
            <th>Manufacturer</th>
            <th>Manufacture Date</th>
        </tr>

        <% 
            Session session3 = FactoryProvider.getFactory().openSession();
            try {
                session3.beginTransaction();
                List<Product> products = session3.createQuery("from Product").getResultList();
                
                for (Product product : products) {
        %>
        <tr>
            <td><%= product.getId() %></td>
            <td><%= product.getName() %></td>
            <td><%= product.getDescription() %></td>
            <td><%= product.getPrice() %></td>
            <td><%= product.getStockQuantity() %></td>
            <td><%= product.getCategory() %></td>
            <td><%= product.getManufacturer() %></td>
            <td><%= product.getManufactureDate() %></td>
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
    <h1>Delete Product</h1>

    <form action="DeleteProductAction" method="post">
        <label for="id">Product ID:</label> <input type="text" id="id" name="id"
            placeholder="Enter Product ID to Delete" required />

        <button type="submit">Delete Product</button>
    </form>
</body>
</html>