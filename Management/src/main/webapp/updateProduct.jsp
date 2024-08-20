<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.util.List" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="model.Product" %>
<%@ page import="helper.FactoryProvider" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Product</title>
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
<h1>List of Products</h1>
    
<table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Description</th>
        <th>Price</th>
        <th>Stock Quantity</th>
        <th>Category</th>
        <th>Manufacturer</th>
        <th>Manufacture Date</th>
    </tr>
    
    <% 
        Session session1 = FactoryProvider.getFactory().openSession();
        
        try {
            session1.beginTransaction();
            List<Product> products = session1.createQuery("from Product").getResultList();
            
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

<h1>Update Product</h1>

<form action="UpdateProductAction" method="post">
    <label for="id">Product ID:</label>
    <input type="text" id="id" name="id" placeholder="Enter Product ID" required />

    <label for="name">Name:</label>
    <input type="text" id="name" name="product.name" placeholder="Enter Name" required />

    <label for="description">Description:</label>
    <input type="text" id="description" name="product.description" placeholder="Enter Description" required />

    <label for="price">Price:</label>
    <input type="text" id="price" name="product.price" placeholder="Enter Price" required />

    <label for="stockQuantity">Stock Quantity:</label>
    <input type="text" id="stockQuantity" name="product.stockQuantity" placeholder="Enter Stock Quantity" required />

    <label for="category">Category:</label>
    <input type="text" id="category" name="product.category" placeholder="Enter Category" required />

    <label for="manufacturer">Manufacturer:</label>
    <input type="text" id="manufacturer" name="product.manufacturer" placeholder="Enter Manufacturer" required />

    <label for="manufactureDate">Manufacture Date:</label>
    <input type="date" id="manufactureDate" name="product.manufactureDate" required />

    <button type="submit">Update Product</button>
</form>
</body>
</html>
