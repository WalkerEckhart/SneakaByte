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
<title>Buy Shoes</title>
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
	<div class = "container-*" style = "margin-top:50px">
		<div>
			<h2 style="font-size:2.5em"><c:out value="${thisShoe.name}"></c:out></h2>
			<h3>$<c:out value="${ thisShoe.price}"/></h3>
			<p>Seller: <c:out value="${loggedUser.userName}"/> </p>
		</div>
	<hr>
		<div>
			<div>
				<p>Color: <c:out value="${ thisShoe.color}"/></p>
				<p>Retail Price: $<c:out value="${ thisShoe.retailprice}"/></p>
				<p>Description: <c:out value="${ thisShoe.description}"/></p>
				<p>Release Year: <c:out value="${ thisShoe.releaseyear}"/></p>
				
			</div>
			<c:if test="${loggedUser.id == thisShoe.shoeCreator.id }" >
				<div>
					<div>
						<a href="/itemlisting/edit/${thisShoe.id}" class="btn btn-primary">Edit</a> <br>
					</div> <br>
					<div>
						<form method="post" action="/delete/${thisShoe.id}">
							 <div>
								<input type="hidden" name="_method" value="delete"/>
								<input type="submit" class="btn btn-danger" value="Delete"/>
							 </div>
			
						</form>
					</div>
				
				</div>
			</c:if>
				
			
			
		</div>
	
	</div>
</body>
</html>
