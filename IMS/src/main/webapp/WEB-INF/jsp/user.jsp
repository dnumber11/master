<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>AdminLTE 2 | General Form Elements</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">

<script type="text/javascript">
function goBack() {
    window.history.back();
}
</script>

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
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<div class="content-wrapper">
			<section class="content-header">
				<h1> ${action} Account</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li><a href="#">Forms</a></li>
					<li class="active"> ${action} ${account}</li>
				</ol>
			</section>
			<section class="content">
				<div class="row">
					<div class="col-md-12">
						<div class="box box-primary">
							<div class="box-header with-border">

								<h3 class="box-title">${action} ${account}</h3>
							</div>
							<div class="row">
								<div class="col-lg-10 col-lg-offset-8">
									<button type="button" class="btn btn-primary"
										onclick="goBack()">Back</button>
								</div>
							</div>

							<form role="form" action="/savecontacts" modelAttribute="user"
								method="post" enctype="multipart/form-data">
								<input type="hidden" id="id" name="id" value="${user.id}" /> <input
									type="hidden" id="imagePath" name="imagePath"
									value="${user.imagePath}" />
								<div class="box-body">
									<div class="row">
										<div class="form-group col-md-2">
											<label for="exampleInputEmail1">First Name</label>
											<!-- <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email"> -->
										</div>
										<div class="form-group col-md-3">
											<input type="text" class="form-control" name="firstName"
												id="firstName" value="${user.firstName}"
												placeholder="Enter First Name">
										</div>
										<div class="form-group col-md-1"></div>
										<div class="form-group col-md-2">
											<label for="exampleInputEmail1">Last Name</label>
										</div>
										<div class="form-group col-md-3">
											<input type="text" class="form-control" name="lastName"
												id="lastName" value="${user.lastName}"
												placeholder="Enter Last Name">
										</div>
									</div>

									<div class="row">
										<div class="form-group col-md-2">
											<label for="exampleInputEmail1">Email Id</label>
											<!-- <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email"> -->
										</div>
										<div class="form-group col-md-3">
											<input type="email" class="form-control" name="email"
												id="email" value="${user.email}" placeholder="Enter email">
										</div>
									</div>
									<div class="row">
										<div class="form-group col-md-2">
											<label for="exampleInputEmail1">Mobile</label>
											<!-- <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email"> -->
										</div>
										<div class="form-group col-md-3">
											<input type="text" class="form-control" name="mobile"
												id="mobile" value="${user.mobile}"
												placeholder="Enter Mobile Number">
										</div>
										<div class="form-group col-md-1"></div>
										<div class="form-group col-md-2">
											<label for="exampleInputEmail1">Phone</label>
										</div>
										<div class="form-group col-md-3">
											<input type="text" class="form-control" name="phone"
												id="phone" value="${user.phone}"
												placeholder="Enter Phone Number">
										</div>
									</div>

									<div class="row">
										<div class="form-group col-md-2">
											<label for="exampleInputEmail1">Password</label>
											<!-- <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email"> -->
										</div>
										<div class="form-group col-md-3">
											<input type="password" class="form-control" name="password"
												id="password" placeholder="Enter password">
										</div>
										<div class="form-group col-md-1"></div>
										<div class="form-group col-md-2">
											<label for="exampleInputEmail1">Photo</label>
										</div>
										<div class="form-group col-md-3">
											<input type="file" id="file" name="file"
												src="${user.imagePath}"> <img
												src="${user.imagePath}">

											<p class="help-block">Please upload your photo here.</p>
											<!-- <div id="drop">
												Drop Here <a>Browse</a> <input type="file" name="upl"
													multiple />
											</div>

											<ul>
												The file uploads will be shown here
											</ul> -->
										</div>
									</div>

									<div class="row">

										<c:choose>
											
									<c:when test="${account == 'User'}">
										<div class="form-group col-md-1">
											<div class="radio">
												<label> <input type="radio" name="userType"
													id="userType" value="U" checked> User
												</label>
											</div>
										</div>
										</c:when>
										<c:when test="${account == 'Customer'}">
										<div class="form-group col-md-1">
											<div class="radio">
												<label> <input type="radio" name="userType"
													id="userType" value="C" checked> Customer
												</label>
											</div>
										</div>
										</c:when>
										<c:when test="${account == 'Vendor'}">
										<div class="form-group col-md-1">
											<div class="radio">
												<label> <input type="radio" name="userType"
													id="userType" value="V" checked>
													Vendor
												</label>
											</div>
										</div>
										</c:when>

										</c:choose>
									</div>

									<div class="row">
										<div class="col-md-12">
											<!-- Custom Tabs -->
											<div class="nav-tabs-custom">
												<ul class="nav nav-tabs">
													<li class="active"><a href="#tab_1" data-toggle="tab">Address</a></li>
													<li><a href="#tab_2" data-toggle="tab">Other
															Fields</a></li>
													<li><a href="#tab_3" data-toggle="tab">Note</a></li>
												</ul>
												<div class="tab-content">
													<div class="tab-pane active" id="tab_1">
														<div class="row">
															<div class="form-group col-md-3">
																<b>User Address:</b>
															</div>
														</div>
														<div class="row">
															<div class="form-group col-md-2">
																<label for="exampleInputEmail1">Street</label>
															</div>
															<div class="form-group col-md-3">
																<input type="text" class="form-control"
																	value="${user.address}" placeholder="Enter Street..."
																	name="address" id="address">
																<!-- <input type="text" class="form-control" id="firstName"
																	placeholder="Enter Mobile Number"> -->
															</div>
														</div>
														<div class="row">
															<div class="form-group col-md-2">
																<label for="exampleInputEmail1">City</label>
															</div>
															<div class="form-group col-md-3">
																<input type="text" class="form-control" name="city"
																	id="city" value="${user.city}" placeholder="Enter City">
															</div>
														</div>
														<div class="row">
															<div class="form-group col-md-2">
																<label for="exampleInputEmail1">State</label>
															</div>
															<div class="form-group col-md-3">
																<input type="text" class="form-control" name="state"
																	id="state" value="${user.state}"
																	placeholder="Enter State">
															</div>
														</div>
														<div class="row">
															<div class="form-group col-md-2">
																<label for="exampleInputEmail1">Zip Code</label>
															</div>
															<div class="form-group col-md-3">
																<input type="text" class="form-control" name="postcode"
																	id="postcode" value="${user.postcode}"
																	placeholder="Enter Zip Code">
															</div>
														</div>
														<div class="row">
															<div class="form-group col-md-2">
																<label for="exampleInputEmail1">Country</label>
															</div>
															<div class="form-group col-md-3">
																<input type="text" class="form-control" name="country"
																	id="country" value="${user.country}"
																	placeholder="Enter Country">
															</div>
														</div>
													</div>
													<div class="tab-pane" id="tab_2">Here you can add
														custom fields</div>
													<div class="tab-pane" id="tab_3">
														<div class="row">
															<div class="form-group col-md-2">
																<label for="exampleInputEmail1"><b>Notes</b>(If
																	any)</label>
															</div>
															<div class="form-group col-md-4">
																<textarea class="form-control" rows="3" 
																name="notes" id="notes" 
																	placeholder="Enter Note...">${user.notes}</textarea>
																<!-- <input type="text" class="form-control" id="firstName"
																	placeholder="Enter Mobile Number"> -->
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>

									<div class="box-footer">
										<button type="submit" class="btn btn-primary">Submit</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</section>
		</div>
		<div class="control-sidebar-bg"></div>
	</div>

</body>
</html>