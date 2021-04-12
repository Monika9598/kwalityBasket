<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!--------------------------bootstrap---------------------------->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<!------------------- --------title-------------------------- -->
<title>Signin</title>

<!------------------------- manual  css----------------------- -->
<style type="text/css">
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

html, body {
	height: 100%;
}

body {
	display: -ms-flexbox;
	-ms-flex-align: center;
	align-items: center;
	padding-bottom: 40px;
	background-color: #f5f5f5;
	align-items: center;
}

.form-signin {
	width: 100%;
	max-width: 330px;
	padding: 15px;
	margin: auto;
}

.form-signin .checkbox {
	font-weight: 400;
}

.form-signin .form-control {
	position: relative;
	box-sizing: border-box;
	height: auto;
	padding: 10px;
	font-size: 16px;
}

.form-signin .form-control:focus {
	z-index: 2;
}

.form-signin input[type="email"] {
	margin-bottom: 8px;
	border-bottom-right-radius: 0;
	border-bottom-left-radius: 0;
}

.form-signin input[type="password"] {
	margin-bottom: 10px;
	border-top-left-radius: 0;
	border-top-right-radius: 0;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
@media screen and (max-width: 400px) {
		.form-signin{
		margin-top:150px;
		}
		}
</style>

<!---------------------------------- manual jquery link-------------------------- -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<!-- -----------------------------------body part-------------------------------- -->

</head>
<body class="text-center">
	<form class="form-signin"
		action="${pageContext.request.contextPath}/j_spring_security_check"
		method='POST'>
		<h1 class="h3 mb-3 font-weight-normal mt-5">Please sign in</h1>
		<c:if test="${param.error == 'true'}">
                         <div style="color:red;margin:10px 0px;">

                                Login Failed!!!<br />
                                Reason :  ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}

                         </div>
                    </c:if>
		<label for="inputEmail" class="sr-only">Email address</label> <input
			type="userName" id="inputEmail" name="username" class="form-control mb-3"
			placeholder="User name/Email address" required autofocus> <label
			for="inputPassword" class="sr-only mt-5">Password</label> <input
			type="password" name="password" id="inputPassword"
			class="form-control" placeholder="Password" required>
		<div class="mb-3">

			<label><a href="" #>Forget password ?</a></label>

		</div>
		<button class="btn btn-lg btn-primary btn-block" type="submit">Sign
			in</button>
			<div class="mt-3"><label> <a href="" #>New to kwality Basket? click to
				Sign-up </a>
		</label></div>
	</form>
</body>
</html>
