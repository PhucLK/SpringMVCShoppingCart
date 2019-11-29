
<%@taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container-fluid">


	<nav style="background-color: black !important;"
		class="navbar navbar-expand-xl navbar-expand-md navbar-expand-lg navbar-dark justify-content bg-dark fixed-top">
		<a class="navbar-brand" href='<c:url value="/home"></c:url>'><img
			src='<c:url value="/resources/images/a.jpg"/>' width="55" height="57">
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContentXL"
			aria-controls="navbarSupportedContentXL" aria-expanded="false"
			aria-label="Toggle navigation" style="color: white">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContentXL">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item ">
				
					<sec:authorize access="!isAuthenticated()">
							<a class="nav-link"
					href='<c:url value="/home"></c:url>'>Home <span class="sr-only">(current)</span></a>
					</sec:authorize>
				
					<sec:authorize access="isAuthenticated()">
						<sec:authorize access="hasRole('ROLE_ADMIN')">
							<a class="nav-link"	href='<c:url value="/admin/"></c:url>'>HomeAd</a>
						</sec:authorize>
					</sec:authorize>
				</li>
				<li class="nav-item">
					<sec:authorize access="!isAuthenticated()">
							<a class="nav-link"	href='<c:url value="/login"></c:url>'>Login</a>
					</sec:authorize>
					
					<sec:authorize access="isAuthenticated()">
						<sec:authorize access="hasRole('ROLE_ADMIN')">
							<a class="nav-link"	href='<c:url value="/logout"></c:url>'>Logout</a>
						</sec:authorize>
					</sec:authorize>
				</li>
				<li class="nav-item"><a class="nav-link"
					href='<c:url value="/newCollection"></c:url>'>LookBook</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdownXL"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> Category </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdownXL">
						<a class="dropdown-item dark" href="home?idCategory=1">Shoe</a> <a
							class="dropdown-item" href="home?idCategory=2"> Shirt</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="home?idCategory=3">Short</a>
					</div></li>
				<li class="nav-item"><a class="nav-link disabled" href="#">LK
						Collection</a></li>
			</ul>
			<form action="${pageContext.request.contextPath}/search"
				method="post" class="form-inline my-2 my-lg-0">
				<input class="form-control mr-sm-2" type="text" placeholder="Search"
					required="required" name="search" aria-label="Search">
				<button class="btn btn-outline-primary my-2 my-sm-0" type="submit">
					<i class="fas fa-search"></i>
				</button>
			</form>
			<div class="form-inline">
				<a href="${pageContext.request.contextPath}/cart"> <i
				class="fas fa-shopping-cart"></i> Cart(${lenght})
					</a>
			</div>
		</div>

	</nav>
</div>