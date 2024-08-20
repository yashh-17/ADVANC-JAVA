<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="org.hibernate.SessionFactory" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="com.example.Book" %>
<%@ page import="com.example.FactoryProvider" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Search Result</title>
    <style>
        /* Add your CSS styles here */
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f2f5;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            animation: fadeIn 0.5s ease;
        }
        h1 {
            color: #333;
            margin-top: 0;
        }
        table {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        .btn-container {
            text-align: center;
            margin-top: 20px;
        }
        .btn {
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .btn:hover {
            background-color: #0056b3;
        }

        @keyframes fadeIn {
            0% {
                opacity: 0;
                transform: translateY(-20px);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Search Result</h1>
        
        <table>
            <tr>
                <th>Id</th>
                <th>Title</th>
                <th>Author</th>
                <th>ISBN</th>
                <th>Genre</th>
                <th>Copies Available</th>
            </tr>
            
            <% 
                String bookTitle = request.getParameter("bookTitle");
                Session searchSession = FactoryProvider.getFactory().openSession();
                
                try {
                    searchSession.beginTransaction();
                    List<Book> books = searchSession.createQuery("from Book where title like :title")
                                            .setParameter("title", "%" + bookTitle + "%")
                                            .getResultList();
                    
                    if (books.isEmpty()) {
            %>
                        <tr>
                            <td colspan="6">Not Available</td>
                        </tr>
            <%
                    } else {
                        for (Book book : books) {
            %>
                            <tr>
                                <td><%= book.getId() %></td>
                                <td><%= book.getTitle() %></td>
                                <td><%= book.getAuthor() %></td>
                                <td><%= book.getIsbn() %></td>
                                <td><%= book.getGenre() %></td>
                                <td><%= book.getNumCopies() %></td>
                            </tr>
            <%
                        }
                    }
                    searchSession.getTransaction().commit();
                } finally {
                    if (searchSession != null && searchSession.isOpen()) {
                        searchSession.close();
                    }
                }
            %>
        </table>
        
        <div class="btn-container">
            <a href="search.jsp" class="btn">Back to Search</a>
            <a href="index.jsp" class="btn">Home</a>
        </div>
    </div>
</body>
</html>
