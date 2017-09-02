<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<%@include file="header.jsp"%>

<title>Insert title here</title>
</head>
<body>
	<form id="form1" action="/EmpDeptApp/employee" method="post">
		<table>
			<tr>
				<td>Employee No:</td>
				<td><input type="text" name="emp" id="emp"></td>
				<td><input type="hidden" name="hParam" id="hParam"
					value="searchE"></td>
				<td><input type="hidden" name="search" id="search"
					value="search"></td>
				<td colspan="2"><button id="searchB" type="submit">Search</button></td>

			</tr>
		</table>
	</form>
	<div>
		<button id="addB">ADD</button>
	</div>

	<div id="resultId">
		<c:if test="${not empty requestScope.result}">${requestScope.result}</c:if>
	</div>
	<c:if test="${not empty requestScope.error}">${requestScope.error}</c:if>

	<form id="formadd" method="post" action="/EmpDeptApp/employee"
		style="display: none">
		<input type="hidden" name="hParam" value="addEmp">
		<table>
			<tr>
				<td>DeptNo:</td>
				<td><input class="form-group" type="text" id="dept" name="dept"
					value=""></td>
			</tr>
			<tr>
				<td>Salary:</td>
				<td><input class="form-group " type="text" id="salary"
					name="salary" value=""></td>
			</tr>
			<tr>
				<td>Date of Joining :</td>
				<td><input class="form-group " type="date" id="doj" name=doj
					value=""></td>
			</tr>
			<tr>
				<td>Date of Birth:</td>
				<td><input class="form-group " type="date" id="dob" name="dob"
					value=""></td>
			</tr>
			<tr>
				<td>Salary grade:</td>
				<td><input class="form-group " type="text" id="grade"
					name="grade" value=""></td>
			</tr>
			<tr>
				<td colspan="2"><button id="saB" type="submit">SAVE</button></td>
			</tr>

		</table>
	</form>



	<c:if
		test="${not empty requestScope.flag && requestScope.employee!=null}">
		<form id="form2" action="/EmpDeptApp/employee" method="post">

			<div id="updateId">
				<input type="hidden" id="hParam" name="hParam" value="uEmp">
				<input type="hidden" id="hdept" name="hdept" value="deleteE">
				<fieldset id="fieldId" name="field" disabled="disabled">
					<table>
						<tr>
							<td>Employee Id:</td>
							<td><input type="text" name="emp" id="emp"
								value="${requestScope.employee.empNo}"></td>
						</tr>
						<tr>
							<td>department Id:</td>
							<td><input type="text" name="dept" id="dept"
								value="${requestScope.employee.deptNo}"></td>
						</tr>
						<tr>
							<td>Salary:</td>
							<td><input type="text" name="salary" id="salary"
								value="${requestScope.employee.salary}"></td>
						</tr>
						<tr>
							<td>DOJ:</td>
							<td><input type="date" name="doj" id="doj"
								value="${requestScope.employee.doJ}"></td>
						</tr>
						<tr>
							<td>DOB:</td>
							<td><input type="date" name="dob" id="dob"
								value="${requestScope.employee.doB}"></td>
						</tr>
						<tr>
							<td>Grade:</td>
							<td><input type="text" name="grade" id="grade"
								value="${requestScope.employee.salaryGrade}"></td>
						</tr>
					</table>
				</fieldset>
			</div>
		</form>
		<div>
			<button id="updateB">UPDATE</button>
			<button id="deleteB" onclick="delB(${requestScope.employee.empNo})">DELETE</button>
			<button id="saveB" style='display: none'>SAVE</button>
		</div>
	</c:if>

	<c:if test="${requestScope.display!=null}">
		<form id=dform>
			<table>
				<tr>
					<td>Employee Id:</td>
					<td>${requestScope.display.empNo}</td>
				</tr>
				<tr>
					<td>department Id:</td>
					<td>${requestScope.display.deptNo}</td>
				</tr>
				<tr>
					<td>Salary:</td>
					<td>${requestScope.display.salary}</td>
				</tr>
				<tr>
					<td>DOJ:</td>
					<td>"${requestScope.display.doJ}</td>
				</tr>
				<tr>
					<td>DOB:</td>
					<td>${requestScope.display.doB}</td>
				</tr>
				<tr>
					<td>Grade:</td>
					<td>${requestScope.display.salaryGrade}</td>
				</tr>
			</table>
		</form>
	</c:if>

	<c:if test="${not empty requestScope.updateFlag}">
		<form action="/EmpDeptApp/employee" method="post">
			<div id="updateId">
				<input type="hidden" name="homePage"
					value="${requestScope.homePage}"> <input type="hidden"
					name="hParam" value="uEmp"> <input type="hidden"
					name="deptOld" value="${requestScope.employee.deptNo}">
				<table>
					<tr>
						<td>Employee Id:</td>
						<td><input type="text" name="emp" id="emp"
							value="${requestScope.employee.empNo}"></td>
					</tr>
					<tr>
						<td>department Id:</td>
						<td><input type="text" name="dept" id="dept"
							value="${requestScope.employee.deptNo}"></td>
					</tr>
					<tr>
						<td>Salary:</td>
						<td><input type="text" name="salary" id="salary"
							value="${requestScope.employee.salary}"></td>
					</tr>
					<tr>
						<td>DOJ:</td>
						<td><input type="date" name="doj" id="doj"
							value="${requestScope.employee.doJ}"></td>
					</tr>
					<tr>
						<td>DOB:</td>
						<td><input type="date" name="dob" id="dob"
							value="${requestScope.employee.doB}"></td>
					</tr>
					<tr>
						<td>Grade:</td>
						<td><input type="text" name="grade" id="grade"
							value="${requestScope.employee.salaryGrade}"></td>
					</tr>
				</table>
				<button type=submit>UPDATE</button>
			</div>
		</form>
	</c:if>

	<form id="empS" action="/EmpDeptApp/employee" method="post"
		style="display: none">

		<table>
			<tr>
				<td>Employee Id:</td>
				<td><input type="text" name="emp" id="emp"></td>
				<td><input type="hidden" name="hParam" id="hParam"
					value="deptU"></td>
			</tr>

			<tr>
				<td colspan="2"><button type="submit">Submit</button></td>
			</tr>
		</table>
	</form>

	<form id="empF" action="/EmpDeptApp/employee" method="post"
		style="display: none">

		<table>
			<tr>
				<td>Employee Id:</td>
				<td><input type="text" name="emp" id="emp"></td>
			</tr>

			<tr>
				<td colspan="2"><button type="submit">Submit</button></td>
			</tr>
		</table>
	</form>

	<%@include file="footer.jsp"%>
	<script src="dept.js"></script>
	<script src="employee.js"></script>
</body>
</html>