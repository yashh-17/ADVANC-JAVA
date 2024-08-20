<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home Page</title>
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

        /* Top bar styles */
        .top-bar {
            background: linear-gradient(to right, #333, #555); /* Gradient background */
            color: #fff;
            padding: 15px; /* Increased padding */
            text-align: center;
            font-size: 18px; /* Larger text size */
            font-weight: bold; /* Bold text */
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* Subtle shadow for depth */
        }

        /* User Profiles styles */
        .user-profiles {
            background-color: #555;
            color: #fff;
            padding: 10px;
            text-align: center;
            margin-bottom: 20px;
        }

        /* Container styles */
        .container {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            background-color: #f0f0f0;
            padding-top: 20px; /* Added padding to push content down */
        }

        /* Heading styles */
        h4 {
            color: #333;
            margin-bottom: 20px;
        }

        /* Table styles */
        table {
            border-collapse: collapse;
            width: 300px;
            text-align: center;
        }

        table td {
            padding: 10px;
            border: 1px solid #333;
        }

        table td a {
            text-decoration: none;
            color: #333;
            display: block;
        }

        table td a:hover {
            color: #666;
        }
    </style>
</head>
<body>


<div class="user-profiles">
    <h4>User Profiles</h4>
</div>

<div class="container">
    <table>
        <tr>
            <td><a href="/new">Add new user</a></td>
        </tr>
        <tr>
            <td><a href="/users">View all users</a></td>
        </tr>
    </table>
</div>

</body>
</html>