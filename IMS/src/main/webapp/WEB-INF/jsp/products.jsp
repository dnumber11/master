<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
</head>
<body class="hold-transition skin-blue sidebar-mini">

	<div class="wrapper">
		<div class="content-wrapper">
			<section class="content-header">
				<h1>Add Product Type</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li><a href="#">Forms</a></li>
					<li class="active">Add New Product Types</li>
				</ol>
			</section>
			<section class="content">
				<div class="row">
					<div class="col-md-12">
						<div class="box box-primary">
							<div class="box-header with-border">
								<h3 class="box-title">Add Product Type</h3>
							</div>
							<div class="row">
								<div class="col-lg-10 col-lg-offset-8">
									<button type="button" class="btn btn-primary"
										onclick="goBack()">Back</button>
								</div>
							</div>
							<form role="form" action="/createProductType" method="post"
								enctype="multipart/form-data">
								<input type="hidden" id="id" name="id" value="${productType.id}" />
								<div class="box-body">
									<div class="row">
										<div class="form-group col-md-2">
											<label for="exampleInputEmail1">Product Type</label>
											<!-- <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email"> -->
										</div>
										<div class="form-group col-md-3">
											<input type="text" class="form-control" name="productType"
												id="productType" placeholder="Enter Product Type" value="${productType.productType}">
										</div>
									</div>
									<div class="row">
										<div class="form-group col-md-2">
											<label for="exampleInputEmail1">Description</label>
											<!-- <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email"> -->
										</div>
										<div class="form-group col-md-3">
											<textarea class="form-control" rows="3"
												placeholder="Enter Product Type Description..."
												name="description" id="description" >${productType.description}</textarea>
											<!-- <input type="text" class="form-control" id="firstName"
												placeholder="Enter First Name"> -->
										</div>
									</div>
									<div class="row">
										<div class="form-group col-md-1">
											<div class="radio">
												<label> <input type="radio" name="isTaxable"
													id="isTaxable1" value="1" checked> Taxable
												</label>
											</div>
										</div>
										<div class="form-group col-md-2">
											<div class="radio">
												<label> <input type="radio" name="isTaxable"
													id="isTaxable2" value="0"> Non Taxable
												</label>
											</div>
										</div>
									</div>

									<div class="row after-add-more control-group">
										<div class="form-group col-md-2">
											<label for="exampleInputEmail1">Add Attributes</label>
										</div>
										<div class="form-group col-md-1">
											<button type="button" id="btnAdd"
												class="btn btn-default add-more">
												<i class="fa fa-plus"></i> Add Attribute
											</button>
										</div>
									</div>
									<div class="box-footer">
										<button type="submit" class="btn btn-primary">Submit</button>
									</div>
								</div>
							</form>
							
							<c:forEach items="${productType.attribute}" var="list" varStatus="status">
							
							<div class="hide copy">
								<div class="row control-group">
									<div class="form-group col-md-2"></div>
									<div class="form-group col-md-3">
										<input type="text" class="form-control" name="attribute"
											id="attribute" placeholder="Enter Product Type" value="${list}">
									</div>
									<div class="form-group col-md-1">
										<button type="button" id="btnAdd"
											class="btn btn-default remove">
											<i class="fa fa-minus"></i>
										</button>
									</div>
								</div>
							</div>
							</c:forEach>
							
						</div>
					</div>
				</div>
			</section>
		</div>
		<div class="control-sidebar-bg"></div>
	</div>

	<script type="text/javascript">
		$(document).ready(function() {

			$(".add-more").click(function() {
				var html = $(".copy").html();
				$(".after-add-more").after(html);
			});

			$("body").on("click", ".remove", function() {
				$(this).parents(".control-group").remove();
			});

		});
	</script>
</body>
</html>