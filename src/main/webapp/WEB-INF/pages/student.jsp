<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ include file="/WEB-INF/pages/includes.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
$( document ).ready(function() {
	
});
</script>
<title>Student Management</title>
</head>
<body>

<h1>Students Data</h1>
<form:form action="student.do" method="POST" commandName="student">
<h3><spring:message code="student.title.studentid"></spring:message></h3>
	
	<div class="row">
	<div class="col-md-12">
		<div style="margin-top:10px;"></div>
			<div class="row">
				<div class="col-md-3">
				<strong>Student ID</strong>
				</div>
				<div class="col-md-4">
					<form:input path="studentId" class='form-control'/>
				</div>
			</div>
			
			<div style="margin-top:10px;"></div>
			<div class="row">
				<div class="col-md-3">
				<strong>First name</strong>
				</div>
				<div class="col-md-4">
					<form:input path="firstName" class='form-control'/>
				</div>
			</div>
		
			<div style="margin-top:10px;"></div>
			<div class="row">
				<div class="col-md-3">
				<strong>Last name</strong>
				</div>
				<div class="col-md-4">
					<form:input path="lastName" class='form-control'/>
				</div>
			</div>
		
			<div style="margin-top:10px;"></div>
			<div class="row">
				<div class="col-md-3">
				<strong>Age</strong>
				</div>
				<div class="col-md-4">
					<form:input path="age" class='form-control'/>
				</div>
			</div>
		
			
				<input type="submit" class="btn btn-default btn-primary" name="action" value="Add" />
				<input type="submit" name="action" value="Edit" />
				<input type="submit" name="action" value="Delete" />
				<input type="submit" name="action" value="Search" />
			</div>
			</div>
	
</form:form>
<br>
<table border="1">
	<th>ID</th>
	<th>First name</th>
	<th>Last name</th>
	<th>Year level</th>
	<c:forEach items="${studentList}" var="student">
		<tr>
			<td>${student.studentId}</td>
			<td>${student.firstName}</td>
			<td>${student.lastName}</td>
			<td>${student.age}</td>
		</tr>
	</c:forEach>
</table>
</body>
</html>