<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">

<style type="text/css">
.card {
	margin: auto;
	width: 38%;
	max-width: 1000px;
	padding: 4vh 0;
	box-shadow: 0 6px 20px 0 rgba(0, 0, 0, 0.19);
	border-top: 3px solid rgb(38, 177, 45);
	border-bottom: 3px solid rgb(38, 177, 45);
	border-left: none;
	border-right: none
}

@media ( max-width :768px) {
	.card {
		width: 90%
	}
}

.title {
	font-weight: 600;
	margin-bottom: 2vh;
	padding: 0 8%;
	font-size: initial
}

#details {
	font-size:15px;
}

.info {
	padding: 5% 8%
}

.info .col-5 {
	padding: 0
}

#heading {
font-size:15px;
	color: grey;
	line-height: 3vh;
}

.pricing {
	background-color: #ddd3;
	padding: 1vh 8%;
	font-size:15px;
	line-height: 2.5
}

.pricing .col-3 {
	padding: 0;
	font-size:15px;
}

.total {
	padding: 2vh 8%;
	color: rgb(252, 103, 49);
	font-weight: bold
}

.text-success {
	float: right;
	text-align: right
}

.total .col-3 {
	padding: 0
}

#price {
	float: right;
	text-align: right;
}
</style>
</head>
<body>
	<div class="card mt-5 pt-3">
		<div class="title text-danger my-0 py-0">Order Details</div>
		<div class="info">
			<div class="row">
				<div class="col-7">
					<span id="heading">Order Reference No.</span><br> <span
						id="details">${order.orderReference}</span>
				</div>
				<div class="col-5 pull-right">
					<span id="heading">Order Date.</span><br> <span id="details">
						${order.createdDate} </span>
				</div>
			</div>
		</div>
		<hr>
		<div class="title text-danger">
			Product Details<span class="badge badge-success badge-pill px-2 py-1 mx-2">${orderDetails.products.size()}</span>
		</div>
		<div class="pricing ">
			<c:forEach items="${orderDetails.products}" var="orderDetail">
				<div class="row">
					<div class="col-9">
						<span id="name">${orderDetail.productName }
							(${orderDetail.quantity })</span>
					</div>
					<div class="col-3">
						<span id="price">&#x20B9;${orderDetail.price }</span></span>
					</div>
				</div>
			</c:forEach>
		</div>
		<div class="total">
			<div class="row">
				<div class="col-9 text-danger">Total</div>
				<div class="col-3 text-success">
					<big>&#8377;${orderDetails.totalAmount }</big>
				</div>
			</div>
		</div>
		<hr>
		<div class="tracking">
			<div class="title text-danger mt-2">Billing address</div>
		</div>
		<div class="row">

			<div class="col-10 mx-5">${order.address.name}
				${order.address.phoneNo} ${order.address.address}
				${order.address.landMark} ${order.address.city}
				${order.address.state} ${order.address.pinCode}</div>
		</div>
		<hr>
		<div class="tracking">
			<div class="title text-danger mt-2">Expected Delivery</div>
		</div>
		<div class="row">

			<div class="col-10 mx-5">Your order will be delivered in 2
				days.</div>
		</div>
		<hr>
		<div class="row">
			<div class="col d-flex flex-row-reverse mr-5">
				<span id="heading"><a
					href="${pageContext.request.contextPath}/products?categoryId=">Back
						To Shop <svg xmlns="http://www.w3.org/2000/svg" width="16"
							height="16" fill="currentColor" class="bi bi-arrow-right"
							viewBox="0 0 16 16">
  <path fill-rule="evenodd"
								d="M1 8a.5.5 0 0 1 .5-.5h11.793l-3.147-3.146a.5.5 0 0 1 .708-.708l4 4a.5.5 0 0 1 0 .708l-4 4a.5.5 0 0 1-.708-.708L13.293 8.5H1.5A.5.5 0 0 1 1 8z" />
</svg>
				</a></span>
			</div>
		</div>

	</div>
</body>
</html>