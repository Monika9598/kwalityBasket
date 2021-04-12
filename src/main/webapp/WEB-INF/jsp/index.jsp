<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
	"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product Management</title>
</head>
<body>
<div align="center">
	<h2>Product Management</h2>
	<form method="get" action="search">
		<input type="text" name="keyword" /> &nbsp;
		<input type="submit" value="Search" />
	</form>
	<h3><a href="new">New Product</a></h3>
	<table border="1" cellpadding="5">
		<tr>
			<th>ID</th>
			<th>Name</th>
			<th>Product description</th>
			<th>Product Category</th>
			<th>Quantity</th>
			<th>Size</th>
			<th>Image</th>
		</tr>
		<c:forEach items="${listProduct}" var="product">
		<tr>
			<td>${product.id}</td>
			<td>${product.productName}</td>
			<td>Category</td>
			<td>${product.description}</td>
			<td>Category</td>
			<td>${product.size}</td>
			<td>${product.image}</td>
			<td>
				<a href="edit?id=${product.id}">Edit</a>
				&nbsp;&nbsp;&nbsp;
				<a href="delete?id=${product.id}">Delete</a>
			</td>
		</tr>
		</c:forEach>
	</table>
</div>	
</body>
</html>