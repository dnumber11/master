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
<script>
function goBack() {
    window.history.back();
}
</script>
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<div class="content-wrapper">
			<section class="content-header">
				<h1>Add New Product</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li><a href="#">Forms</a></li>
					<li class="active">Add Product</li>
				</ol>
			</section>
			<section class="content">
				<div class="row">
					<div class="col-md-12">
						<div class="box box-primary">
							<div class="box-header with-border">
								<h3 class="box-title">Add Product</h3>
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
											<select class="form-control" name="">
												<option value="">Select Product Type</option>
												<c:forEach items="${productTypList}" var="productTypes">
													<option value="${productTypes.productType}">${productTypes.productType}</option>
												</c:forEach>
											</select>
										</div>
									</div>
									<div class="row">
										<div class="form-group col-md-2">
											<label for="exampleInputEmail1">Attribute</label>
											<!-- <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email"> -->
										</div>
										<div class="form-group col-md-3">
											<label for="exampleInputEmail1">Attribute Values</label>
											<!-- <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email"> -->
										</div>
									</div>
									<div class="row">
										<div class="form-group col-md-2">
											<select class="form-control" name="">
												<option value="">Select Attribute</option>
												<c:forEach items="${productTypList}" var="productTypes">
													<option value="${productTypes.attribute}">${productTypes.attribute}</option>
												</c:forEach>
											</select>
										</div>
										<div class="form-group col-md-6">
											<input type="text" class="form-control" data-role="tagsinput" />
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
	$('#tags-input').tagsinput({
	  typeaheadjs: {
		name: 'countries',
		displayKey: 'name',
		valueKey: 'name',
		source: countries.ttAdapter()
	  }
	});
</body>
</html>