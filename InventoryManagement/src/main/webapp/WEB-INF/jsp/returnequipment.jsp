<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.project.inventorymanagement.model.Equipment" %>
<!DOCTYPE html>
<html>
<head>
    <title>Return Equipment</title>
</head>
<body>
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
        <input type="text" id="equipmentId" name="equipmentId">
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
</body>
</html>
