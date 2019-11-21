
<%@taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>
</head>
<body>
	<h1>Admin Home</h1>


	<p>
		<a href="<c:url value="/home"/>">Home</a>
	</p>
	<!-- If Authenticated -->
	<sec:authorize access="isAuthenticated()">
		<sec:authorize access="hasRole('ROLE_ADMIN')">
			<p>
				<a href="<c:url value="/admin/home"/>">Admin Home</a>
			</p>
			<p>
				<a href="<c:url value="/admin/list"/>">Manager Product</a>
			</p>
		</sec:authorize>
		<!-- 
	<sec:authorize access="hasRole('ROLE_USER')">
		<p>
			<a href="<c:url value="/user/home"/>">User Home</a>
		</p>
	</sec:authorize>
	<sec:authorize access="hasRole('ROLE_SELLER')">
		<p>
			<a href="<c:url value="/management/seller/home"/>">Seller Home</a>
		</p>
	</sec:authorize>
	<sec:authorize access="hasRole('ROLE_MANAGER')">
		<p>
			<a href="<c:url value="/management/manager/home"/>">Manager Home</a>
		</p>
		<p>
			<a href="<c:url value="/management/manager/add-product"/>">Add
				Product</a>
		</p>
	</sec:authorize>
 -->
		<p>
			<a href="<c:url value="/logout"/>">Logout</a>
		</p>
	</sec:authorize>

	<!-- If not Authenticated -->
	<sec:authorize access="!isAuthenticated()">
		<p>
			<a href="<c:url value="/login"/>">Login</a>
		</p>
	</sec:authorize>
</body>
</html>