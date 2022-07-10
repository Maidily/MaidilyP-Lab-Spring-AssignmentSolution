<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<style>
	.header {
		margin-left:50px;
		margin-right:50px;
		height:60px;
		background-color:#ffb380;
		padding:10px 20px;
	}
	h1 {
		letter-spacing:1px;
		font-size:30px;
		text-align:center;
		color:white;
	}
	div {
		margin-left:50px;
		margin-right:50px;
	}
	table, th, td {
		border: none;
		border-collapse: collapse;
		padding:10px;
	}
	button {
		color:white; 
		background-color: DodgerBlue; 
		font-weight: bold; 
		cursor: pointer;
		padding: 8px 40px;
		border: none;
		border-radius: 12px;
	}
	#student td {
		text-align: center;
	}
	#student tr:nth-child(even) {
		background-color: #cccccc;
	}
	a {
		color: #0077b3;
	}
</style>

<title>Students Directory</title>
</head>

<body>
	
	<div class="header">
		
		<h1><B> Student Management </B></h1>
		
	</div>
	
	<br/><br/>
	
	<div>
		<table id="actionBar" style="width:100%; " >
			<tbody>
				<tr>
					<td>
						<!-- Add a Add-Student form -->
						
						<form action="${pageContext.request.contextPath}/student/showFormForAdd">
							<!-- Add a button -->
							<button type="submit"> Add Student </button>
						</form>
					</td>
					<td style = "text-align:right; padding:20px; " >
						<form action="${pageContext.request.contextPath}/logout">
							<!-- Add a logout button -->
							<button type="submit"> Logout </button>
						</form>
					</td>
				</tr>
			</tbody>
		</table>
		<br/><br/>
		
		<table id="student" style="width:50%; margin-left:auto; margin-right:auto;" >
			<thead style="height: 50px; background-color:#ffb380; color: white;" >
				<tr>
					<th>Student Id</th>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Course</th>
					<th>Country</th>
					<th>Action</th>				
				</tr>
			</thead>
			
			<tbody>
				<c:forEach items="${Students}" var="tempStudent">
					<tr>
						<td><c:out value="${tempStudent.studentId}" /></td>
						<td><c:out value="${tempStudent.firstName}" /></td>
						<td><c:out value="${tempStudent.lastName}" /></td>
						<td><c:out value="${tempStudent.course}" /></td>
						<td><c:out value="${tempStudent.country}" /></td>
						<td>
							<!-- Add "update" link --> 
							<a href="${pageContext.request.contextPath}/student/showFormForUpdate?studentId=${tempStudent.studentId}"> Update </a> 
							
							 &nbsp; | &nbsp;
							
							<!-- Add "delete" link -->
							<a href="${pageContext.request.contextPath}/student/delete?studentId=${tempStudent.studentId}" style="color:red;"
							onclick="if (!(confirm('Are you sure you want to delete this Student?'))) return false"> Delete </a>
							
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<br/>
		<hr>
		<br/><br/>
		
	</div>
	
</body>
</html>