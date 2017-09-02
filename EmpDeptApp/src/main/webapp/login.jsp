<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@include file="header.jsp" %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<c:if test="${not empty requestScope.error}">${requestScope.error}</c:if>
<form action="/EmpDeptApp/login" method="post" id="loginForm">
		<div>
			<table>
				<tr><td>User Id: </td><td><input type="text" name="userId" id="userId"> </td></tr>
				<tr><td>Password: </td><td><input type="password" name="pwd" id="pwd"> </td></tr>
				<tr><td colspan="2"><button name="Login" value="Login" type="submit">Login</button></td></tr>
			</table>
		</div>
	</form>

<%@include file="footer.jsp" %>
</body>

</html>