
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<title>Your Cart</title>
<jsp:include page="header.jsp"></jsp:include>
</head>
<body>
	<div class="container">
		<jsp:include page="menu.jsp"></jsp:include>
		<div class="container-fuild" style="margin-top: 8rem !important;">
			<c:if test="${not empty ListOrderDetail}">
				<div class="container">
					<h1 style="margin-top: 10%;">Your Items</h1>
				</div>

				<div class="container-fuild">

					<div class="row">
						<table class="table table-hover">

							<c:forEach var="orderDetail" items="${ListOrderDetail}">
								<tr>
									<td scope="col"><c:forEach varStatus="loop" var="i" items="${orderDetail.product.images}">
											<c:if test="${loop.index == 0 }">
												<a href="detail/${orderDetail.product.id}">
												<img id="image" src='<c:url value="/resources/images/${i.name}" />' width="60" />
												</a>
											</c:if>
										</c:forEach>
									</td>

									<td scope="col" style="text-align: left !important;">${orderDetail.product.name}</td>
									<td scope="col">${orderDetail.orderSizeTem}</td>
									<td scope="col">${orderDetail.product.price}VND</td>
									<td style="white-space: nowrap; width: 2rem;">
										<div class="row">
											<div class="col-xs-4">
												<form action="${pageContext.request.contextPath}/subtract"	method="get">
													<input type="hidden" name="size" value="${orderDetail.orderSizeTem}">
													<input type="hidden" name="id" value="${orderDetail.product.id}">
													<input type="submit" class="form-control-plaintext" value="-">
												</form>
											</div>
											<div class="col-xs-4" style="margin-top: 0.5rem;">${orderDetail.quantity}</div>
											<div class="col-xs-4">
												<form action="${pageContext.request.contextPath}/plus" method="get">
													<input type="hidden" name="size" value="${orderDetail.orderSizeTem}">
													<input type="hidden" name="id" value="${orderDetail.product.id}">
													<input type="submit" class="form-control-plaintext" value="+">
												</form>
											</div>
										</div>
									</td>
									<td scope="col">${orderDetail.amount}VND</td>

									<td scope="col">
										<a href="${pageContext.request.contextPath}/delete/${orderDetail.orderSizeTem}">
											<i class="fas fa-trash"></i>
										</a>
									</td>

								</tr>
							</c:forEach>
							<tr>
								<th scope="col"></th>
								<th scope="col"></th>
								<th scope="col"></th>
								<th scope="col"></th>
								<th scope="col">Total</th>
								<th scope="col">${total}VND</th>
								<th scope="col"></th>
							</tr>
						</table>
					</div>

				</div>
				<div class="container">
					<form action="${pageContext.request.contextPath}/checkout" method="get">
						<input style="width: 100px !important; border-radius: 15px !important;"
							type="submit" value="Check out" class="btn btn-primary">
					</form>
				</div>
			</c:if>
			<c:if test="${empty ListOrderDetail }">
				<div class="container" style="margin-top: 7rem;; text-align: center;">
					<div class="col-sm-12">
						<div class="alert alert-danger">${message}</div>
					</div>
					<img class="img-fluid"
						src="<c:url value="/resources/images/empty_cart.png" />" />
				</div>
				<div class="col text-center" style="margin-top: 20px;">
					<a href="<c:url value="/home"></c:url>">
						<button class="btn btn-primary" style="text-align: center;">Continue Shopping</button>
					</a>
				</div>
			</c:if>
		</div>

	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>