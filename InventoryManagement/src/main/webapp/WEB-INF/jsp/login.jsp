<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <style>
    @import url('https://fonts.googleapis.com/css2?family=Roboto:wght@300;400&display=swap');
        body {
            background-color: #f2f2f2;
            background-image: url("../img/img5.png");
            background-size: cover; 
            font-family: Arial, sans-serif;
        }
        
        .container {
            max-width: 400px;
            margin: 100px auto; /* Adjust the margin to position the container */
            padding: 20px;
            background-color: #fff; /* Add a background color to create a box */
            border-radius: 10px; /* Add border radius for rounded corners */
        }
        
        h1 {
            text-align: center;
            font-size: 30px;
            margin-top: 0;
        }
        
        form {
            text-align: center;
        }
        
        label {
            display: block;
            margin-bottom: 10px;
        }
        
        
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }
        
        
        p {
            font-size: 18px;
            text-align: center;
            margin-bottom: 0;
        }
        
        .footer {
            text-align: center;
            
        }
    </style>
    <script>
        function showError(message) {
            alert(message);
        }
    </script>
</head>
<body>
    <div class="container">
        <h1>Login</h1>
        
        <%-- Display error message if available --%>
        <% if (request.getAttribute("error") != null) { %>
            <script>
                showError("<%= request.getAttribute("error") %>");
            </script>
        <% } %>
        
        <form action="/frontend/login" method="POST">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required><br><br>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required><br><br>
            <input type="submit" value="Login">
        </form>
        
        <p>If you don't have an account, you can <a href="register">register here</a>.</p>
    </div>
    
    <div class="footer">
        &copy; 2023 Lab Inventory Management. All rights reserved.
    </div>
</body>
</html>
