<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.project.inventorymanagement.model.Equipment" %>
<!DOCTYPE html>
<html>
<head>
    <title>Equipment Held</title>
</head>
<body>
    <h1>Equipment Held</h1>
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
</body>
</html>