<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="text/html">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">

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
}
</style>

<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
	function addNewAddress() {
		$('#adressForm').css("display", "block");
		$('#newAddressBtn').css("display", "none");
	}

	function selectAddress(addressId) {
		$("#"+addressId).prop("checked", true);
		$('#addressId').val(addressId);
	}

	function saveAddress() {
		$.ajax({
			type : "post",
			url : '<%=request.getContextPath()%>/saveAddress',
			data : $('#adressForm').serialize(),
			success : function(response) {
				$('#addressId').val(addressId);
				$("#addresses").load(" #addresses");
				$('#adressForm').css("display", "none");
				$('#newAddressBtn').css("display", "block");
			},
			error : function() {
			}
		});
	}
	
	function deleteAddress(addressId) {
		$.ajax({
			type : "post",
			url : '<%=request.getContextPath()%>/deleteAddress?addressId='+addressId,
			success : function(response) {
				$("#addresses").load(" #addresses");
			},
			error : function() {
			}
		});
	}
	
	function setAddressId() {
		$('#addressId').val($("input[name='addressRadio']:checked").val());
		$('#orderIds').val(JSON.parse("${cart.orderIds}"))
		return true;
	}
</script>
<link href="form-validation.css" rel="stylesheet">
</head>
<body class="bg-light">

	<div class="container">
		<div class="py-5 text-center">
			<h2>Checkout form</h2>
			<p class="lead"></p>
		</div>
		<div class="row">
			<div class="col-md-4 order-md-2 mb-4">
				<h4 class="d-flex justify-content-between align-items-center mb-3">
					<span class="text-muted">Your cart</span> <span
						class="badge badge-secondary badge-pill">${cartList.size()}</span>
				</h4>
				<ul class="list-group mb-3">
					<c:forEach items="${cart.products}" var="cart">
						<li
							class="list-group-item d-flex justify-content-between lh-condensed">
							<div>
								<h6 class="my-0">${cart.productName}(${cart.quantity})</h6>
								<small class="text-muted">${cart.description}</small>
							</div> <span class="text-muted">&#x20B9;${cart.price}</span>
						</li>
					</c:forEach>
					<li class="list-group-item d-flex justify-content-between"><span>Total
							(&#x20B9;)</span> <strong>&#x20B9;${cart.totalAmount}</strong></li>
				</ul>
			</div>
			<div class="col-md-8 order-md-1" id="addresses">
				<h4 class="mb-3">Shipping address</h4>
				<c:forEach items="${addressList}" var="address">
					<div class="form">
						<div
							class="custom-radio mb-2 mr-sm-2 ml-2 d-flex justify-content-around">
							<input type="radio" name="addressRadio"
								class="custom-control-input" id="${address.id}"
								value="${address.id}" checked="${addressList.size() == 1}">
							<label class="custom-control-label" for="customRadio1">${address.name}
								${address.phoneNo}</label>
							<button type="submit" class="btn btn-success btn-sm"
								onclick="selectAddress(${address.id})">Use this address</button>
							<button type="submit" class="btn btn-danger btn-sm"
								onclick="deleteAddress(${address.id})">Delete</button>

						</div>
						<div class="row d-flex justify-content-start ml-5 mt-4">
							${address.address} ${address.city} ${address.state}</div>
					</div>
				</c:forEach>

				<button type="button" id="newAddressBtn"
					class="btn btn-secondary my-3 ml-md-5"
					onclick="addNewAddress(); return false;">+ Add new address
				</button>

				<form id="adressForm" name="adressForm" class="needs-validation"
					style="display: none" novalidate>
					<h4 class="mb-3">Add new address</h4>
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="firstName">Full name</label> <input type="text"
								class="form-control" id="name" name="name" placeholder=""
								value="" required>
							<div class="invalid-feedback">Valid first name is required.
							</div>
						</div>
						<div class="col-md-6 mb-3">
							<label for="lastName">Contact-Number</label> <input type="text"
								name="phoneNo" data-validation="number"
								data-validation-allowing="negative,number" input name="color"
								data-validation="number" datavalidation-ignore="$"
								required="required" class="form-control" id="phoneNo"
								placeholder="Contact Number" maxlength="10" pattern="\d*">
							<div class="invalid-feedback">Valid mobile number is
								required.</div>
						</div>
					</div>

					<div class="mb-3">
						<label for="email">Email <span class="text-muted">(Optional)</span></label>
						<input type="email" class="form-control" id="email" name="email"
							placeholder="you@example.com">
						<div class="invalid-feedback">Please enter a valid email
							address for shipping updates.</div>
					</div>

					<div class="mb-3">
						<label for="address">Address</label>
						<textarea class="form-control" id="address" name="address"
							rows="2"></textarea>
						<div class="invalid-feedback">Please enter your shipping
							address.</div>
					</div>

					<div class="mb-3">
						<label for="landmark">Landmark <span class="text-muted">(Optional)</span></label>
						<input type="text" class="form-control" id="landmark"
							name="landMark" placeholder="Near to...">
						<div class="invalid-feedback">Please enter a valid email
							address for shipping updates.</div>
					</div>

					<div class="row">
						<div class="col-md-5 mb-3">
							<label for="country">State</label> <select
								class="custom-select d-block w-100" id="state" name="state"
								required>
								<option value="">Choose...</option>
								<option>Himachal</option>
							</select>
							<div class="invalid-feedback">Please select a valid
								country.</div>
						</div>
						<div class="col-md-4 mb-3">
							<label for="state">City</label> <select
								class="custom-select d-block w-100" id="city" name="city"
								required>
								<option value="">Choose...</option>
								<option>Dharamshala</option>
							</select>
							<div class="invalid-feedback">Please provide a valid state.
							</div>
						</div>
						<div class="col-md-3 mb-3">
							<label for="zip">Zip</label> <input type="text"
								class="form-control" id="pinCode" name="pinCode" placeholder=""
								required>
							<div class="invalid-feedback">Zip code required.</div>
						</div>
					</div>
					<div>
						<button type="button"
							class="btn btn-primary btn-lg btn-block my-5"
							onclick="saveAddress(); return false;" style="float: right;">Save
							and Continue</button>
					</div>
				</form>
				<div>
					<hr class="mb-4">
					<h4 class="mb-3">Payment</h4>
					<div class="d-block my-3">
						<div class="custom-control custom-radio">
							<input id="credit" name="paymentMethod" type="radio"
								class="custom-control-input" checked required> <label
								class="custom-control-label" for="credit">Cash on
								delivery</label>
						</div>
						<div class="custom-control custom-radio">
							<input id="debit" name="paymentMethod" type="radio"
								class="custom-control-input" required>
						</div>
					</div>

					<hr class="mb-4">
					<form id="orderForm" name="orderForm"
						action="${pageContext.request.contextPath}/complete/order"
						method="post">
						<input type="hidden" id="orderIds" name="orderIds"
							value="${orderIds}"> <input type="hidden" id="addressId"
							name="addressId" id="addressId" value="${addressId}">
						<button class="btn btn-primary btn-lg btn-block" type="submit"
							onclick="setAddressId();"
							${ cart.products.size() == 0 && addressId == null  ? 'disabled="disabled"' : ''}>Continue
							to checkout ${addressId}</button>
					</form>
				</div>
				<br>
			</div>
		</div>
	</div>
	<script>
          // Example starter JavaScript for disabling form submissions if there are invalid fields
(function () {
  'use strict'

  window.addEventListener('load', function () {
    // Fetch all the forms we want to apply custom Bootstrap validation styles to
    var forms = document.getElementsByClassName('needs-validation')

    // Loop over them and prevent submission
    Array.prototype.filter.call(forms, function (form) {
      form.addEventListener('submit', function (event) {
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
