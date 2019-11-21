
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Detail product</title>
<jsp:include page="header.jsp"></jsp:include>
<style type="text/css">
[type=radio] {
	position: absolute;
	opacity: 0;
	width: 0;
	height: 0;
}

/* IMAGE STYLES */
[type=radio]+img {
	cursor: pointer;
}

/* CHECKED STYLES */
[type=radio]:checked+img {
	outline: 2px solid #f00;
}
</style>
</head>
<body>
	<jsp:include page="menu.jsp"></jsp:include>
	<div class="container" style="margin-top: 6rem !important;">


		<div class="container">
			<c:if test="${not empty message }">
				<div class="container" style="margin-top: 11%; text-align: center;">
					<div class="col-sm-12">
						<div class="alert alert-success">${message}</div>
					</div>
				</div>
			</c:if>

			<div class="container" style="margin-top: 5% !important;">
				<div class="container">
					<div class="row">
						<div class="col-xs-12 col-sm-12 col-md-6 col-lg-4">
							<h3 style="margin-top: 11% !important;" class="text-center">${product.name}</h3>

							<c:forEach varStatus="loop" var="i" items="${product.images}">

								<c:if test="${loop.index == 1 }">
									<img class="img-fluid"
										src='<c:url value="/resources/images/${i.name}" /> '
										width="280" style="display: none;" />

								</c:if>
								<c:if test="${loop.index == 0 }">
									<img class="img-fluid"
										src='<c:url value="/resources/images/${i.name}" /> '
										width="330" />
								</c:if>
							</c:forEach>
							<!-- 
							<a href="${pageContext.request.contextPath}/detail"> <img
								width="110%" class="img-fluid" id="item"
								src="<c:url value="/resources/images/${product.id}.jpg"  /> " />
							</a>
							 -->

						</div>
						<div class="col-xs-12 col-sm-12 col-md-6 col-lg-8">
							<div style="margin-top: 11% !important;">
								<input type="hidden" name="idCategory"
									value="${product.category.id}">


								<p>${product.price}&nbsp;Vnd</p>
								<form action='${pageContext.request.contextPath}/add'
									method="post">
									<input type="hidden" name="id" value="${product.id}" /> <input
										type="hidden" name="quantity" value="1" />

									<p>

										<c:forEach var="c" varStatus="loop" items="${product.sizes}">

											<div class="form-check-inline">
												<!-- 
												<input type="radio" name="size" value="${c.name}"
													checked="checked" />${c.name}
													 -->
												<c:if test="${(loop.index) < (fn:length(product.sizes)/2)}">
													<label> <input type="radio" name="size"
														value="${c.name}" checked="checked"> <img
														src='<c:url value="/resources/images/${c.name}.png" /> '
														width="30"></label>
												</c:if>
											</div>
										</c:forEach>

									</p>

									<p>${product.description}</p>

									<input type="submit" value="Add to cart"
										class="btn btn-primary"
										style="margin-bottom: 20px !important;">
								</form>
							</div>
						</div>

					</div>

				</div>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#item").mouseenter(function() {
				$("this").hide();
			});
			$("#item").mouseleave(function() {
				$(this).atr("width", "110%");
			});

			//
			var srcs = [];
			$.each($('.col-xs-12').find("img"), function() {
				srcs.push($(this).attr("src"));
			});

			$(".img-fluid").on({
				//event.preventDefault();
				"mouseover" : function(event) {
					event.preventDefault();
					$(".img-fluid").attr({
						"src" : srcs[1]
					});
					console.log(srcs[1]);
				},
				"mouseout" : function(event) {
					event.preventDefault();
					$(".img-fluid").attr({
						"src" : srcs[0]
					});
					console.log(srcs[0]);
				}
			});
		});
	</script>
</body>
</html>