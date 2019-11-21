

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<title>Manager Order</title>
<jsp:include page="header.jsp"></jsp:include>
<body>
	<jsp:include page="menu.jsp"></jsp:include>
	<div class="container" id="body">
		<h1>List Orders</h1>

		<div class="row">

			<table class="table table-hover">
				<thead class="thead-light">
					<tr>
						<th style="text-align: left !important;">Product</th>
						<th style="text-align: left !important;">Price</th>
						<th>Quantity</th>
						<th>Total</th>
						<th>Date Order</th>
						<th>Name Customer</th>
						<th>Address</th>
						<th>Phone Number</th>
					</tr>
				</thead>
				<c:forEach var="orderDetail" items="${ListOrderDetail}">
					<tr>
						<td style="text-align: left !important;">${orderDetail.product.name}</td>
						<td style="text-align: left !important;">${orderDetail.product.price}</td>
						<td>${orderDetail.quantity}</td>
						<td>${orderDetail.orders.total}</td>
						<td>${orderDetail.orders.dateOrder}</td>
						<td>${orderDetail.order.customer.name}</td>
						<td>${orderDetail.order.customer.address}</td>
						<td>orderDetail.order.phoneNumber</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>