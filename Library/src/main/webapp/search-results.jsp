<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Search Results</title>
    <!-- Add your CSS styles or include a separate CSS file here if needed -->
</head>
<body>
    <h1>Search Results</h1>

    <s:if test="${book !=null}">
        <table>
            <tr>
                <th>Title</th>
                <th>Author</th>
                <th>ISBN</th>
                <th>Genre</th>
                <th>Total Copies</th>
            </tr>

            <s:forEach var="book" items="${books}">
                <tr>
                    <td>${book.title}</td>
                    <td>${book.author}</td>
                    <td>${book.isbn}</td>
                    <td>${book.genre}</td>
                    <td>${book.numCopies}</td>
                </tr>
            </s:forEach>
        </table>
    </s:if>

    <div class="container text-center mt-2">
        <a href="home.jsp" class="btn btn-primary">Home</a>
    </div>
</body>
</html>
