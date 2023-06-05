<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.project.inventorymanagement.model.Equipment" %>
<!DOCTYPE html>
<html>
<head>
    <title>Return Equipment</title>
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
            margin-bottom: 10px;
        }
        
        input[type="text"] {
            padding: 8px;
            width: 100%;
            box-sizing: border-box;
        }
        
        input[type="submit"] {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }
        
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        
        h2 {
            margin-top: 20px;
            font-size: 24px;
        }
        
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }
        
        th, td {
            text-align: left;
            padding: 8px;
        }
        
        th {
            background-color: #f2f2f2;
        }
        
        a {
            display: block;
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Return Equipment</h1>
        
        <%-- Display success message if available --%>
        <% String successMessage = (String) request.getAttribute("successMessage"); %>
        <% if (successMessage != null) { %>
            <p style="color: green;"><%= successMessage %></p>
        <% } %>

        <%-- Display error message if available --%>
        <% String errorMessage = (String) request.getAttribute("errorMessage"); %>
        <% if (errorMessage != null) { %>
            <p style="color: red;"><%= errorMessage %></p>
        <% } %>

        <form action="returnequipment" method="POST">
            <label for="equipmentId">Equipment ID:</label>
            <input type="text" id="equipmentId" name="equipmentId" required>
            <br>
            <input type="submit" value="Return">
        </form>

        <h2>Equipment Held:</h2>
        <table>
            <thead>
                <tr>
                    <th>Equipment ID</th>
                    <th>Name</th>
                    <th>Category</th>
                    <th>Description</th>
                </tr>
            </thead>
            <tbody>
                <% List<Equipment> equipmentList = (List<Equipment>) request.getAttribute("equipmentList"); %>
                <% if (equipmentList != null) { %>
                    <% for (Equipment equipment : equipmentList) { %>
                        <tr>
                            <td><%= equipment.getEquipmentID() %></td>
                            <td><%= equipment.getName() %></td>
                            <td><%= equipment.getCategory() %></td>
                            <td><%= equipment.getDescription() %></td>
                        </tr>
                    <% } %>
                <% } %>
            </tbody>
        </table>
        
        <a href="welcome">Go Back</a>
    </div>
</body>
</html>
