<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Request Equipment</title>
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
    <% } %>

    <%-- Display error messages if available --%>
    <% if (request.getAttribute("errorMessage") != null) { %>
        <script>
            showUnavailable();
        </script>
        <p>Error Message: ${errorMessage}</p>
    <% } %>
    
    <%-- Display not found message if available --%>
    <% if (request.getAttribute("notFoundMessage") != null) { %>
        <script>
            showNotFound();
        </script>
        <p>Please Try again with correct equipment ID: ${notFoundMessage}</p>
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