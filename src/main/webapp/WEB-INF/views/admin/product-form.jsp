<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="mvc" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ft" uri="http://java.sun.com/jsp/jstl/functions"%>

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
		<div class="col-sm-12">
			<h1 style="margin-top: 7%; margin-bottom: 7%; text-align: center;">Add
				Product</h1>
		</div>
		<div class="row">
			<div class="col-sm-12">

				<mvc:form
					action="${pageContext.request.contextPath}/admin/${action}"
					method="post" modelAttribute="product">

					<c:if test="${not empty id }">
						<input hidden name="id" value="${id}" />
					</c:if>


					<div class="form-group">
						<label class="control-label col-sm-2"> Name </label>
						<div class="col-sm-10">
							<input name="name" class="form-control" value="${product.name}" />
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-sm-2"> Description </label>
						<div class="col-sm-10">
							<input name="description" class="form-control"
								value="${product.description}" />
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-sm-2"> Category </label>
						<div class="col-sm-10">
							<select name="category.id" class="form-control">
								<c:forEach items="${categories}" var="c">
									<c:if test="${c.id == product.category.id}">
										<option value="${c.id}" selected>${c.name}</option>
									</c:if>
									<c:if test="${c.id != product.category.id}">
										<option value="${c.id}">${c.name}</option>
									</c:if>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2"> Size </label>
						<div class="col-sm-10">
							<c:forEach var="c" items="${sizes}">
								<c:if test="${ not empty sizes }">
									<input type="checkbox" name="size" value="${c}" />${c}
								</c:if>

								<!--  
								<div class="form-check-inline">
									<c:if test="${ not empty sizeCheck }">
										<c:forEach var="s" items="${sizeCheck}" end="${lenght }"
											varStatus="status">
											<c:if test="${c == s}">
												<input checked="checked" type="checkbox" name="size"
													value="${s}" />${s}
													<c:set var="status" value="${lenght}" />
											</c:if>
											<c:if test="${c != s}">
												<input type="checkbox" name="size" value="${c}" />${c}
												<c:set var="status" value="${lenght}" />
											</c:if>
										</c:forEach>
									</c:if>
									<c:if test="${ empty sizeCheck }">
										<input type="checkbox" name="size" value="${c}" />${c}
									</c:if>
								</div>
								-->
							</c:forEach>
						</div>
					</div>

					<!-- 
					<div class="swatch clearfix" data-option-index="0">
						<div class="header">Size</div>
						<c:forEach var="c" items="${sizes}">
							<c:if test="${ empty sizeCheck }">
								<div data-value="${c}" class="swatch-element plain m available">
									<input id="swatch-0-m" type="radio" name="option-0" value="${c}"
										checked=""> <label for="swatch-0-m"> ${c} <img
										class="crossed-out"
										src="//cdn.shopify.com/s/files/1/1047/6452/t/1/assets/soldout.png?10994296540668815886">
									</label>
								</div>
							</c:if>
						</c:forEach>
					</div>
 -->

					<div class="form-group">
						<label class="control-label col-sm-2"> Price </label>
						<div class="col-sm-10">
							<input name="price" class="form-control" value="${product.price}" />
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-sm-2"> </label>
						<div class="col-sm-10">
							<input type="submit" class="btn btn-primary" value=${submit } />
						</div>
					</div>

				</mvc:form>
			</div>
		</div>
	</div>

</body>
</html>
