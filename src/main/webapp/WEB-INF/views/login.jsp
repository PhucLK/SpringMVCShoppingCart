<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8" language="java"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page session="false"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="header.jsp"></jsp:include>
</head>
<body>
	<div class="container">
		<jsp:include page="menu.jsp"></jsp:include>
		<div class="container" id="login"
			style="margin: 0px auto; width: 40%; margin-top: 20%;">
			<h2 class="text-center">Login</h2>
			<p style="color: red !important;" class="text-center">
				<c:if test="${not empty message }">${message}</c:if>
			</p>
			<form method="post"
				class="form-horizontal"
				action='${pageContext.request.contextPath}/j_spring_security_check'>
				<div class="form-group">
					<label class="control-label col-sm-2" for="email">Name:</label>
					<div class="col-sm-10">
						<input name="username" class="form-control"
							placeholder="Enter username" />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2">Password:</label>
					<div class="col-sm-10">
						<input name="password" class="form-control"
							placeholder="Enter password" type="password" />
					</div>
				</div>
				<!-- 
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<div class="checkbox">
							<label><input type="checkbox" name="remember">
								Remember me</label>
						</div>
					</div>
				</div>
				 -->
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<input type="submit" class="btn btn-primary"
							style="border-radius: 10px; width: 100%;" value="Login">
					</div>
				</div>
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />
			</form>
		</div>
	</div>
</body>
</html>