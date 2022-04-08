<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Home</title>
<style>
body{
text-align: center;
background-color: red;
}
</style>
</head>
<body>
<button style = "float: right;" onclick="location.href = 'home.html'">Logout</button>
<form method= "post" action="adminServlet">
<input type ="hidden" name ="id" value="${id}">
<input type ="submit" value ="View As Customer" name="action">
<input type ="submit" value ="Modify Listings" name="action">
<input type ="submit" value ="Create Listing" name="action">
<input type ="submit" value ="View Orders" name="action">
</form>
</body>
</html>