<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="text/html">
<!--------------------------bootstrap---------------------------->
<link type="text/css" rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<!------------------------- manual  css----------------------- -->
<style>
.container {
	max-width: 960px;
}

.lh-condensed {
	line-height: 1.25;
}

.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
	
	@media screen and (max-width: 400px) {
		.containerMain5 {
			margin-top: 300px;
		}
		.mainColumn{
		margin-top: 150px;
		}
		h4.mb-3{
		margin-top:150px;}
	}
}
</style>
</head>

<!----------------- body part ----------------------->
<body class="bg-light">
	<div class="container containerMain5 mt-5 ">
		<div class="col mainColumn">
			<h4 class="mb-3">Please Sign-up</h4>
			${message}
			<form class="needs-validation" method="POST"
				action="${pageContext.request.contextPath}/signup"
				modelAttribute="user">
				<form class="needs-validation" novalidate>
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="firstName">Full name</label> <input type="text"
								class="form-control" name="fullName" id="firstName"
								placeholder="Name" value="" required>
							<div class="invalid-feedback">Full name is required.</div>
						</div>
						<div class="col-md-6 mb-3">
							<label for="user">User name</label> <input type="text"
								class="form-control" name="userName" id="user"
								placeholder="@Username" value="" required>
							<div class="invalid-feedback">Valid last name is required.
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="e-mail">E-mail</label> <input type="email"
								pattern="^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"
								class="form-control" name="email" id="e-mail"
								placeholder="you@example.com" value="" required>
							<div class="invalid-feedback">Email is required.</div>
						</div>
						<div class="col-md-6 mb-3">
							<label for="contact">Contact-Number</label> <input type="text"
								name="mobile" data-validation="number"
								data-validation-allowing="negative,number" input name="color"
								data-validation="number" datavalidation-ignore="$"
								required="required" class="form-control" id="phone_no"
								placeholder="Contact Number" minlength="10" maxlength="10">
							<div class="invalid-feedback">Valid mobile number is
								required.</div>
						</div>
					</div>

					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="password">Password</label> <input type="password"
								name="password" class="form-control" id="password"
								placeholder="" value="" required>
							<div class="invalid-feedback">password is required.</div>
						</div>
						<div class="col-md-6 mb-3">
							<label for="confirmpassword">Confirm Password</label> <input
								type="password" name="confirmPassword" class="form-control"
								id="confirmpassword" placeholder="" value="" required>
							<div class="invalid-feedback">password is required.</div>
						</div>
					</div>
					<hr class="mb-4">
					<div class="text-center">
						<button class="btn btn-primary" type="submit" style="width: 50%;">Submit</button>
					</div>

				</form>
			</form>
		</div>
	</div>

	<!---------------------------------------------- validation function ------------------------------->
	<script>
		// Example starter JavaScript for disabling form submissions if there are invalid fields
		(function() {
			'use strict'

			window.addEventListener('load', function() {
				// Fetch all the forms we want to apply custom Bootstrap validation styles to
				var forms = document.getElementsByClassName('needs-validation')

				// Loop over them and prevent submission
				Array.prototype.filter.call(forms, function(form) {
					form.addEventListener('submit', function(event) {
						if (form.checkValidity() === false) {
							event.preventDefault()
							event.stopPropagation()
						}

						form.classList.add('was-validated')
					}, false)
				})
			}, false)
		})()
	</script>

	<!-------------------------------- required scrips tag----------------------------- -->
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
