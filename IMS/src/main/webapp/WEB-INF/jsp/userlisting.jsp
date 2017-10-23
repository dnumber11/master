<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.7 -->
<link rel="stylesheet"
	href="../../bower_components/bootstrap/dist/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="../../bower_components/font-awesome/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="../../bower_components/Ionicons/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="../../dist/css/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet" href="../../dist/css/skins/_all-skins.min.css">

<script>
	$(function() {
		$('#contactList').DataTable({
			'paging' : true,
			'lengthChange' : true,
			'searching' : true,
			'ordering' : true,
			'info' : true,
			'autoWidth' : true
		})
	})



	function createUser(userType) {
		window.location.href = '/addNewUser?userType=' + userType;
	}

<script type="text/javascript">

function createUser(userType){
	window.location.href = '/addNewUser?userType='+userType;
}

	function editUser(id, userType) {
		window.location.href = '/editUser?id=' + id + '&userType=' + userType;
	}

function editUser(id,userType){
	window.location.href = '/editUser?id='+id+'&userType='+userType;
}



	function removeUser(id, userType) {
		window.location.href = '/removeUser?id=' + id + '&userType=' + userType;
	}

function removeUser(id,userType){
	window.location.href = '/removeUser?id='+id+'&userType='+userType;
}

   

</script>

<div class="content-wrapper">
	<section class="content">
	<div class="row">
		<div class="col-md-12">
			<div class="box">
				<div class="box-header">
					<h3 class="box-title">Account Details</h3>

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
							<li class="${account eq 'User' ? 'active' : ''}"><a
								href="/user">User</a></li>
							<li class="${account eq 'Customer' ? 'active' : ''}"><a
								href="/customer">Customer</a></li>
							<li class="${account eq 'Vendor' ? 'active' : ''}"><a
								href="/vendor">Vendor</a></li>
						</ul>
					</div>
				</div>

				<div class="row">
					<div class="col-lg-10 col-lg-offset-8">
						<button type="button" class="btn btn-primary"
							onclick="createUser('${account}')">Add New ${account}</button>
					</div>
				</div>

				<!-- /.box-header -->
				<div class="box-body table-responsive no-padding">
					<table class="table table-hover" id="contactList">
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
											onclick="editUser('${list.id}','${account}')">Edit</button>
									</td>
									<td>
										<button type="button" class="btn btn-primary"
											onclick="removeUser('${list.id}','${account}')">Delete</button>
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

			</div>
		</div>
	</div>
	</section>
</div>