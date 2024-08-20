<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="org.hibernate.SessionFactory" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="Bank.Bank" %>
<%@ page import="helper.FactoryProvider" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Account details</title>
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
    <h1>Account details</h1>
    <form action="details.jsp" method="post">
        <label for="Account_number">Account Number:</label> 
        <input type="text" name="Account_number" required> 
        <input type="submit" value="Submit" class="btn btn-primary">
    </form>
    <%
        String accountNumber = request.getParameter("Account_number");
        if (accountNumber != null && !accountNumber.isEmpty()) {
            long accountNumberLong = Long.valueOf(accountNumber);
            SessionFactory sessionFactory = FactoryProvider.getFactory();
            Session session2 = sessionFactory.openSession();
            try {
                session2.beginTransaction();
                Bank account = session2.get(Bank.class, accountNumberLong);
                if (account != null) {
    %>
                    <table>
                        <tr>
                            <th>Account Number</th>
                            <th>Holder Name</th>
                            <th>Balance</th>
                        </tr>
                        <tr>
                            <td><%= account.getAccount_number() %></td>
                            <td><%= account.getHolder_name() %></td>
                            <td><%= account.getBalance() %></td>
                        </tr>
                    </table>
    <%
                } else {
                    out.println("<p>Account not found</p>");
                }
                session2.getTransaction().commit();
            } catch (Exception e) {
                out.println("<p>Error: " + e.getMessage() + "</p>");
            } finally {
                session2.close();
            }
        }
    %>
    <div class="container text-center mt-2">
        <br>
        <a href="index.jsp" class="btn btn-primary">Home</a>
    </div>
</body>
</html>