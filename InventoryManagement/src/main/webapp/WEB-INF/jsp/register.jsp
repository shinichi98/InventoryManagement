<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Registration</title>
    <style>
        body {
            background-color: #f2f2f2;
            background-image: url("../img/img5.png");
            background-size: cover; /* Stretch the background image to cover the body */
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        
        .container {
            max-width: 600px;
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
            margin-bottom: 0; /* Add this line to remove default bottom margin */
        }
        
        .footer {
            text-align: center;
            
        }
    </style>
    <script>
    	function showError(message) {
            alert(message);
        }
        function validateForm() {
            var username = document.forms["registrationForm"]["username"].value;
            var password = document.forms["registrationForm"]["password"].value;
            var firstName = document.forms["registrationForm"]["firstName"].value;
            var lastName = document.forms["registrationForm"]["lastName"].value;
            var email = document.forms["registrationForm"]["email"].value;
            var phoneNumber = document.forms["registrationForm"]["phoneNumber"].value;
            var age = document.forms["registrationForm"]["age"].value;

            // Password validation
            var passwordRegex = /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,}$/;
            if (!password.match(passwordRegex)) {
                alert("Password must be at least 8 characters long and contain at least one number and one special character.");
                return false;
            }

            // Age validation
            if (age < 16 || age > 60) {
                alert("Age must be between 16 and 60.");
                return false;
            }

            // Phone number validation
            var phoneNumberRegex = /^\d{10}$/;
            if (!phoneNumber.match(phoneNumberRegex)) {
                alert("Phone number must be a 10-digit number.");
                return false;
            }

            // Email validation
            var emailRegex = /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/;
            if (!email.match(emailRegex)) {
                alert("Please enter a valid email address.");
                return false;
            }
        }
    </script>
</head>
<body>
    <div class="container">
        <h1>Registration</h1>
         <%-- Display error message if available --%>
        <% if (request.getAttribute("error") != null) { %>
            <script>
                showError("<%= request.getAttribute("error") %>");
            </script>
        <% } %>
        <form name="registrationForm" action="/frontend/register" method="POST" onsubmit="return validateForm()">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required><br><br>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required><br><br>
            <label for="firstName">First Name:</label>
            <input type="text" id="firstName" name="firstName" required><br><br>
            <label for="lastName">Last Name:</label>
            <input type="text" id="lastName" name="lastName" required><br><br>
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required><br><br>
            <label for="phoneNumber">Phone Number:</label>
            <input type="text" id="phoneNumber" name="phoneNumber" required><br><br>
            <label for="age">Age:</label>
            <input type="number" id="age" name="age" required><br><br>
            <label for="role">Role:</label>
            <select id="role" name="role" required>
                <option value="ADMINISTRATOR">Administrator</option>
                <option value="USER">User</option>
            </select><br><br>
            <input type="submit" value="Register">
        </form>
        
        <p>If you already have an account, you can <a href="login">login here</a>.</p>
    </div>
    
    <div class="footer">
        &copy; 2023 Lab Inventory Management. All rights reserved.
    </div>
</body>
</html>
