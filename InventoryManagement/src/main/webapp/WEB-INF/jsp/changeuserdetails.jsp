<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Change User Details</title>
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
            margin-bottom: 5px;
        }
        
        input[type="text"],
        input[type="email"],
        input[type="number"] {
            width: 50%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-bottom: 10px;
        }
        
        input[type="submit"] {
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }
        
        
        a {
            display: block;
            text-align: center;
            margin-top: 20px;
        }
    </style>
    <script>
        function validateForm() {
            var firstName = document.getElementById("firstName").value;
            var lastName = document.getElementById("lastName").value;
            var email = document.getElementById("email").value;
            var phoneNumber = document.getElementById("phoneNumber").value;
            var age = document.getElementById("age").value;

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
        <h1>Change User Details</h1>
        
        <form action="/frontend/updateuserdetails" method="POST" onsubmit="return validateForm();">
            <label for="firstName">First Name:</label>
            <input type="text" id="firstName" name="firstName" required><br>
            
            <label for="lastName">Last Name:</label>
            <input type="text" id="lastName" name="lastName" required><br>
            
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required><br>
            
            <label for="phoneNumber">Phone Number:</label>
            <input type="text" id="phoneNumber" name="phoneNumber" required><br>
            
            <label for="age">Age:</label>
            <input type="number" id="age" name="age" required><br>
            
            <input type="submit" value="Update User Details">
        </form>
        
        <a href="welcome">Go Back</a>
    </div>
</body>
</html>
