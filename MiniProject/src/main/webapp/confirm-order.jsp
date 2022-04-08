<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix= "c" uri= "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Order Confirmation</title>
<style>
body{
background-color: red;
text-align: center;}

</style>
</head>
<body>
<h2>Thank you for ordering the ${requestScope.order.year} ${requestScope.order.make} ${requestScope.order.model} for <fmt:setLocale value = "en_US"/>
<fmt:formatNumber value = "${requestScope.order.price}" type = "currency"/></h2>
<h2>Please come to the dealership to finalize and pickup your order.</h2>
<form method= "post" action="confirmServlet">
<input type="submit" value="Logout" name="action">
<input type="submit" value="Back To Listings" name="action">
<input type ="hidden" name ="id" value="${id}">
</form>
</body>
</html>