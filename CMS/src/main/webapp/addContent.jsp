<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Content</title>
    <style>
        /* Add your CSS styling here */
        .form-element {
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
    <form action="addContentAction" method="post">
        <div class="form-element form-stack">
            <label for="title" class="form-label">Title</label>
            <input type="text" id="title" name="content.title" required>
        </div>
        <div class="form-element form-stack">
            <label for="content" class="form-label">Content</label>
            <input type="text" id="content" name="content.content" required>
        </div>
        <div class="form-element form-stack">
            <label for="publication_date" class="form-label">Publication Date</label>
            <input type="text" id="publication_date" name="content.publication_date" required>
        </div>
        
        <div class="form-element form-stack">
            <label for="author_information" class="form-label">Author Information</label>
            <input type="text" id="author_information" name="content.author_information" required>
        </div>
        
        <div class="form-element form-stack">
            <label for="category" class="form-label">Category</label>
            <input type="text" id="category" name="content.category" required>
        </div>
        <div class="form-element form-submit">
            <button type="submit">Register</button>
        </div>
    </form>
</body>
</html>
