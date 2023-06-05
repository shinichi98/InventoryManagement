<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Home</title>
    <style>
         @import url('https://fonts.googleapis.com/css2?family=Roboto:wght@300;400&display=swap');

        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f2f2f2;
            background-image: url("../img/img5.png");
            background-size: cover;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        
        .container {
            max-width: 800px;
            margin: 150px auto; /* Adjust the margin to position the container */
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.8); /* Add a semi-transparent background color */
            border-radius: 10px; /* Add border radius for rounded corners */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2); /* Add a subtle box shadow */
        }
        
        h1 {
            text-align: center;
            font-size: 30px;
            margin-top: 0;
            color: #333;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2); /* Add a subtle text shadow */
        }
        
        p {
            font-size: 18px;
            line-height: 1.5;
            margin-bottom: 20px;
            color: #555;
        }
        
        a {
            color: #007bff;
            text-decoration: none;
        }
        
        a:hover {
            text-decoration: underline;
        }
        
        .footer {
            text-align: center;
            font-size: 14px;
            color: #888;
            margin-top: 50px;
            padding-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome to the Home Page</h1>
        
        <p>This is a POC project made by Prateek Yadav.</p>
        
        <p>Project: Lab Inventory Management</p>
                
        <hr>
        
        <p>If you want to login, you can <a href="login">click here</a>.</p>
        
        <p>If you don't have an account, you can <a href="register">register here</a>.</p>
    </div>
    
    <div class="footer">
        &copy; 2023 Lab Inventory Management. All rights reserved.
    </div>
</body>
</html>
