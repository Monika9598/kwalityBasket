<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script
	src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
<script
	src='https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.bundle.min.js'></script>
<link href='https://use.fontawesome.com/releases/v5.7.2/css/all.css'>
<link href="<c:url value="/static/css/cart.css" />" rel="stylesheet">
<style>
.card:hover {
	transform: scale(1.1);
	transition: all 0.5s ease-in-out;
	cursor: pointer
}
</style>

<script>
	function addToCart(productId, userName) {
	if(userName) {
		$.ajax({
			url : '<%=request.getContextPath()%>/addToCart?productId=' + productId + '&quantity=1',
			type : 'POST',
			success : function(data) {
				$('#cart').text(" " + data);
			},
			error : function(xhr, status, error) {
			}
		});
		} else {
		alert('Please sign in first to add to cart');
		window.location.assign('<%=request.getContextPath()%>/login');
		}
	}
</script>
</head>
<body>
	<!-- Products Section -->
	<div class="container py-3">
		<div class="row" id="products">
		   ${message}
			<c:forEach items="${listProduct}" var="product">
				<div
					class="col-lg-4 col-md-6 col-sm-10 offset-md-0 offset-sm-1 pt-3">
					<div class="card">
						<img class="card-img-top"
							src="data:image/gif;base64,${product.image}">
						<div class="card-body card-body2">
							<h6 class="font-weight-bold pt-1">${product.productName}</h6>
							<div class="text-muted description">${product.description}</div>
							<div class="d-flex align-items-center product">
								<span class="fas fa-star"></span> <span class="fas fa-star"></span>
								<span class="fas fa-star"></span> <span class="fas fa-star"></span>
								<span class="far fa-star"></span>
							</div>
							<div
								class="d-flex align-items-center justify-content-between pt-3">
								<div class="d-flex flex-column">
									<div class="h6 font-weight-bold">&#x20B9;
										${product.price}</div>

								</div>
								<button class="btn btn2 btn-danger my-2 my-sm-0" type="submit"
									onclick="addToCart(${product.id}, '${pageContext.request.userPrincipal.name}')">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="20"
										fill="currentColor" class="bi bi-cart3" viewBox="0 0 16 16">
                                            <path
											d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .49.598l-1 5a.5.5 0 0 1-.465.401l-9.397.472L4.415 11H13a.5.5 0 0 1 0 1H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l.84 4.479 9.144-.459L13.89 4H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z" />
                                          </svg>

								</button>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>