<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix= "c" uri= "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create Account</title>
<style>
body{
background-color: red;
}
</style>
<script type = "text/javascript">
function validate() {
	var email = document.register.email.value;
	var phone = document.register.phoneNumber.value;
	var phoneFormat = /^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$/im;
    var atpos = email.indexOf("@");
    var dotpos = email.lastIndexOf(".");
	
	if(email == ""){
		alert("Email Field Cannot Be Empty!");
		return false;
	}
    else if (atpos < 1 || ( dotpos - atpos < 2 )) {
       alert("Please enter a valid email")
       return false;
    }
	else if(document.register.password.value == ""){
		alert("Password Field Cannot Be Empty!");
		return false;
	}
	else if(document.register.password2.value == ""){
		alert("Password Field Cannot Be Empty!");
		return false;
	}
	else if(document.register.firstName.value == ""){
		alert("First Name Field Cannot Be Empty!");
		return false;
	}
	else if(document.register.lastName.value == ""){
		alert("Last Name Field Cannot Be Empty!");
		return false;
	}
	else if(document.register.address.value == ""){
		alert("Address Field Cannot Be Empty!");
		return false;
	}
	else if(phone == ""){
		alert("Phone Number Field Cannot Be Empty!");
		return false;
	}
	else if(!phoneFormat.test(phone)){
		alert("Please enter a valid Phone Number!")
		return false;
	}
	else if(!document.register.password.value.match(/^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9])(?!.*\s).{8,15}$/)){
		alert("Password must be between 8 and 15 characters and must have at least 1 upercase, 1 lowercase, 1 number, and 1 special symbol!")
	}
	else if(document.register.password.value != document.register.password2.value){
		alert("Passwords Must Be Identical!");
		return false;
	}

    return( true );
 }
      </script>
</head>
<body>
<form action = "registerServlet" name = "register" method= "post" onsubmit = "return(validate());">
First name: <input type = "text" name = "firstName" value = "${requestScope.firstName}">
<br>
Last Name: <input type = "text" name = "lastName" value = "${requestScope.lastName}">
<br>
Address: <input type = "text" name = "address" value = "${requestScope.address}">
<br>
Phone Number: <input type = "text" name = "phoneNumber" value = "${requestScope.phoneNumber}">
<br>
Email: <input type = "text" name = "email" value = "${requestScope.email}">
<br>
Password: <input type = "text" name = "password" value = "${requestScope.password}">
<br>
Confirm Password: <input type = "text" name = "password2" value = "${requestScope.password2}">
<br>
<input type = "submit" value= "Register">
</form>

<c:set var="message" value="${requestScope.message}"/>
<c:if test="${(message != null)}">
<script>
  alert("${message}");
</script>
</c:if>
</body>
</html>