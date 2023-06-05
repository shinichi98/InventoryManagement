<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Request Equipment</title>
    <style>
        h1 {
            text-align: center;
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
            width: 200px;
            padding: 5px;
        }
        
        input[type="submit"] {
            padding: 5px 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }
        
        a {
            display: block;
            text-align: center;
            margin-top: 20px;
        }
        
        p {
            text-align: center;
            margin-top: 10px;
        }
    </style>
    <script>
        function showConfirmation() {
            alert("Request has been raised successfully!");
        }

        function showUnavailable() {
            alert("Equipment is not available");
        }
        
        function showNotFound() {
            alert("Equipment not found");
        }
    </script>
</head>
<body>
    <h1>Request Equipment</h1>
    
    <%-- Display success message if available --%>
    <% if (request.getAttribute("successMessage") != null) { %>
        <script>
            showConfirmation();
        </script>
        <p style="color: green;">Success Message: <%= request.getAttribute("successMessage") %></p>
    <% } %>

    <%-- Display error messages if available --%>
    <% if (request.getAttribute("errorMessage") != null) { %>
        <script>
            showUnavailable();
        </script>
        <p style="color: red;">Error Message: <%= request.getAttribute("errorMessage") %></p>
    <% } %>
    
    <%-- Display not found message if available --%>
    <% if (request.getAttribute("notFoundMessage") != null) { %>
        <script>
            showNotFound();
        </script>
        <p style="color: red;">Please try again with the correct equipment ID: <%= request.getAttribute("notFoundMessage") %></p>
    <% } %>
    
    <form action="requestequipment" method="POST">
        <label for="equipmentId">Equipment ID:</label>
        <input type="text" id="equipmentId" name="equipmentId">
        <br>
        <input type="submit" value="Request">
    </form>
    
    <a href="welcome">Go Back</a>
</body>
</html>
