<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix= "c" uri= "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Orders</title>
<style>
table, th, td {
  border:1px solid black;
  text-align: center;
}
body{
background-color: red;
}
#nav{
float: right
}
</style>
</head>
<body>
<form id = "nav" action = "deleteOrderServlet" method= "post">
<input type="submit" value="Logout" name="action">
<input type="submit" value="Home" name="action">
<input type ="hidden" name ="id" value="${id}">
</form>
<table style="width:100%">
<tr>
<th>Order Id</th>
<th>Car Id</th>
<th>Account Id</th>
<th>Order Date</th>
<th>Name</th>
<th>Email</th>
<th>Phone</th>
<th>Address</th>
<th>Vehicle</th>
<th>Price</th>
<th>Delete</th>
</tr>
<c:forEach items="${requestScope.allOrders}" var="currentOrder">
<tr>
<td>${currentOrder.orderId}</td>
<td>${currentOrder.car.carId}</td>
<td>${currentOrder.account.accountId}</td>
<td>${currentOrder.ld}</td>
<td>${currentOrder.account.firstName} ${currentOrder.account.lastName}</td>
<td>${currentOrder.account.email}</td>
<td>${currentOrder.account.phoneNumber}</td>
<td>${currentOrder.account.address}</td>
<td>${currentOrder.car.year} ${currentOrder.car.make} ${currentOrder.car.model}</td>
<td>
<fmt:setLocale value = "en_US"/>
<fmt:formatNumber value = "${currentOrder.car.price}" type = "currency"/>
</td>
<td>
<form method= "post" action="deleteOrderServlet" onSubmit="return confirm('Do you want to delete this order?') ">
<input type ="hidden" name ="orderId" value="${currentOrder.orderId}">
<input type ="hidden" name ="id" value="${id}">
<input type = "submit" value= "Delete" name= "action">
</form>
</td>
</tr>
</c:forEach>
</table>
</body>
</html>