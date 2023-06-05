<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.project.inventorymanagement.model.Equipment" %>
<!DOCTYPE html>
<html>
<head>
    <title>Equipment Details</title>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }
        
        th, td {
            text-align: left;
            padding: 8px;
        }
        
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
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
</body>
</html>
