<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="header.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script src="dept.js" ></script>
<body>

<form action="/EmpDeptApp/department" method="post">
	
		<div id="deptCont">
			<table>
				<tr>
					<td>Department Id:</td>
					<td><input type="text" name="dept" id="dept"></td>
					<td><input type="hidden" name ="hdept" id="hdept" value ="hdept"></td>
				</tr>

				<tr>
					<td ><button type="submit">Search</button></td>
				</tr>
			</table>
		</div>
		
	</form>
	<div><c:if test="${not empty requestScope.result}">${requestScope.result}</c:if></div>
	<div>
	<c:if test="${requestScope.department!=null}">
	<div id="viewId">
	<table>
	<tr>	<td>Dept No:</td><td>${requestScope.department.deptNo}</td>	</tr>
		<tr><td>Dept Name:</td><td>${requestScope.department.deptName}</td>
		</tr>
		
	</table>
	<a href='<%=request.getContextPath()%>/department?deptNo=${requestScope.department.deptNo}&hdept=hemp'>ViewEmployees</a>
	</div>
	</c:if>
</div>

<c:if test="${requestScope.employee.size()>0}">
<form id ="empForm">
<input type ="hidden" name="emp" id="emp">
<input type ="hidden" name="deptt" id="deptt">
<input type ="hidden" name="update" id="update">
<input type="hidden" id ="hdept" name="hdept" value="deleteE">
<input type ="hidden" name="hParam" id="deptU" value="searchE">
<input type ="hidden" name="homePage" id="deptPage" value="deptPage">
	<table>
			<tr>
			<th>Employee Id:</th>
			<th>Dept No:</th>
			<th>Salary:</th>
			<th>DOB:</th>
		</tr>
		
		<c:forEach items="${requestScope.employee}" var="emp">
			<tr>
				<td>${emp.empNo}</td> 
				<td>${emp.deptNo}</td>
				<td>${emp.salary}</td>
				<td>${emp.doB}</td>
				<td><button onclick = "updateId(${emp.empNo})">Update </button></td>
				<td><button  onclick = "deleteId(${emp.empNo},${emp.deptNo})">Delete</button></td>
			</tr>
		</c:forEach>
	</table>
	</form>
	</c:if>
	<%@include file="footer.jsp" %>
</body>
</html>