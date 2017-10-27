<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
	$(function() {
		$('#billingList').DataTable({
			'paging' : true,
			'lengthChange' : true,
			'searching' : true,
			'ordering' : true,
			'info' : true,
			'autoWidth' : true
		})

		$("#select2-single-input-sm").change(function(val) {
			$("#itemCode").val(val);
		})

		$('.select2').select2()
	})

	function addBilling(itemCode) {
		window.location.href = '/addBilling?itemCode=' + itemCode
				+ '&quantity=' + $("#quantity").val();
	}

	function removeItem(id) {
		window.location.href = '/removeItem?id=' + id;
	}
</script>

<div class="content-wrapper">
	<section class="content">
	<div class="row">
		<div class="col-md-12">
			<div class="box">
				<div class="box-header">
					<h3 class="box-title">Billing Details</h3>

				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="col-md-3">
							<div class="form-group">
								<label>Select Item</label> 
								<select class="form-control select2 select2-hidden-accessible"
									style="width: 100%;" tabindex="-1" aria-hidden="true">
									<option>Alabama</option>
									<option>Alaska</option>
									<option>California</option>
									<option>Delaware</option>
									<option>Tennessee</option>
									<option>Texas</option>
									<option>Washington</option>
								</select>
							</div>
						</div>


						<div class="form-group col-md-2">
							<label for="Quantity">Quantity</label> <input type="text"
								class="form-control" name="quantity" id="quantity" value=""
								placeholder="Enter Quantity">
						</div>

						<input type="hidden" id="itemCode" name="itemCode" value="" />

					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-lg-10 col-lg-offset-8">
					<button type="button" class="btn btn-primary"
						onclick="addBilling('${itemCode}')">Add Item</button>
				</div>
			</div>
			<div class="box">
				<div class="box-body">
					<table id="billingList" class="table table-bordered table-striped">
						<thead>
							<tr>
								<th>Item Description</th>
								<th>Quantity</th>
								<th>Unit Price</th>
								<th>Total Price</th>

							</tr>
						</thead>
						<tbody>
							<c:forEach items="${itemList}" var="list" varStatus="status">
								<tr id="${list.id}">
									<td>${list.firstName}</td>
									<td>${list.lastName}</td>
									<td>${list.email}</td>
									<td>
										<button type="button" class="btn btn-primary"
											onclick="removeItem('${list.id}')">Remove</button>
									</td>
								</tr>

							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>


		</div>
	</div>
	</section>
</div>

