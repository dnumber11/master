<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<!-- <html>
<head> -->
        <script>
        function createProduct() {
			var form = $("#productform");
			$.ajax({
				url : '/createproducttype',
				data : form.serialize(),
				async : true,
				success : function(result) {
					if (result.isOk == false)
						alert(result.message);
				}
			});
		}
    
        </script>
        <!-- </head>
<body class="hold-transition skin-blue sidebar-mini">
 -->	<div class="wrapper">
		<div class="content-wrapper">
			<section class="content-header">
				<h1>Create Products</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li><a href="#">Forms</a></li>
					<li class="active">Create Products</li>
				</ol>
			</section>
			<section class="content">
				<div class="row">
					<div class="col-md-12">
						<div class="box box-primary">
							<div class="box-header with-border">
								<h3 class="box-title">Create Products</h3>
							</div>
							<form role="form" id="productform" method="post" modelAttribute="productType">
								<div class="box-body">
									<div class="row">
										<div class="form-group col-md-2">
											<label for="exampleInputEmail1">Product Type</label>
											<!-- <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email"> -->
										</div>
										<div class="form-group col-md-3">
											<input type="text" class="form-control" name="productType"
												id="productType" placeholder="Enter Product Type">
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
												name="description" id="description"></textarea>
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
									<div class="box-footer">
										<button type="button" class="btn btn-primary"
											onclick="createProduct()">Submit</button>
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
<!-- </body>
</html> -->