<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Task Management Login</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
</head>
<body>
    <div class="container">
        <input type="checkbox" id="flip">
        <div class="cover">
            <div class="front">
                <img src="backImg.jpg" alt="">
                <div class="text"></div>
            </div>
            <div class="back">
                <img class="backImg" src="backImg.jpg" alt="">
            </div>
        </div>
        
        <div class="forms">
            <form action="LoginServlet" method="post">
                <div class="form-content">
                    <div class="login-form">
                        <div class="title">Task Management Login</div>
                        <div class="input-boxes">
                            <div class="input-box">
                                <i class="fa-solid fa-user"></i>
                                <input type="text" name="username" placeholder="Username" required>
                            </div>
                            <div class="input-box">
                                <i class="fa-solid fa-lock"></i>
                                <input type="password" name="password" placeholder="Password" required>
                            </div>
                            <div class="button input-box">
                                <input type="submit" value="Login">
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
