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
    
    <ul>
        <% 
        List<Equipment> equipmentList = (List<Equipment>) request.getAttribute("equipmentList");
        for (Equipment equipment : equipmentList) { 
        %>
        <li><%= equipment.getName() %></li>
        <% } %>
    </ul>
    
    <a href="welcome">Go Back</a>
</body>
</html>