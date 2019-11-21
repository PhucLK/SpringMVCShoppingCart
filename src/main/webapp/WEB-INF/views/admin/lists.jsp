<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<title>Shopping Cart</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

</head>
<body>

	<div class="container">

		<h1 style="margin-top: 7%; margin-bottom: 5%; text-align: center;">
			List Product</h1>

		<c:if test="${message != null && message!=''}">
			<div class="row">
				<div class="col-sm-12">
					<c:if test="${status!=null && status=='ok'}">
						<div class="alert alert-success" style="text-align: center;">${message}</div>
					</c:if>
					<c:if test="${status!=null && status=='fail'}">
						<div class="alert alert-danger" style="text-align: center;">${message}</div>
					</c:if>
				</div>
			</div>
		</c:if>
		<div class="container">

			<div class="row">
				<div class="col-sm-6">
					<form action="${pageContext.request.contextPath}/admin/addProduct"
						method="get">
						<input type="submit" value="Add product" class="btn btn-primary">
					</form>
				</div>
				<div class="col-sm-6"
					style="text-align: right; padding-bottom: 10px;">
					<form action="${pageContext.request.contextPath}/admin/search"
						method="post" class="form-inline">
						<div class="form-group">
							<input type="text" required="required" name="searchText" class="form-control" /> <input
								type="submit" value="search" class="btn btn-info" />
						</div>
					</form>
				</div>
			</div>

			<div class="row">
				<table class="table table-hover">
					<thead class="thead-light">
						<tr>
							<th>ID</th>
							<th>Image</th>
							<th style="text-align: left !important;">Product</th>
							<th style="text-align: left !important;">Size</th>
							<th style="text-align: left !important;">Description</th>
							<th>Price</th>
							<th colspan="2" style="text-align: center;">Action</th>
						</tr>
					</thead>
					<c:forEach var="product" items="${ListProduct}">
						<tr>
							<td>${product.id}</td>
							<td><c:forEach var="i" items="${product.images}">
									<img src='<c:url value="/resources/images/${i.name}"/>'
										width="50" />
								</c:forEach></td>
							<td style="text-align: left !important;">${product.name}</td>
							<td style="text-align: left !important;">
									<c:forEach var="s" varStatus="loop" items="${product.sizes}">
                                  	      <c:if test="${(loop.index) < (fn:length(product.sizes)/2)}">
                                  	      	${s.name}
                                  	      </c:if>
                                    </c:forEach></td>
							<td style="text-align: left !important;">${product.description}</td>
							<td>${product.price}</td>
							<td><a href="<c:url value='editProduct/${product.id}'/>"><button
										class="btn btn-primary">Edit</button></a>
							<td><a href="<c:url value='deleteProduct/${product.id}'/>"><button
										class="btn btn-danger">Delete</button></a></td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>

	</div>
</body>
</html>