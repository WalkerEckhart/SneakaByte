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
<title>Home</title>
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
          <a class="nav-link active" aria-current="page" href="#" style="color: white"">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/dashboard" style="color: white"">About Us</a>
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
</nav>		<!-- Info -->
		<div class="container-*" style="background-color: white; width:100%; height:800px;">
	<div class="container-*" style="background-color: white ;height:960px; ">
	    <div class="p-5 text-dark"
	    style="background-color: white; margin-top: 50px; font-size: 1.5em; height:800px; width:100%"> <p>Welcome to SneakaByte, the brainchild of three dedicated programming students. Designed and coded in Java, SneakaByte is more than just a shoe resale website; it's a labor of love and a showcase of our passion for sneakers and technology.
What sets SneakaByte apart is our commitment to giving back. With every purchase made on our platform, a portion of the proceeds goes towards providing shoes for underprivileged kids in cities where footwear is a luxury. So, when you shop with us, you're not just upgrading your sneaker game; you're also contributing to a meaningful cause.
Our carefully curated collection of sneakers offers a wide range of styles, sizes, and brands, ensuring that there's something for everyone. Whether you're a dedicated sneakerhead hunting for rare gems or a style-conscious individual looking to elevate your wardrobe, SneakaByte has you covered.
Our user-friendly platform ensures a seamless buying and selling experience. You can trust that your transactions are secure and your personal information is protected.
Join us on this journey where style meets compassion, all thanks to the dedication of three programmers who came together to create SneakaByte. Be a part of our community, and let's take that meaningful step forward... </p> <p style="font-size: 2em; color: DarkOrange; margin-left: 750px">One sneaker at a time. </p>
			</p></div>
	  </div>
</div>
<div>
</div>
</div>
</body>
</html>
