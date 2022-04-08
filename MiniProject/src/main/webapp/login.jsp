<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix= "c" uri= "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<style>
body{
background-color: red;
text-align: center;
}
</style>
<script type = "text/javascript">
function validate() {
	if(document.login.email.value == ""){
		alert("Email Field Cannot Be Empty!");
		return false;
	}
	else if(document.login.password.value == ""){
		alert("Password Field Cannot Be Empty!");
		return false;
	}

    return( true );
 }
      </script>
</head>
<body>
<form action = "loginServlet" name = "login" method= "post" onsubmit = "return(validate());">
Email: <input type = "text" name = "email" value = "${requestScope.email}">
Password: <input type = "text" name = "password" value = "${requestScope.password}">
<input type = "submit" value= "Login">
</form>

<c:set var="message" value="${requestScope.message}"/>
<c:if test="${(message != null)}">
<script>
  alert("${message}");
</script>
</c:if>
</body>
</html>