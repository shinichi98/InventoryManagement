<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Registration</title>
    <script>
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
    <h1>Registration</h1>
    
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