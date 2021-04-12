<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<title>cart</title>
<link href="<c:url value="/static/css/cart.css" />" rel="stylesheet">
<style type="text/css">
.btn {
	color: white;
	border-radius: 1
}
</style>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
function updateCart(productId, quantity) {
	 $.post("<%=request.getContextPath()%>/addToCart?productId="+productId+"&quantity="+quantity,null, function (data) {
			$('#cart').text(" "+data);
			location.reload(true);
			/* $("#cart-items").load(" #cart-items");
			$("#item-count1").load(" #item-count1");
			$("#item-count2").load(" #item-count2");
			$("#total-amount1").load(" #total-amount1");
			$("#total-amount2").load(" #total-amount2"); */	
	    });   
}

</script>

<style type="text/css">
@media screen and (max-width: 400px) {
	h4.shoppingCart {
		margin-top: 110px;
	}
}
</style>
</head>
<body>
	<div class="card mt-5 ">
		<div class="row">
			<div class="col-md-8 cart">
				<div class="title">
					<div class="row">
						<div class="col">
							<h4 class="shoppingCart">
								<b>Shopping Cart</b>
							</h4>
						</div>
						<div id="item-count1"
							class="col align-self-center text-right text-muted">${cart.products.size()}
							Items</div>
					</div>
				</div>
				<c:if test="${cart.products.size() == 0}">
					<div id="empty-cart">
						<p>You have 0 items in your cart</p>
					</div>
				</c:if>
				<c:if test="${cart.products.size() > 0}">
					<div id="cart-items" class="row border-top border-bottom">
						<c:forEach items="${cart.products}" var="cart">
							<div class="row main align-items-center">
								<div class="row main align-items-center">
									<div class="col-2">
										<img class="img-fluid"
											src="data:image/gif;base64,${cart.image}">
									</div>
									<div class="col">
										<div class="row text-muted">${cart.description}</div>
										<div class="row">${cart.productName}</div>
									</div>
									<div class="col">
										<a href="#" onclick="updateCart(${cart.id}, -1);return false;">-</a>
										<a href="#" class="border">${cart.quantity}</a> <a href="#"
											onclick="updateCart(${cart.id}, 1);return false;">+</a>
									</div>
									<div class="col">
										&#x20B9; ${cart.price} <span class="close pt-sm-1"
											onclick="updateCart(${cart.id}, -${cart.quantity});return false;"><svg
												xmlns="http://www.w3.org/2000/svg" width="16" height="16"
												fill="currentColor" class="bi bi-trash-fill"
												viewBox="0 0 16 16">
                                          <path
													d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z" />
                                        </svg></span>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</c:if>
				<div class="back-to-shop">
					<a href="${pageContext.request.contextPath}/products?categoryId=">&leftarrow;<span
						class="text-muted"> Back to shop</span></a>
				</div>
			</div>
			<div class="col-md-4 summary">
				<div>
					<h5>
						<b>Summary</b>
					</h5>
				</div>
				<hr>
				<div class="row">
					<div id="item-count2" class="col" style="padding-left: 0;">ITEMS
						${cart.products.size()}</div>
					<div id="total-amount1" class="col text-right">&#x20B9;
						${cart.totalAmount}</div>
				</div>
				<form>
					<p>SHIPPING</p>
					<select>
						<option class="text-muted">Standard-Delivery-
							&#x20B9;5.00</option>
					</select>

				</form>
				<div class="row" style="padding: 2vh 0;">
					<div class="col">TOTAL PRICE</div>
					<div id="total-amount2" class="col text-right">&#x20B9;
						${cart.totalAmount}</div>
				</div>
				<a href="${pageContext.request.contextPath}/checkout">
					<button class="btn btn-primary btn-lg btn-block"
						${ cart.products.size() == 0  ? 'disabled="disabled"' : ''}>Checkout
					</button>
				</a>
			</div>
		</div>
	</div>

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