<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.project.inventorymanagement.model.Equipment" %>
<!DOCTYPE html>
<html>
<head>
    <title>Equipment Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f2f2f2;
        }
        
        .container {
            max-width: 800px;
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
        
        table {
            border-collapse: collapse;
            width: 100%;
            margin-top: 20px;
        }
        
        th, td {
            text-align: left;
            padding: 10px;
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
        <h1>Equipment Details</h1>
        
        <table>
            <tr>
                <th>Equipment ID</th>
                <th>Name</th>
                <th>Category</th>
                <th>Description</th>
                <th>Quantity</th>
            </tr>
            
            <% 
            List<Equipment> equipmentList = (List<Equipment>) request.getAttribute("equipmentList");
            for (Equipment equipment : equipmentList) { 
            %>
            <tr>
                <td><%= equipment.getEquipmentID() %></td>
                <td><%= equipment.getName() %></td>
                <td><%= equipment.getCategory() %></td>
                <td><%= equipment.getDescription() %></td>
                <td><%= equipment.getQuantity() %></td>
            </tr>
            <% } %>
        </table>
        
        <a href="welcome">Go Back</a>
    </div>
</body>
</html>