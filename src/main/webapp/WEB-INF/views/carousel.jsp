<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div  style="margin-top: 3rem !important; margin-left: 0rem !important; margin-right: 0rem !important;">
	<div id="demo" class="carousel slide" data-ride="carousel">
		<ul class="carousel-indicators">
			<li data-target="#demo" data-slide-to="0" class="active"></li>
			<li data-target="#demo" data-slide-to="1"></li>
			<li data-target="#demo" data-slide-to="2"></li>
		</ul>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img class="rounded mx-auto d-block"
					src="<c:url value="/resources/images/slider_1.png" />"
					alt="Los Angeles" width="100%" height="100%">
				<div class="carousel-caption"></div>
			</div>
			<div class="carousel-item">
				<img class="rounded mx-auto d-block"
					src="<c:url value="/resources/images/slider_2.png" />"
					alt="Chicago" width="100%" height="100%">
				<div class="carousel-caption"></div>
			</div>
			<div class="carousel-item">
				<img class="rounded mx-auto d-block"
					src="<c:url value="/resources/images/slider_3.png" />"
					alt="New York" width="100%" height="100%">
				<div class="carousel-caption"></div>
			</div>
		</div>
		<a class="carousel-control-prev" href="#demo" data-slide="prev"> <span
			class="carousel-control-prev-icon"></span>
		</a> <a class="carousel-control-next" href="#demo" data-slide="next">
			<span class="carousel-control-next-icon"></span>
		</a>
	</div>
</div>
