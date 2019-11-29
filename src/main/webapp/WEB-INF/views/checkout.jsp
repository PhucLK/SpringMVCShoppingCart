
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<title>Check Out</title>
<jsp:include page="header.jsp"></jsp:include>
<style type="text/css">
.error {
	color: red;
}
</style>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="container-fluid" style="margin-top: 11rem !important;">
		<div class="row">
			<div class="col-lg-7 col-sm-12">
				<div class="container">

					<form:form method="post" modelAttribute="customer"
						class="form-horizontal"
						action="${pageContext.request.contextPath}/thanks">
						<div class="form-group">
							<label class="control-label col-sm-2" for="name">Name :</label>
							<div class="col-sm-10">
								<form:input required="required" path="name" id="name"
									class="form-control" placeholder="Enter your name" />
								<form:errors path="name" cssClass="error"></form:errors>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2" for="phone">Phone :</label>
							<div class="col-sm-10">
								<form:input required="required" path="phoneNumber" id="phone"
									class="form-control" placeholder="Enter your phone number" />
								<form:errors path="phoneNumber" cssClass="error"></form:errors>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2" for="email">Email :</label>
							<div class="col-sm-10">
								<form:input required="required" path="email" id="email"
									class="form-control" placeholder="Enter your email" />
								<form:errors path="email" cssClass="error"></form:errors>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2" for="address">Address
								:</label>
							<div class="col-sm-10">
								<form:input required="required" path="address" id="address"
									class="form-control" placeholder="Enter your address" />
								<form:errors path="address" cssClass="error"></form:errors>
							</div>
						</div>

						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<input type="submit" class="btn btn-primary"
									style="border-radius: 10px; width: 100px;" value="Sent">
							</div>
						</div>
					</form:form>
				</div>
			</div>

			<div class="col-lg-5 colsm-12" style="margin-top: 2rem !important;">
				<table class="table table-hover">

					<c:forEach var="orderDetail" items="${ListOrderDetail}">
						<tr>
							<td scope="col"><c:forEach varStatus="loop" var="i"
									items="${orderDetail.product.images}">

									<c:if test="${loop.index == 0 }">
										<img id="image" class="img-fluid"
											src='<c:url value="/resources/images/${i.name}" /> '
											width="60" />
											<span>${orderDetail.quantity}</span>
									</c:if>

									
								</c:forEach></td>
							<td scope="col" style="text-align: left !important;"><p>${orderDetail.product.name}</p>
								<p>${orderDetail.orderSizeTem}</p></td>
							<td scope="col">${orderDetail.amount}&nbsp;Vnd</td>

							<!-- 
							<td scope="col">
								<form action="${pageContext.request.contextPath}/update"
									method="get">
									<input type="hidden" name="id"
										value="${orderDetail.product.id}"> <input
										style="width: 30px !important;" type="text" name="quantity"
										value="${orderDetail.quantity}"> <input type="hidden"
										name="checkout" value="checkout" /> <input type="submit"
										value="Update" class="btn btn-primary">
								</form>
							</td>
							<td scope="col">${orderDetail.amount}</td>

							<td scope="col">
								<form action="${pageContext.request.contextPath}/delete"
									method="post">
									<input type="hidden" name="id"
										value="${orderDetail.product.id}"><input type="hidden"
										name="checkout" value="checkout" /> <input type="submit"
										value="Delete" class="btn btn-danger">
								</form>
							</td>
							 -->

						</tr>
					</c:forEach>
					<tr>
						<th scope="col">Total</th>
						<th scope="col"></th>
						<th scope="col">${total}&nbsp;Vnd</th>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>