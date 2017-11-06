<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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


function createUser(userType){
	window.location.href = '/addNewUser?userType='+userType;
}

function editUser(id,userType){
	window.location.href = '/editUser?id='+id+'&userType='+userType;
}
function viewProfile(id,userType){
	window.location.href = '/viewProfile?id='+id+'&userType='+userType;
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

					
				</div>
				<div class="row">
				<div class="col-md-12">
					<ul class="nav nav-tabs">
						<li class="${account eq 'User' ? 'active' : ''}"><a href="/user" >User</a></li>
						<li class="${account eq 'Customer' ? 'active' : ''}"><a href="/customer" >Customer</a></li>
						<li class="${account eq 'Vendor' ? 'active' : ''}"><a href="/vendor">Vendor</a></li>
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
				<div class="box">
					<div class="box-body">
						<table id="contactList" class="table table-bordered table-striped">
							<thead>
								<tr>
									<th>First Name</th>
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
										
										<td><a href="#"	onclick="viewProfile('${list.id}','${account}')">${list.firstName}</a></td>
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

			</div>
		</div>
	</div>
	</section>
</div>