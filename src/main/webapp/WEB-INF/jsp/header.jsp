<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">

<script
	src='https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.bundle.min.js'></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
	function loadUserCart(keyword, userName) {
        if(userName && userName != 'undefined') {
            $.ajax({
                url : '<%=request.getContextPath()%>/userCart',
                    type : 'GET',
                    success : function(data) {
                        $('#cart').text(" " + data);
                    },
                    error : function(xhr, status, error) {
                    }
                });
            }
        if(keyword) {
            $("#search").focus().val(keyword);
          }
	}

	function searchProducts(key) {
        if(key.value.length > 1) {
            window.location.assign('<%=request.getContextPath()%>/search?keyword='+key.value);
            $('#search').focus();
         }
}
</script>

<style type="text/css">@media screen and (max-width: 400px) {
 .search2 {
 margin-right:20px;
 }
}</style>
</head>

<body
	onload="loadUserCart('${keyword}', '${pageContext.request.userPrincipal.name}');">
	<nav
		class="navbar fixed-top navbar-expand-lg navbar-dark bg-success mb-5 d-flex justify-content-between">
		<a class="navbar-brand text-white" href="${pageContext.request.contextPath}/home"> <img
			src="<c:url value="/static/imgs/logo.png" />"
			style="width: 30px; height: 30px;" class="d-inline-block align-top"
			alt=""> Kwality Basket
		</a>
		<ul class="navbar-nav mr-auto">
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false" style="color: white; font-weight: 400;">
					Categories </a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdown"
					id="categories-id">
					<c:forEach items="${categories}" var="category">
						<a class="dropdown-item"
							href="${pageContext.request.contextPath}/products?categoryId=${category.id}">${category.categoryName}
						</a>
					</c:forEach>
				</div></li>
		</ul>
		<div class="d-flex flex-row order-2 order-lg-3">
			<form class="form-inline">
				<input class="form-control search2  mr-sm-2" type="search" id="search"
					placeholder="Search" aria-label="Search" size="50" oninput="searchProducts(this);">
			</form>
			<form:form class="form-inline my-2 my-lg-0"
				action="${pageContext.request.contextPath}/cart" method="get">

				<button class="btn btn-danger my-2 my-sm-0" type="submit"
					style="color: white">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="20"
						fill="currentColor" class="bi bi-cart3" viewBox="0 0 16 16">
                <path
							d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .49.598l-1 5a.5.5 0 0 1-.465.401l-9.397.472L4.415 11H13a.5.5 0 0 1 0 1H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l.84 4.479 9.144-.459L13.89 4H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z" />
              </svg>
					<span id="cart" class="px-1" style="color: white"></span>
				</button>
			</form:form>
		</div>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active">
				<span class="sr-only">(current)</span></a></li>
				<!-- {{#if isAuthenticated}}  -->
				<c:if test="${pageContext.request.userPrincipal.name != null}">
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/orders?status="
						style="color: white; font-weight: 400;">Dashboard</a></li>
						
						<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/logout"
						style="color: white; font-weight: 400;">Logout</a></li>
						
					<li class="nav-item"><a class="nav-link" href="#"
						style="color: white; font-weight: 400;"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-fill" viewBox="0 0 16 16">
  <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
</svg>${pageContext.request.userPrincipal.name}</a></li>
				</c:if>
				<c:if test="${pageContext.request.userPrincipal.name == null}">
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/signup" tabindex="-1"
						style="color: white; font-weight: 400;">Sign Up</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/login"
						style="color: white; font-weight: 400;">Log In</a></li>

				</c:if>
			</ul>


		</div>
	</nav>
</body>
</html>