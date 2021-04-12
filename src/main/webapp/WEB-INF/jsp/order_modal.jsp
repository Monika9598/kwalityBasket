<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	
<!-- ------------------manual style---------- -->	


</head>
<body>
	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="card mt-5 pt-3">
						<div class="title text-danger my-0 py-0">Order Details</div>
						<div class="info">
							<div class="row">
								<div class="col-7">
									<span id="heading">Order Reference No.</span><br> <span
										id="details">${order.orderReference}</span>
								</div>
								<div class="col-5 pull-right">
									<span id="heading">Order Date.</span><br> <span
										id="details"> ${order.createdDate} </span>
								</div>
							</div>
						</div>
						<hr>
						<div class="title text-danger">
							Product Details<span
								class="badge badge-success badge-pill px-2 py-1 mx-2">${orderDetails.products.size()}</span>
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
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>