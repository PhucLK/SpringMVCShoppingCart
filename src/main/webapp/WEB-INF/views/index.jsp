

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<title>Shopping Cart</title>
<jsp:include page="header.jsp"></jsp:include>
<style type="text/css">
#myBtn {
	display: none;
	position: fixed;
	bottom: 20px;
	right: 30px;
	z-index: 99;
	font-size: 18px;
	border: none;
	outline: none;
	background-color: #007BFF;
	color: white;
	cursor: pointer;
	padding: 15px;
	border-radius: 4px;
}

#myBtn:hover {
	background-color: #066DFF;
}
</style>
</head>
<body>
	<jsp:include page="menu.jsp"></jsp:include>

	<c:if test="${ check == 'Banner'}">
		<jsp:include page="carousel.jsp"></jsp:include>
	</c:if>
	<div class="container-fluid" id="body">
		<div></div>


		<c:if test="${not empty message }">
			<div class="container" style="margin-top: 120px; text-align: center;">
				<div class="col-sm-12">
					<div class="alert alert-danger">${message}</div>
				</div>
				<div class="col">
					<img class="img-fluid" src="<c:url value="/resources/images/empty_cart.png" />" />
				</div>
			</div>
			<div class="col text-center" style="margin-top: 20px;">
				<a href="<c:url value="/home"></c:url>">
				 <button class="btn btn-primary" style="text-align: center;">Continue Shopping</button>
				</a>
			</div>
		</c:if>

		<div class="container">
			<div class="row" style="margin-top: 7rem !important;">
				<c:forEach var="product" items="${ListProduct}">

					<div class="col-sm-6 col-lg-4">
						<h3 class="text-center">${product.name}</h3>
						<div class="text-center">
							<c:forEach varStatus="loop" var="i" items="${product.images}">

								<c:if test="${loop.index == 1 }">
									<a href="detail/${product.id}"> <img class="img-fluid"
										src='<c:url value="/resources/images/${i.name}" /> '
										width="280" style="display: none;" />
									</a>
								</c:if>
								<c:if test="${loop.index == 0 }">
									<a href="detail/${product.id}"> <img class="img-fluid"
										src='<c:url value="/resources/images/${i.name}" /> '
										width="280" />
									</a>
									<a href="detail/${product.id}">
										<button style="display: none; margin-top: -40px;" class="btn btn-primary">Detail</button>
									</a>
								</c:if>
							</c:forEach>


						</div>
						<div class="caption">
							<input type="hidden" name="idCategory"
								value="${product.category.id}">
							<p class="text-center">${product.description}</p>
							<p class="text-center">${product.price}&nbsp;Vnd</p>
						</div>

					</div>

				</c:forEach>
			</div>

		</div>
		<c:if test="${ empty message }">
			<nav aria-label="Page navigation ">
				<ul class="pagination justify-content-center">
					<c:forEach begin="1" end="${totalPage}" step="1" varStatus="loop">
						<c:choose>
							<c:when test="${(currentPage + 1) == loop.index  }">
								<li class="page-item active"><a class="page-link"
									href="${pageContext.request.contextPath}/home?page=${currentPage}">${loop.index}</a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link"
									href="${pageContext.request.contextPath}/home?page=${loop.index-1}">${loop.index}</a>
								</li>
							</c:otherwise>
						</c:choose>

					</c:forEach>
				</ul>
			</nav>
		</c:if>


	</div>
	<jsp:include page="footer.jsp"></jsp:include>
	<button id="myBtn" title="Go to top">Top</button>

	<script>
		//Get the button
		var mybutton = document.getElementById("myBtn");

		// When the user scrolls down 20px from the top of the document, show the button
		window.onscroll = function() {
			scrollFunction()
		};

		function scrollFunction() {
			if (document.body.scrollTop > 20
					|| document.documentElement.scrollTop > 20) {
				mybutton.style.display = "block";
			} else {
				mybutton.style.display = "none";
			}
		}

		$(document).ready(function() {
			// When the user clicks on the button, scroll to the top of the document
			$("#myBtn").click(function() {
				$('body,html').animate({
					scrollTop : 0
				}, 800);
				document.body.scrollTop = 100;
				document.documentElement.scrollTop = 100;
			});

			//

			$(".img-fluid").on({
				//event.preventDefault();
				"mouseenter" : function(event) {
					event.preventDefault();
					$(".text-center .btn").fadeIn(600);

				},
				"mouseout" : function(event) {
					event.preventDefault();
					$(".text-center .btn").fadeOut(600);
				}
			});

		})
	</script>
</body>
</html>
