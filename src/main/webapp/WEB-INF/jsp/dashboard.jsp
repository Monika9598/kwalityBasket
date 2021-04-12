<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">

</head>
<body>
	<jsp:include page="order_modal.jsp"></jsp:include>
	<div class="container my-5">
		<div class="dropdown">
			<button class="btn btn-secondary dropdown-toggle" type="button"
				id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false">Order Status</button>
			<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
				<a class="dropdown-item" href="#">Pending delivery</a> <a
					class="dropdown-item" href="#">Order delivered</a>
			</div>
		</div>
	</div>
	<div class="container">
		<table class="table table-hover" id="tableId">
			<thead>
				<tr>
					<th scope="col">Order Ref#</th>
					<th scope="col">Customer name</th>
					<th scope="col">Contact number</th>
					<th scope="col">Order date</th>
					<th scope="col">Amount</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${orders}" var="orderDetail">
				<tr>
			<%-- 	<th scope="row"><a href="${pageContext.request.contextPath}/order_modal" method="get" data-toggle="modal"
						data-target="#exampleModal">${orderDetail.orderReference}</a></th> --%>
						
					<th scope="row"><a href="#" data-toggle="modal"
						data-target="#exampleModal">${orderDetail.orderReference}</a></th>
					<td>${orderDetail.address.user.fullName}</td>
					<td>${orderDetail.address.user.mobile}</td>
					<td>${orderDetail.createdDate}</td>
					<td>&#x20B9; ${orderDetail.totalAmount}</td>
				</tr>
				</c:forEach>
		</table>
	</div>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
		integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"
		integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF"
		crossorigin="anonymous"></script>
</body>
</html>