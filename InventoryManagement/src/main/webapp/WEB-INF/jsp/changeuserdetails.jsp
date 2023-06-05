<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Change User Details</title>
</head>
<body>
    <h1>Change User Details</h1>
    
    <form action="/frontend/updateuserdetails" method="POST">
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
</body>
</html>
