<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix= "c" uri= "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Car</title>
<style>
body{
background-color: red;
}
#nav{
float: right
}
</style>
<script type = "text/javascript">
function validate() {
	 var numberFormat = /^[0-9]+$/;
	 var year = document.edit Listing.year.value;
	 var mpg = document.editListing.mpg.value;
	 var price = document.editListing.price.value;
	 var priceFormat = /^\d+(?:\.\d+)?(?:,\d+(?:\.\d+)?)*$/gm;
	if(document.editListing.make.value == ""){
		alert("Make Field Cannot Be Empty!");
		return false;
	}
	else if(document.editListing.model.value == ""){
		alert("Model Field Cannot Be Empty!");
		return false;
	}
	else if(year == ""){
		alert("Year Field Cannot Be Empty!");
		return false;
	}
	else if(!numberFormat.test(year) || year.length != 4){
		alert("Please enter a valid Year!")
		return false;
	}
	else if(mpg == ""){
		alert("MPG / Range Field Cannot Be Empty!");
		return false;
	}
	else if(!numberFormat.test(mpg)){
		alert("Please enter a valid MPG / Range!")
		return false;
	}
	else if(document.editListing.engine.value == ""){
		alert("Engine Field Cannot Be Empty!");
		return false;
	}
	else if(document.editListing.color.value == ""){
		alert("Color Field Cannot Be Empty!");
		return false;
	}
	else if(price == ""){
		alert("Price Field Cannot Be Empty!");
		return false;
	}
	else if(!priceFormat.test(price) || price.indexOf(".") != -1 && price.length - (price.indexOf(".") + 1) > 2){
		alert("Please enter a valid Price!")
		return false;
	}
	else if(document.editListing.safteyRating.value == ""){
		alert("Safety Rating Field Cannot Be Empty!");
		return false;
	}
	else if(document.editListing.type.value == ""){
		alert("Type Field Cannot Be Empty!");
		return false;
	}
	else if(document.editListing.transmission.value == ""){
		alert("Please Select Transmission");
		return false;
	}
	else if(document.editListing.fuelType.value == ""){
		alert("Please Select Fuel Type");
		return false;
	}
	else if(document.editListing.drivetrain.value == ""){
		alert("Please Select Drivetrain");
		return false;
	}

    return( true );
 }
      </script>
</head>
<body>
<form id = "nav" name = "editListing" action = "editCarServlet" method= "post" onsubmit = "return(validate());">
<input type="submit" value="Logout" name="action">
<input type="submit" value="Home" name="action">
<input type ="hidden" name ="id" value="${id}">
</form>
<form action = "editCarServlet" method= "post">
<input type ="hidden" name ="id" value="${id}">
<input type ="hidden" name ="carId" value="${requestScope.car.carId}">
Make: <input type = "text" name = "make" value = "${requestScope.car.make}">
<br>
Model: <input type = "text" name = "model" value = "${requestScope.car.model}">
<br>
Year: <input type = "text" name = "year" value = "${requestScope.car.year}">
<br>
MPG/Range: <input type = "text" name = "mpg" value = "${requestScope.car.mpg}">
<br>
Engine: <input type = "text" name = "engine" value = "${requestScope.car.engine}">
<br>
Color: <input type = "text" name = "color" value = "${requestScope.car.color}">
<br>
Price: <input type = "text" name = "price" value = "${requestScope.car.price}">
<br>
Safety Rating: <input type = "text" name = "safteyRating" value = "${requestScope.car.safetyRating}">
<br>
Type: <input type = "text" name = "type" value = "${requestScope.car.type}">
<br>
Transmission: <select name="transmission" id="transmission">

<c:set var="transmission" value="${requestScope.car.transmission}"/>
<c:if test="${(transmission != ''|| transmission != null)}">
<c:if test="${(transmission == 'Automatic')}">
<option selected value="Automatic" >Automatic</option>
<option value="Manual">Manual</option>
</c:if>
<c:if test="${(transmission == 'Manual')}">
<option value="Automatic">Automatic</option>
  <option selected value="Manual">Manual</option>
</c:if>
</c:if>
<c:if test="${(transmission == ''|| transmission == null)}">
<option value="" >Select Transmission</option>
  <option value="Automatic">Automatic</option>
  <option value="Manual">Manual</option>
</c:if>
</select>
<br>
Fuel Type: <select name="fuelType" id="fuelType">

<c:set var="fuelType" value="${requestScope.car.fuelType}"/>
<c:if test="${(fuelType != '' || fuelType != null)}">
<c:if test="${(fuelType == 'Gas')}">
<option selected value="Gas">Gas</option>
  <option value="Diesel">Diesel</option>
  <option value="Electric">Electric</option>
</c:if>
<c:if test="${(fuelType == 'Diesel')}">
<option value="Gas">Gas</option>
  <option selected value="Diesel">Diesel</option>
  <option value="Electric">Electric</option>
</c:if>
<c:if test="${(fuelType == 'Electric')}">
<option value="Gas">Gas</option>
  <option value="Diesel">Diesel</option>
  <option selected value="Electric">Electric</option>
</c:if>
</c:if>
<c:if test="${(fuelType == '' || fuelType == null)}">
<option value="" >Select Fuel Type</option>
  <option value="Gas">Gas</option>
  <option value="Diesel">Diesel</option>
  <option value="Electric">Electric</option>
</c:if>
</select>
<br>
Drivetrain: <select name="drivetrain" id="drivetrain">

<c:set var="drivetrain" value="${requestScope.car.drivetrain}"/>
<c:if test="${(drivetrain != '' || drivetrain != null)}">
<c:if test="${(drivetrain == 'AWD')}">
<option selected value="AWD">AWD</option>
  <option value="FWD">FWD</option>
  <option value="RWD">RWD</option>
  <option value="4WD">4WD</option>
</c:if>
<c:if test="${(drivetrain == 'FWD')}">
<option value="AWD">AWD</option>
  <option selected value="FWD">FWD</option>
  <option value="RWD">RWD</option>
  <option value="4WD">4WD</option>
</c:if>
<c:if test="${(drivetrain == 'RWD')}">
<option value="AWD">AWD</option>
  <option value="FWD">FWD</option>
  <option selected value="RWD">RWD</option>
  <option value="4WD">4WD</option>
</c:if>
<c:if test="${(drivetrain == '4WD')}">
<option selected value="4WD">4WD</option>
<option value="AWD">AWD</option>
  <option value="FWD">FWD</option>
  <option value="RWD">RWD</option>
</c:if>
</c:if>
<c:if test="${(drivetrain == '' || drivetrain == null)}">
<option value="" >Select Drivetrain</option>
  <option value="AWD">AWD</option>
  <option value="FWD">FWD</option>
  <option value="RWD">RWD</option>
  <option value="4WD">4WD</option>
</c:if>
</select>
<br>
<input type = "submit" value= "Edit Listing" name = "action">
</form>
</body>
</html>