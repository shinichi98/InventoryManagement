<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.project.InventoryManagement.model.User"%>
<!DOCTYPE html>
<html>
<head>
    <title>Welcome</title>
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
        
        .user-details {
            margin-bottom: 20px;
        }
        
        
        
        .user-details th {
            text-align: left;
        }
        
        .actions {
            text-align: center;
        }
        
        .actions a {
            display: inline-block;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            margin-bottom: 10px;
        }
        
        .actions a:hover {
            background-color: #45a049;
        }
        
        form {
            text-align: center;
            margin-top: 20px;
        }
        
        
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome, <%= ((User) session.getAttribute("user")).getUsername() %>!</h1>

        <div class="user-details">
            <table>
                <tr>
                    <th>Username:</th>
                    <td><%= ((User) session.getAttribute("user")).getUsername() %></td>
                </tr>
                <tr>
                    <th>First Name:</th>
                    <td><%= ((User) session.getAttribute("user")).getFirstName() %></td>
                </tr>
                <tr>
                    <th>Last Name:</th>
                    <td><%= ((User) session.getAttribute("user")).getLastName() %></td>
                </tr>
                <tr>
                    <th>Email:</th>
                    <td><%= ((User) session.getAttribute("user")).getEmail() %></td>
                </tr>
                <tr>
                    <th>Phone Number:</th>
                    <td><%= ((User) session.getAttribute("user")).getPhoneNumber() %></td>
                </tr>
                <tr>
                    <th>Age:</th>
                    <td><%= ((User) session.getAttribute("user")).getAge() %></td>
                </tr>
                <tr>
                    <th>Role:</th>
                    <td><%= ((User) session.getAttribute("user")).getRole() %></td>
                </tr>
            </table>
        </div>
        
        <div class="actions">
            <h2>Actions:</h2>
            <a href="changepassword">Change Password</a><br>
            <a href="changeuserdetails">Change User Details</a><br>
            <a href="equipmentdetails">View Equipment Details</a><br>
            <a href="requestequipment">Raise Request for Equipment</a><br>
            <a href="returnequipment">Return the Equipment</a><br>
            <a href="requestraised">All the requests raised by <%= ((User) session.getAttribute("user")).getUsername() %></a>
        </div>
        
        <form action="logout" method="GET">
            <input type="submit" value="Logout">
        </form>
    </div>
</body>
</html>
