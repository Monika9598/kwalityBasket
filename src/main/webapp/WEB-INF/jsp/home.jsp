<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>KwalityBasket</title>
<!---------------------------Bootstrap4------------------------->
<link type="text/css" rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">


<!-------------------------fontawesome------------------------>
<link type="text/css"
	href='https://use.fontawesome.com/releases/v5.7.2/css/all.css'
	rel='stylesheet'>
<!-----------------------manual css file----------------------->
<link type="text/css" href="<c:url value="/static/css/home.css" />"
	rel="stylesheet">
<!--jquery-->
<script type='text/javascript'
	src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
<script type='text/javascript'
	src='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js'></script>
<!--js code for slider-->
<script type='text/javascript'>
	$(document).ready(function() {

		if ($('.bbb_viewed_slider').length) {
			var viewedSlider = $('.bbb_viewed_slider');

			viewedSlider.owlCarousel({
				loop : true,
				margin : 30,
				autoplay : true,
				autoplayTimeout : 6000,
				nav : false,
				dots : false,
				responsive : {
					0 : {
						items : 3
					},
					575 : {
						items : 3
					},
					768 : {
						items : 3
					},
					991 : {
						items : 4
					},
					1199 : {
						items : 6
					}
				}
			});

			if ($('.bbb_viewed_prev').length) {
				var prev = $('.bbb_viewed_prev');
				prev.on('click', function() {
					viewedSlider.trigger('prev.owl.carousel');
				});
			}

			if ($('.bbb_viewed_next').length) {
				var next = $('.bbb_viewed_next');
				next.on('click', function() {
					viewedSlider.trigger('next.owl.carousel');
				});
			}
		}

	});
</script>

<style type="text/css">
@media screen and (max-width: 400px) {
	div.mainContainer {
		margin-top: 110px;
	}
	div.mainContainer2 {
		margin-top: 10px;
	}
}
</style>

</head>


<body oncontextmenu='return false' class='snippet-body'>
	<!--owl courosel-->
	<link type="text/css" rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/owl.carousel.js"></script>

	<div class="container mainContainer mt-sm-5">
		<img src="<c:url value="/static/imgs/header.png" />"
			class="img-fluid pt-sm-2" alt="...">
	</div>
	<div class="container mainContainer2 ">
		<header class="my-sm-4">
			<div id="carouselExampleFade" class="carousel slide carousel-fade"
				data-ride="carousel">
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img src="<c:url value="/static/imgs/him.png" />"
							class="d-block w-100" alt="...">
					</div>
					<div class="carousel-item">
						<img src="<c:url value="/static/imgs/dettol.png" />"
							class="d-block w-100" alt="...">
					</div>
					<div class="carousel-item">
						<img src="<c:url value="/static/imgs/shop.png" />"
							class="d-block w-100" alt="...">
					</div>
				</div>
				<a class="carousel-control-prev" href="#carouselExampleFade"
					role="button" data-slide="prev"> <span
					class="carousel-control-prev-icon" aria-hidden="true"></span> <span
					class="sr-only">Previous</span>
				</a> <a class="carousel-control-next" href="#carouselExampleFade"
					role="button" data-slide="next"> <span
					class="carousel-control-next-icon" aria-hidden="true"></span> <span
					class="sr-only">Next</span>
				</a>
			</div>
		</header>
	</div>

	<!-- Page Content -->

	<div class="container py-4">
		<h3 class="bbb_viewed_title">Shop By Category</h3>
		<hr>
		<div class="row d-flex justify-content-around">
			<c:forEach items="${categories}" var="category">
				<a
					href="${pageContext.request.contextPath}/products?categoryId=${category.id}">
					<div class="col-12 card my-2 bg-warning text-center" style="width: 320px;">
						<div class="row">

							<div class="col-3 pt-2">
								<img
									src="https://pbs.twimg.com/media/Ex4A3-1U8AE5sDz?format=jpg&name=small"
									alt="..." style="width: 100px; height: 100px;">
							</div>

							<div class="col-9 pl-5">
								<div class="card-body">
									<h5 class="card-title">${category.categoryName}</h5>
									<button class="btn btn-danger py-0 px-2 mx-1">
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
											fill="currentColor" class="bi bi-arrow-right-circle"
											viewBox="0 0 16 16">
                   <path fill-rule="evenodd"
												d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8zm15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM4.5 7.5a.5.5 0 0 0 0 1h5.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H4.5z" />
                 </svg>
									</button>
									</span>
									</p>


								</div>
							</div>

						</div>
					</div>
				</a>
			</c:forEach>
		</div>
	</div>

	<div class="viewed pt-5">
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="bbb_viewed_title_container">
						<h3 class="bbb_viewed_title">Top Products</h3>
						<div class="bbb_viewed_nav_container">
							<div class="bbb_viewed_nav bbb_viewed_prev">
								<i class="fas fa-chevron-left"></i>
							</div>
							<div class="bbb_viewed_nav bbb_viewed_next">
								<i class="fas fa-chevron-right"></i>
							</div>
						</div>
					</div>
					<div class="bbb_viewed_slider_container">
						<div class="owl-carousel owl-theme bbb_viewed_slider">
							<div class="owl-item">
								<div
									class=" col-12 bbb_viewed_item discount d-flex flex-column align-items-center justify-content-center text-center">
									<div class="bbb_viewed_image">
										<img
											src="data:image/jpeg;base64,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"
											alt="">
									</div>
									<div class="bbb_viewed_content text-center">
										<div class="bbb_viewed_price">
											&#x20B9;280
										</div>
										<div class="bbb_viewed_name">
											<a href="#">Personal care</a>
										</div>
									</div>
									<ul class="item_marks">
										<li class="item_mark item_discount">-25%</li>
										<li class="item_mark item_new">new</li>
									</ul>
								</div>
							</div>
							<div class="owl-item">
								<div
									class="bbb_viewed_item d-flex flex-column align-items-center justify-content-center text-center">
									<div class="bbb_viewed_image">
										<img
											src="data:image/jpeg;base64,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"
											alt="">
									</div>
									<div class="bbb_viewed_content text-center">
										<div class="bbb_viewed_price">&#x20B9;300</div>
										<div class="bbb_viewed_name">
											<a href="#">Personal care</a>
										</div>
									</div>
									<ul class="item_marks">
										<li class="item_mark item_discount">-25%</li>
										<li class="item_mark item_new">new</li>
									</ul>
								</div>
							</div>
							<div class="owl-item">
								<div
									class="bbb_viewed_item d-flex flex-column align-items-center justify-content-center text-center">
									<div class="bbb_viewed_image">
										<img
											src="data:image/jpeg;base64,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"
											alt="">
									</div>
									<div class="bbb_viewed_content text-center">
										<div class="bbb_viewed_price">&#x20B9;222</div>
										<div class="bbb_viewed_name">
											<a href="#">Personal care</a>
										</div>
									</div>
									<ul class="item_marks">
										<li class="item_mark item_discount">-25%</li>
										<li class="item_mark item_new">new</li>
									</ul>
								</div>
							</div>
							<div class="owl-item">
								<div
									class="bbb_viewed_item is_new d-flex flex-column align-items-center justify-content-center text-center">
									<div class="bbb_viewed_image">
										<img
											src="data:image/jpeg;base64,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"
											alt="">
									</div>
									<div class="bbb_viewed_content text-center">
										<div class="bbb_viewed_price">&#x20B9;137</div>
										<div class="bbb_viewed_name">
											<a href="#">Personal care</a>
										</div>
									</div>
									<ul class="item_marks">
										<li class="item_mark item_discount">-25%</li>
										<li class="item_mark item_new">new</li>
									</ul>
								</div>
							</div>
							<div class="owl-item">
								<div
									class="bbb_viewed_item discount d-flex flex-column align-items-center justify-content-center text-center">
									<div class="bbb_viewed_image">
										<img
											src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTuT0GD_AlyYx7eQ7H94HnCO3A6oeA4NiJLKg&usqp=CAU"
											alt="">
									</div>
									<div class="bbb_viewed_content text-center">
										<div class="bbb_viewed_price">
											&#x20B9;225
										</div>
										<div class="bbb_viewed_name">
											<a href="#">personal-care</a>
										</div>
									</div>
									<ul class="item_marks">
										<li class="item_mark item_discount">-25%</li>
										<li class="item_mark item_new">new</li>
									</ul>
								</div>
							</div>
							<div class="owl-item">
								<div
									class="bbb_viewed_item d-flex flex-column align-items-center justify-content-center text-center">
									<div class="bbb_viewed_image">
										<img
											src="data:image/jpeg;base64,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"
											alt="">
									</div>
									<div class="bbb_viewed_content text-center">
										<div class="bbb_viewed_price">&#x20B9;210</div>
										<div class="bbb_viewed_name">
											<a href="#">personal-care</a>
										</div>
									</div>
									<ul class="item_marks">
										<li class="item_mark item_discount">-25%</li>
										<li class="item_mark item_new">new</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	</div>
	</div>
	<hr class="p-0 m-0 b-0">

	<script>
		$(function() {
			$(document).scroll(
					function() {
						var $nav = $("#mainNavbar");
						$nav.toggleClass("scrolled", $(this).scrollTop() > $nav
								.height());
					});
		});
	</script>
</body>
</html>