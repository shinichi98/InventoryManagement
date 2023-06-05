<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.project.InventoryManagement.model.User"%>
<!DOCTYPE html>
<html>
<head>
    <title>Change Password</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f2f2f2;
        }
        
        .container {
            max-width: 600px;
            margin: 100px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
        }
        
        h1 {
            text-align: center;
            font-size: 30px;
            margin-top: 0;
        }
        
        form {
            text-align: center;
            margin-top: 20px;
        }
        
        label {
            display: block;
            font-weight: bold;
            margin-bottom: 10px;
        }
        
        input[type="password"] {
            width: 50%;
            padding: 10px;
            font-size: 16px;
            border-radius: 5px;
            border: 1px solid #ccc;
            margin-bottom: 20px;
        }
        
        input[type="submit"] {
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
            width: 150px;
        }
        
        
        
        a {
            display: inline-block;
            margin-top: 20px;
            text-decoration: none;
            color: #4CAF50;
        }
    </style>
    <script>
        function validatePassword() {
            var newPassword = document.getElementById("newPassword").value;
            var oldPassword = '<%= ((User) session.getAttribute("user")).getPassword() %>';
			
			var passwordRegex = /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,}$/;
            if (!newPassword.match(passwordRegex)) {
                alert("Password must be at least 8 characters long and contain at least one number and one special character.");
                return false;
            }
            if (newPassword === oldPassword) {
                alert("New password should be different from the old password.");
                return false;
            }


            return true;
        }
    </script>
</head>
<body>
    <div class="container">
        <h1>Change Password</h1>
        
        <form action="/frontend/updatepassword" method="POST" onsubmit="return validatePassword();">
            <label for="newPassword">New Password:</label>
            <input type="password" id="newPassword" name="newPassword" required><br>
            
            <input type="submit" value="Update Password">
        </form>
        
        <a href="welcome">Go Back</a>
    </div>
</body>
</html>
