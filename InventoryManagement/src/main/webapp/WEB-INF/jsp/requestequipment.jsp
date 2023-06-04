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
    </script>
</head>
<body>
    <h1>Request Equipment</h1>
    
    <form action="requestEquipment" method="POST">
        <label for="equipmentId">Equipment ID:</label>
        <input type="text" id="equipmentId" name="equipmentId">
        <br>
        <input type="submit" value="Request">
    </form>
    
    <a href="welcome">Go Back</a>
</body>
</html>
