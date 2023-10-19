<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isErrorPage="true" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/css/style.css">
<title>User Registration</title>
</head>
<body>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container-*" style="background-color: white;"> 
<nav class="navbar navbar-expand-xl navbar-light bg-light">
  <div class="container-fluid" style="overflow: hidden;
  background-color: dimgrey; position: fixed; top: 0; width: 100%; z-index: 1000; border-bottom: 1px solid black">
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse show" id="navbarText">
      <ul class="navbar-nav me-auto mb-2 mb-xl-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="/" style="color: white">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/dashboard" style="color: white">About Us</a>
        </li>
        <li>
        		<a class="navbar-brand" href="/dashboard" style= "font-size: 2.5em; color: DarkOrange; margin-left: 425px">SneakaByte</a>
        	</li>
      </ul>
      <c:if test = "${userId == null}">
      <a href="/login" class="btn btn-outline-light" style="margin-right: 5px">Log In</a>
      <a href="/register" class="btn btn-outline-light">Register</a>  
      </c:if>
      <c:if test="${userId != null}">
      <a href="/logout" class="btn btn-danger">Log Out</a>
      </c:if>
      </div>
  </div>
</nav>
<div class="d-flex p-2 bd-highlight" style="margin-top: 250px; margin-left: 425px">
<h2 class="display-6" style="margin-right:20px">Register:</h2>
<form:form action="/register" mode="POST" modelAttribute="registerUser">
		
	
			<form:label path="userName"> Username: </form:label> <br>
			<form:errors path="userName"/> <br>
			<form:input path="userName" class="form-floating" style="width: 300px;"/> <br>
	
		
	
			<form:label path="email"> Email: </form:label> <br>
			<form:errors path="email"/> <br>
			<form:input type="email" path="email" class="form-floating" style="width: 300px;"/> <br>
		
		
		
			<form:label path="password"> Password: </form:label> <br>
			<form:errors path="password"/> <br>
			<form:password path="password" class="form-floating" style="width: 300px;"/> <br>
		
		
		
			<form:label path="confirmedPassword"> Confirm Password: </form:label> <br>
			<form:errors path="confirmedPassword"/> <br>
			<form:password path="confirmedPassword" class="form-floating" style="width: 300px;"/> <br>
		<br>
		
		<input type="submit" class ="btn btn-success" value="Register"/>
</form:form>
</div>
</body>
</html
