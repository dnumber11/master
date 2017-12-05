<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>AdminLTE 2 | General Form Elements</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<style type="text/css">
.panel div {
	white-space: nowrap;
	display: inline-block;
	float: left;
}
</style>
<script>
$.widget.bridge('uibutton', $.ui.button); 
	
	function goBack() {
		window.history.back();
	}

	
	
	$(function() {
		$('.dates').datepicker({
			autoclose : true,
			format : 'dd/mm/yyyy'
		})
	})
	
</script>
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<div class="content-wrapper">
			<section class="content-header">
				<h1>Add New Purchase Order</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li><a href="#">Forms</a></li>
					<li class="active">Add Purchase Order</li>
				</ol>
			</section>
			<section class="content">
				<div class="row">
					<div class="col-md-12">
						<div class="box box-primary">
							<div class="box-header with-border">
								<h3 class="box-title">Add Purchase Order</h3>
							</div>
							<div class="row">
								<div class="col-lg-10 col-lg-offset-8">
									<button type="button" class="btn btn-primary"
										onclick="goBack()">Back</button>
								</div>
							</div>
							<form role="form" action="/savecontacts" method="post"
								enctype="multipart/form-data">
								<%-- <input type="hidden" id="id" name ="id" value="${user.id}"/>
							<input type="hidden" id="imagePath" name ="imagePath" value="${user.imagePath}"/> --%>
								<div class="box-body">
									<div class="row">
										<div class="form-group col-md-2">
											<label for="exampleInputEmail1">Product Type</label>
											<!-- <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email"> -->
										</div>
										<div class="form-group col-md-3">
											<select class="form-control" name="productType">
												<option value="">Select Product Type</option>
												<c:forEach items="${productTypList}" var="productTypes">
													<option value="${productTypes.id}">${productTypes.productType}</option>
												</c:forEach>
											</select>
										</div>
									</div>
									<div class="row">
										<div class="form-group col-md-2">
											<label for="exampleInputEmail1">Vendor Name</label>
											<!-- <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email"> -->
										</div>
										<div class="form-group col-md-3">
											<select class="form-control" name="customerName">
												<option value="">Select Customer</option>
												<c:forEach items="${userList}" var="users">
													<option value="${users.id}">${users.firstName}</option>
												</c:forEach>
											</select>
										</div>
									</div>
									<div class="row">
										<div class="form-group col-md-1"></div>
										<div class="form-group col-md-2">
											<label for="exampleInputEmail1">BILL TO</label><br> <a
												href="#" id="billingaddress" data-type="address" data-pk="1">awesome</a>
											<input type="hidden" id="customerIdb" value=""> <input
												type="hidden" id="streetb" value="#165,Yelahanka New Town"> <input
												type="hidden" id="stateb" value="Yelahanka Post"> <input
												type="hidden" id="cityb" value="Bangalore"> <input
												type="hidden" id="zipcodeb" value="560064"> <input
												type="hidden" id="countryb" value="India">
										</div>
										<div class="form-group col-md-2">
											<label for="exampleInputEmail1">SHIP TO</label><br> <a
												href="#" id="address" data-type="address" data-pk="1">awesome</a>
											<input type="hidden" id="customerIds" value=""> <input
												type="hidden" id="streets"
												value="#407, Mhaveer Desire Appartment, Chikkabanavar">
											<input type="hidden" id="states" value="karnataka"> <input
												type="hidden" id="citys" value="Bangalore"> <input
												type="hidden" id="zipcodes" value="560090"> <input
												type="hidden" id="countrys" value="India">
										</div>
									</div>
									<!-- <div class="row">
										<div class="form-group col-md-2">
											<label for="exampleInputEmail1">Sales Number</label>
											<input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email">
										</div>
										<div class="form-group col-md-3">
											<input type="text" class="form-control" id="salesNumber">
										</div>
									</div> -->
									<div class="row">
										<div class="form-group col-md-2">
											<label for="exampleInputEmail1">Reference
												Number</label>
											<!-- <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email"> -->
										</div>
										<div class="form-group col-md-3">
											<input type="text" class="form-control"
												id="salesReferenceNumber">
										</div>
									</div>
									<div class="row">
										<div class="form-group col-md-2">
											<label for="exampleInputEmail1">Order Date</label>
											<!-- <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email"> -->
										</div>
										<div class="form-group col-md-3">
											<div class="input-group date">
												<div class="input-group-addon">
													<i class="fa fa-calendar"></i>
												</div>
												<input type="text" class="form-control pull-right dates"
													id="salesDate">
											</div>
										</div>
									</div>
									<div class="row">
										<div class="form-group col-md-2">
											<label for="exampleInputEmail1">Expected Delivery
												Date</label>
											<!-- <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email"> -->
										</div>
										<div class="form-group col-md-3">
											<div class="input-group date">
												<div class="input-group-addon">
													<i class="fa fa-calendar"></i>
												</div>
												<input type="text" class="form-control pull-right dates"
													id="shipmentDate">
											</div>
										</div>
									</div>
									<div class="row">
										<div class="form-group col-md-2">
											<label for="exampleInputEmail1">Shipment Preference</label>
											<!-- <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email"> -->
										</div>
										<div class="form-group col-md-3">
											<select class="form-control" name="deliveryType">
												<option value="">Select Delivery Type</option>
												<option value="">Courier Service</option>
												<option value="">Truck</option>
												<option value="">Other</option>
											</select>
										</div>
									</div>
									<!-- <div class="row">
										<div class="form-group col-md-2">
											<label for="exampleInputEmail1">Price List</label>
											<input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email">
										</div>
										<div class="form-group col-md-3">
											<input type="text" class="form-control" id="shipmentDate">
										</div>
									</div> -->
									<%-- <div class="row">
										<div class="form-group col-md-2">
											<label for="exampleInputEmail1">Sales Person</label>
											<!-- <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email"> -->
										</div>
										<div class="form-group col-md-3">
											<select class="form-control" name="">
												<option value="">Select Sales Person</option>
												<c:forEach items="${userList}" var="users">
													<option value="${users.firstName}">${users.firstName}</option>
												</c:forEach>
											</select>
										</div>
									</div> --%>
								</div>
								<div class="box-body table-responsive no-padding">
									<table class="table table-hover" id="tb">
										<tr>
											<th>Product</th>
											<th>Quantity</th>
											<th>Rate</th>
											<th>Discount</th>
											<th>Tax</th>
											<th>Amount</th>
											<th>Action</th>
										</tr>
										<tr class="after-add-more">
											<td>
												<div>
													<!-- <img src="cinqueterre.jpg" class="img-rounded" alt="Cinque Terre" width="20" height="20"> -->
													<select class="form-control select2">
														<option selected="selected">Alabama</option>
														<option value="1">Alaska</option>
														<option value="2">California</option>
														<option value="3">DelawareDelaware Delaware
															Delaware Delaware Delaware</option>
														<option value="4">Tennessee</option>
														<option value="5">Texas</option>
														<option value="6">Washington</option>
													</select>
												</div>
											</td>
											<td>
												<div>
													<input type="text" class="form-control" id="shipmentDate">
												</div>
											</td>
											<td>
												<div>
													<input type="text" class="form-control" id="shipmentDate">
												</div>
											</td>
											<td>
												<div class="form-group">
													<div class="input-group">
														<input type="text" name="discount" class="form-control">
														<span class="input-group-addon"
															style="padding-top: 6px; padding-bottom: 4px;"> <select
															name="discountUnit">
																<option value="%">%</option>
																<option value="Rs">Rs</option>
																<option value="$">$</option>
														</select></span>
													</div>
												</div>
											</td>
											<td>
												<div>
													<%-- 											<c:set var = "isTax" scope = "session" value = "1"/> --%>
													<%-- 											<c:set var = "tax" scope = "session" value = "Taxable"/> --%>
													<%-- 											<c:if test="${isTax = 1}"> --%>
													<input type="text" name="discount" class="form-control"
														value="Taxable">
													<%-- 											</c:if> --%>
												</div>
											</td>
											<td>30</td>
											<td><div class="form-group col-md-1">
													<button type="button" id="btnAdd"
														class="btn btn-default remove">
														<i class="fa fa-minus"></i>
													</button>
												</div></td>
										</tr>
									</table>
								</div>
								<div class="box-body">
									<div class="row">
										<div class="form-group col-md-3">
											<button type="button" id="btnAdd"
												class="btn btn-default add-more">
												<i class="fa fa-plus"></i> Add one more product
											</button>
										</div>
									</div>
								</div>
								<div class="row col-md-8" style="margin-left: 58%;">
										<div class="form-group col-md-2">
											<label for="exampleInputEmail1">Sub Total</label>
											<!-- <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email"> -->
										</div>
										<div class="form-group col-md-3">
										</div>
										<div class="form-group col-md-3">
											<p>30</p>
										</div>
									</div>
									<div class="row col-md-8" style="margin-left: 58%;">
										<div class="form-group col-md-3">
											<label for="exampleInputEmail1">Shipping Charge</label>
											<!-- <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email"> -->
										</div>
										<div class="form-group col-md-2">
										<input type="text" class="form-control" id="shippingCharge" name="shippingCharge">
										</div>
										<div class="form-group col-md-3">
											<p>30</p>
										</div>
									</div>
									<div class="row col-md-8" style="margin-left: 58%;">
										<div class="form-group col-md-3">
											<label for="exampleInputEmail1">Other Adjustment</label>
											<!-- <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email"> -->
										</div>
										<div class="form-group col-md-2">
										<input type="text" class="form-control" id="OtherCharge" name="otherCharge">
										</div>
										<div class="form-group col-md-3">
											<p>30</p>
										</div>
									</div>
									<div class="row col-md-8" style="margin-left: 58%;">
										<div class="form-group col-md-3">
											<label for="exampleInputEmail1">Total</label>
											<!-- <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email"> -->
										</div>
										<div class="form-group col-md-2">
										</div>
										<div class="form-group col-md-3">
											<p>30</p>
										</div>
									</div>
								<div class="box-footer">
									<button type="submit" onclick="" class="btn btn-primary">Submit</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</section>
		</div>
		<div class="control-sidebar-bg"></div>
	</div>
	<script>
	$(function() {
		$('.add-more').on('click', function() {
			var data = $("#tb tr:eq(1)").clone(true).appendTo("#tb");
			data.find("input").val('');
		});
		$(document).on('click', '.remove', function() {
			var trIndex = $(this).closest("tr").index();
			if (trIndex > 1) {
				$(this).closest("tr").remove();
			} else {
				alert("Sorry!! Can't remove first row!");
			}
		});
	});

	$(function() {
		/* $('#comments').editable({
		    type:  'textarea',
		    pk:    1,
		    name:  'comments',
		    url:   '',  
		    title: 'Enter comments'
		 }); */

		 /* $('#comments').editable({
			type : 'textarea',
			pk : 1,
			  url: '/post', 
			title : 'Enter Address',
			success : function(response, newValue) {
				$('#comments').val(newValue); //update backbone model
			}
		});  */
		 
		 $('#billingaddress').editable({
		    	/* url: '/post', */
		        title: 'Enter Billing Address',
		        value: {
		            city: $("#streetb").val(), 
		            street: $("#cityb").val(), 
		            building: $("#zipcodeb").val()
		        },display: function (value) {
		       		 $ ('#billingaddress').text(value.street);
		        }
		    });
	});
	
	$(function(){
	    $('#address').editable({
	    	/* url: '/post', */
	        title: 'Enter Shipping Address',
	        value: {
	            city: $("#streets").val(), 
	            street: $("#citys").val(), 
	            building: $("#zipcodes").val()
	        },display: function (value) {
	       		 $ ('#address').text(value.street);
	        }
	    });
	});
	</script>
</body>
</html>