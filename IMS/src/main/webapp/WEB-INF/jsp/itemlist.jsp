<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
	$(function() {
		$("#${product eq 'Products' ? 'productlist' : 'producttypelist'}").DataTable({
			'paging' : true,
			'lengthChange' : true,
			'searching' : true,
			'ordering' : true,
			'info' : true,
			'autoWidth' : true
		})
	})
	
	function create() {
		window.location.href = "${product eq 'Type' ? '/productsType' : '/items'}";
	}

	function editUser(id, userType) {
		window.location.href = '/editUser?id=' + id + '&userType=' + userType;
	}

	function removeUser(id, userType) {
		window.location.href = '/removeUser?id=' + id + '&userType=' + userType;
	}
</script>

<div class="content-wrapper">
	<section class="content">
	<div class="row">
		<div class="col-md-12">
			<div class="box">
				<div class="box-header">
					<h3 class="box-title">Product Details</h3>

					<div class="box-tools">
						<div class="input-group input-group-sm" style="width: 150px;">
							<input type="text" name="table_search"
								class="form-control pull-right" placeholder="Search">

							<div class="input-group-btn">
								<button type="submit" class="btn btn-default">
									<i class="fa fa-search"></i>
								</button>
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-md-12">
						<ul class="nav nav-tabs">
							<li class="${product eq 'Products' ? 'active' : ''}"><a
								href="/products">Products</a></li>
							<li class="${product eq 'Type' ? 'active' : ''}"><a
								href="/productTypes">Product Types</a></li>
						</ul>
					</div>
				</div>

				<div class="row">
					<div class="col-lg-10 col-lg-offset-8">
						<button type="button" class="btn btn-primary"
							onclick="create()">Add Product ${product}</button>
					</div>
				</div>

				<!-- /.box-header -->
				<div class="box ${product eq 'Products' ? 'active' : 'hide'}">
					<div class="box-body">
						<table id="productlist" class="table table-bordered table-striped">
							<thead>
								<tr>
									<th>Product Name</th>
									<th>Last Name</th>
									<th>Address</th>
									<th>Email</th>
									<th>Phone</th>
									<th>Mobile</th>
									<th>Status</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${userList}" var="list" varStatus="status">
									<tr id="${list.id}">

										<td>${list.firstName}</td>
										<td>${list.lastName}</td>
										<td>${list.address},${list.city},${list.state}
											,${list.postcode} ,${list.country}</td>
										<td>${list.email}</td>
										<td>${list.phone}</td>
										<td>${list.mobile}</td>
										<td><span class="label label-danger">${list.active}</span></td>
										<td>
											<a href="#"	onclick="editUser('${list.id}','${account}')">Edit</a>/
											<a href="#"	onclick="removeUser('${list.id}','${account}')">Delete</a>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				
				<div class="box ${product eq 'Type' ? 'active' : 'hide'}">
					<div class="box-body">
						<table id="producttypelist" class="table table-bordered table-striped">
							<thead>
								<tr>
									<th>Product Type</th>
									<th>Product Type Description</th>
									<th>Created On</th>
									<th>Modified ON</th>
									<!-- <th>Phone</th>
									<th>Mobile</th>
									<th>Status</th>
									<th>Action</th> -->
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${productTypList}" var="list" varStatus="status">
									<tr id="${list.id}">

										<td>${list.productType}</td>
										<td>${list.description}</td>
										<td>${list.createdOn}</td>
										<td>${list.modifiedOn}</td>
										<%-- <td>${list.phone}</td>
										<td>${list.mobile}</td>
										<td><span class="label label-danger">${list.active}</span></td>
										<td>
											<a href="#"	onclick="editUser('${list.id}','${account}')">Edit</a>/
											<a href="#"	onclick="removeUser('${list.id}','${account}')">Delete</a>
										</td> --%>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>

			</div>
		</div>
	</div>
	</section>
</div>


<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>AdminLTE 2 | Buttons</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">

<!-- Google Font -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
<script>
	function createProductType() {
		window.location.href = '/productsType';
	}

	function createProducts() {
		window.location.href = '/items';
	}

	function removeUser(id) {
		window.location.href = '/removeUser?id=' + id;
	}

	removeUser
</script>
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<div class="content-wrapper">
			<section class="content-header">
			<h1>Product List</h1>
			<!-- <ol class="breadcrumb">
				<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
				<li><a href="#">Forms</a></li>
				<li class="active">Create Contact</li>
			</ol> --> </section>
			<section class="content">
			<div class="row">
				<div class="col-md-12">
					<div class="box">
						<div class="box-header">
							<h3 class="box-title">Product Details</h3>
							<div class="row">
								<div class="col-lg-10 col-lg-offset-8 container">
									<div class="dropdown">
										<button class="btn btn-primary dropdown-toggle" type="button"
											data-toggle="dropdown">
											Action <span class="caret"></span>
										</button>
										<ul class="dropdown-menu">
											<li><a href="#" onclick="createProductType()">Create Product Type</a></li>
											<li><a href="#" onclick="createProducts()">Create Products</a></li>
										</ul>
									</div>
								</div>
							</div>
							<div class="box-tools">
								<div class="input-group input-group-sm" style="width: 150px;">
									<input type="text" name="table_search"
										class="form-control pull-right" placeholder="Search">

									<div class="input-group-btn">
										<button type="submit" class="btn btn-default">
											<i class="fa fa-search"></i>
										</button>
									</div>
								</div>
							</div>
						</div>
						<!-- /.box-header -->
						<div class="box-body table-responsive no-padding">
							<table class="table table-hover">
								<tr>
									<th>First Name</th>
									<th>Last Name</th>
									<th>Address</th>
									<th>Email</th>
									<th>Phone</th>
									<th>Mobile</th>
									<th>Status</th>

								</tr>
								<tr>
									<c:forEach items="${userList}" var="list" varStatus="status">
										<tr id="${list.id}">

											<td>${list.firstName}</td>
											<td>${list.lastName}</td>
											<td>${list.address},${list.city},${list.state}
												,${list.postcode} ,${list.country}</td>
											<td>${list.email}</td>
											<td>${list.phone}</td>
											<td>${list.mobile}</td>
											<td><span class="label label-danger">${list.active}</span></td>
											<td>
												<button type="button" class="btn btn-primary"
													onclick="editUser('${list.id}')">Edit</button>
											</td>
											<td>
												<button type="button" class="btn btn-primary"
													onclick="removeUser('${list.id}')">Delete</button>
											</td>
										</tr>

									</c:forEach>
									<!-- <td>175</td>
                  <td>Mike Doe</td>
                  <td>11-7-2014</td>
                  <td><span class="label label-danger">Denied</span></td>
                  <td>Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.</td>
                </tr> -->
							</table>
						</div>
						<!-- /.box-body -->
					</div>
					<!-- /.box -->
				</div>
			</div>
			</section>
		</div>
		<div class="control-sidebar-bg"></div>
	</div>


</body>
</html> --%>