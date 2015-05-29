<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ include file="/WEB-INF/pages/includes.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Student Management</title>
</head>
<body>

<h1>Students Data</h1>
<form:form action="student.do" method="POST" commandName="student">
<h3><spring:message code="student.title.studentid"></spring:message></h3>

	<table>
		<tr>
			<td>Student ID</td>
			<td><form:input path="studentId" /></td>
		</tr>
		<tr>
			<td>First name</td>
			<td><form:input path="firstName" /></td>
		</tr>
		<tr>
			<td>Last name</td>
			<td><form:input path="lastName" /></td>
		</tr>
		<tr>
			<td>Year Level</td>
			<td><form:input path="age" /></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" name="action" value="Add" />
				<input type="submit" name="action" value="Edit" />
				<input type="submit" name="action" value="Delete" />
				<input type="submit" name="action" value="Search" />
			</td>
		</tr>
	</table>
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