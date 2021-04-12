<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
	"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product Management</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<script
	src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
<script
	src='https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.bundle.min.js'></script>
<link href='https://use.fontawesome.com/releases/v5.7.2/css/all.css'>
<link href="<c:url value="/static/css/cart.css" />" rel="stylesheet">
</head>
<body>
	<div class="wrapper">
		<div class="d-md-flex align-items-md-center mt-5">
			<div class="h3">Feed your family the best <span style="color: orange; font-size: 15px; "> -> ${category}</span></div>
		</div>
		<div id="mobile-filter">
			<div class="py-3">
				<h5 class="font-weight-bold">Categories</h5>
				<c:forEach items="${categories}" var="category">
					<ul class="list-group">
						<li
							class="list-group-item list-group-item-action d-flex justify-content-between align-items-center category">
							<a
							href="${pageContext.request.contextPath}/products?categoryId=${category.id}">${category.categoryName}</a>
						</li>
					</ul>
				</c:forEach>
			</div>
		</div>


		<div class="content py-md-0 py-3">
			<section id="sidebar">
			<div class="py-3">
				<h5 class="font-weight-bold mt-3">Categories</h5>
				<c:forEach items="${categories}" var="category">
					<ul class="list-group">
						<li
							class="list-group-item list-group-item-action d-flex justify-content-between align-items-center category">
							<a
							href="${pageContext.request.contextPath}/products?categoryId=${category.id}">${category.categoryName}</a>
						</li>
					</ul>
				</c:forEach>
			</div>
			</section>
		</div>
	</div>
</body>
</html>