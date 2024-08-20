<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Registration</title>
    <style>
        /* Add your CSS styling here */
        .form-element {
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
    <form action="addUserAction" method="post">
        <div class="form-element form-stack">
            <label for="username" class="form-label">User Name</label>
            <input type="text" id="username" name="user.username" required>
        </div>
        <div class="form-element form-stack">
            <label for="password" class="form-label">Password</label>
            <input type="password" id="password" name="user.password" required>
        </div>
        <div class="form-element form-stack">
            <label for="role" class="form-label">Role</label>
            <select id="role" name="user.role" required>
                <option value="EDITOR">Editor</option>
                <option value="ADMIN">Admin</option>
                <option value="USER">User</option>
            </select>
        </div>
        <div class="form-element form-submit">
            <button type="submit">Register</button>
        </div>
    </form>
</body>
</html>
