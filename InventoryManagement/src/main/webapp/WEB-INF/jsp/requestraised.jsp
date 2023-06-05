<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.project.inventorymanagement.model.Request" %>
<!DOCTYPE html>
<html>
<head>
    <title>Requests Raised</title>
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
        
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
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
        <h1>Requests Raised</h1>
        
        <table>
            <tr>
                <th>Request ID</th>
                <th>Request Date</th>
                <th>Equipment ID</th>
                <th>Equipment Category</th>
                <th>Status</th>
            </tr>
            
            <% 
            List<Request> requestList = (List<Request>) request.getAttribute("requestList");
            for (Request req : requestList) { 
            %>
            <tr>
                <td><%= req.getRequestID() %></td>
                <td><%= req.getRequestDate() %></td>
                <td><%= req.getEquipment().getEquipmentID() %></td>
                <td><%= req.getEquipment().getCategory() %></td>
                <td><%= req.getStatus() %></td>
            </tr>
            <% } %>
        </table>
        
        <a href="welcome">Go Back</a>
    </div>
</body>
</html>
