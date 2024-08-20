<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Information System</title>
    <style>
        /* Resetting default browser styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* Body styles */
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
        }

        /* Container styles */
        .container {
            margin: 0 auto;
            padding: 20px;
            max-width: 400px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        /* Heading styles */
        h4 {
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }

        /* Form styles */
        form {
            text-align: center;
        }

        table {
            width: 100%;
        }

        table tr {
            margin-bottom: 15px;
        }

        table td {
            padding: 8px;
            text-align: left;
        }

        input[type="text"],
        input[type="password"] {
            width: calc(100% - 12px);
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
            transition: border-color 0.3s;
        }

        input[type="text"]:focus,
        input[type="password"]:focus {
            border-color: #666;
        }

        input[type="submit"] {
            background-color: #333;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #666;
        }
    </style>
</head>
<body>

<div class="container">
    <h4>STUDENT INFORMATION SYSTEM</h4>
    <form action="/users/add" method="post">
        <table>
            <tr>
                <td>Name</td>
                <td><input type="text" name="name"></td>
            </tr>
            <tr>
                <td>Email</td>
                <td><input type="text" name="email"></td>
            </tr>
            <tr>
                <td>Password</td>
                <td><input type="password" name="password"></td>
            </tr>
            <tr>
                <td>Bio</td>
                <td><input type="text" name="bio"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Add Student"></td>
            </tr>
        </table>
    </form>
</div>

</body>
</html>
