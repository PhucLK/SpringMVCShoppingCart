<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="mvc" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<title>Shopping Cart</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<title>UpLoad Images</title>
</head>
<body>
	<div class="container">
		<div class="col-sm-12">

			<div class="row">
				<mvc:form modelAttribute="images"
					action="${pageContext.request.contextPath}/admin/${action}" method="post"
					enctype="multipart/form-data">
					<div class="form-group">

						<label>Name image : </label> <label> Select a file :</label> <input
							class="form-control" type="file" name="image" multiple="multiple" />
					</div>
					<input type="submit" value="Add" class="btn btn-primary">
				</mvc:form>
			</div>
		</div>
	</div>
</body>
</html>