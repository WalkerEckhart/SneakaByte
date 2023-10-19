<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isErrorPage="true" %>
<!-- Tag for JSP files -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css">
</head>
<body>
	<!-- This would Greet the  -->
	<div class="container-*" style="background-color: white;"> 
<nav class="navbar navbar-expand-xl navbar-light bg-light" style="">
  <div class="container-fluid" style="overflow: hidden; background-color: dimgrey; position: fixed; top: 0; width: 100%; z-index: 1000; border-bottom: 1px solid black;  display: flex; justify_content:space-evenly">
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse show" id="navbarText">
      <ul class="navbar-nav me-auto mb-2 mb-xl-0">
      <li>
      <h2>Welcome, <c:out value="${loggedUser.userName}"/>!</h2>
      </li>
        <li>
        	<a class="navbar-brand" href="/dashboard" style= "font-size: 2.5em; color: DarkOrange; margin-left: 425px">SneakaByte</a>
        </li>
        <li class="nav-item">
        <a class="nav-link" href="/itemlisting"> Sell a pair</a>
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
<div class="container-*" style="margin-top:50px">
<div class="row row-cols-1 row-cols-sm-2 g-3">
  <div class="col" style="width:375px; height: 400px; margin-left: 100px">
  
  <c:forEach var="shoeoption" items="${shoeOptions}"> 			<!-- ADD LATER -->
    <div class="card">
      <div class="null" style="width:inherit; height:250px; background-color:red"></div>
      <div class="card-body">
        <h5 class="card-title"><c:out value="${shoeoption.name}"></c:out></h5>
        <p class="card-text"><c:out value="${shoeoption.price}"></c:out></p>
        <p class="card-text" style="font-size:.75em"><c:out value="${shoeoption.description}"></c:out></p>
        <a href="/itemlisting/account/${shoeoption.id}">View Shoe</a>
      </div>
    </div>
    </c:forEach>
  </div>
</div>
	</div>
</body>
</html>
