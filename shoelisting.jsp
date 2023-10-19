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
<title>Shoe Listing</title>
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
	<form:form action="/itemlisting" method="POST" modelAttribute="newShoeListing">
			<div style="margin-top:50px">
				<div>
			        <form:label path="name">Name:</form:label> <br>
			        <form:errors path="name"></form:errors> <br>
			        <form:input path="name" class="form-floating" style="width: 300px;"/> <br>
			    </div>
			    
			    <div>
			        <form:label path="price">Price:</form:label> <br>
			        <form:errors path="price"></form:errors> <br>
			        <form:input path="price" class="form-floating" style="width: 300px;"/> <br>
			    </div>
			    
			    <div>
			        <form:label path="retailprice">Retail Price:</form:label> <br>
			        <form:errors path="retailprice"></form:errors> <br>
			        <form:input path="retailprice" class="form-floating" style="width: 300px;"/> <br>
			    </div>
			    
			    <div>
			        <form:label path="releaseyear">Release Year:</form:label> <br>
			        <form:errors path="releaseyear"></form:errors> <br>
			        <form:input path="releaseyear" class="form-floating" style="width: 300px;"/> <br>
			    </div>
			    
			    <div>
			        <form:label path="color">Color:</form:label> <br>
			        <form:errors path="color"></form:errors> <br>
			        <form:input path="color" class="form-floating" style="width: 300px;"/> <br>
			    </div>
			    	
			    <div>
			        <form:label path="description">Description:</form:label> <br>
			        <form:errors path="description"></form:errors> <br>
			        <form:input path="description" class="form-floating" style="width: 300px;"/> <br>
			    </div> <br>
			    
				<form:input type="hidden" path="shoeCreator" value="${loggedUser.id}"/>
				<input class="btn btn-primary" type="submit" value="Add Listing">
			</div>
			<!-- End of the right article -->
		</form:form>
	</div>

</body>
</html>
