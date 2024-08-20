<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create Vehicle Data</title>
    <style>
        /* Add your CSS styles here */
        body {
            font-family: Arial, sans-serif;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f0f0f0;
            margin: 0;
        }
        h1 {
            color: #333;
            text-align: center;
            margin-bottom: 50px;
        }
        form {
            background-color: #fff;
            padding: 40px;
            border-radius: 5px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            width:50%;
            margin:auto;
        }
        label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
            color: #333;
        }
        input[type="text"], input[type="email"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
            color: #333;
        }
        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>

<body>
    <h1>Create Vehicle Data</h1>
    
    <form action="createRecipeServlet" method="post">
        <label for="recipeid">Vehicle ID:</label>
        <input type="text" name="recipeid" required>
        
        <label for="recipename">Route</label>
        <input type="text" name="recipename" required>
        
        <label for="ingredients">Status:</label>
        <input type="text" name="ingredients" required>
        
        
        <label for="difficultylevel">Current Occupancy:</label>
        <input type="text" name="difficultylevel" required>
        
        <br><br>
        <input type="submit" value="Create">
    </form>
</body>
</html>
