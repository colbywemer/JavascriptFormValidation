<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix= "c" uri= "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Modify Listings</title>
<style>
table, th, td {
  border:1px solid black;
  text-align: center;
}
body{
text-align center;
background-color: red;
}
#nav{
float: right
}
</style>
</head>
<body>
<form id = "nav" action = "modifyCarServlet" method= "post">
<input type="submit" value="Logout" name="action">
<input type="submit" value="Home" name="action">
<input type ="hidden" name ="id" value="${id}">
</form>
<table>
<tr>
<th>Id</th>
<th>Make</th>
<th>Model</th>
<th>Year</th>
<th>Price</th>
<th>Type</th>
<th>Color</th>
<th>Fuel Type</th>
<th>MPG/Range</th>
<th>Safety Rating</th>
<th>Engine</th>
<th>Transmission</th>
<th>Drivetrain</th>
<th>Action</th>
</tr>
<c:forEach items="${requestScope.allCars}" var="currentCar">
<tr>
<td>${currentCar.carId}</td>
<td>${currentCar.make}</td>
<td>${currentCar.model}</td>
<td>${currentCar.year}</td>
<td>
<fmt:setLocale value = "en_US"/>
<fmt:formatNumber value = "${currentCar.price}" type = "currency"/>
</td>
<td>${currentCar.type}</td>
<td>${currentCar.color}</td>
<td>${currentCar.fuelType}</td>
<td>${currentCar.mpg}</td>
<td>${currentCar.safetyRating}</td>
<td>${currentCar.engine}</td>
<td>${currentCar.transmission}</td>
<td>${currentCar.drivetrain}</td>
<td>
<form method= "post" action="modifyCarServlet">
<input type ="hidden" name ="id" value="${id}">
<input type ="hidden" name ="carId" value="${currentCar.carId}">
<input type = "submit" value = "edit" name= "action">
<input type = "submit" value = "delete" name= "action">
</form>
</td>
</tr>
</c:forEach>
</table>

</body>
</html>