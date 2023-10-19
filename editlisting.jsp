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
<title>Edit Shoe Listing</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css">
</head>
<body>

	<!-- EDITING SHOE LISTING -->
	<div>
		<form:form action="/itemlisting/editDB/${thisShoeListing.id }" method="POST" modelAttribute="thisShoeListing">
			<input type="hidden" name="_method" value="PUT"/>			
			<div>
				<h3>Update Listing</h3>
			</div>
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
				
			<!-- After Submitting, this would go straight to, viewforsaleshoes.jsp -->
				<input type="submit" class="btn btn-primary" value="Edit Listing">
			</div>
			<!-- End of the right article -->
		</form:form>
		
			<a href="/itemlisting/account/${thisShoe.id}" class="btn btn-danger">Cancel</a>
	</div>
</body>
</html>
