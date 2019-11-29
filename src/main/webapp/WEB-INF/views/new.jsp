<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<title>LookBook</title>
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
	<div class="container text-center" style="margin-top: 8rem !important;">

		<c:forEach begin="1" var="i" end="6">
			<div class="col-lg-12 col-sm-12">
				<img style="margin-bottom: 3%; margin-top: 5%;" class="img-fluid"
					src='<c:url value="/resources/images/new${i}.jpg" /> ' width="350" />
			</div>
		</c:forEach>

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
		})
	</script>
</body>
</html>