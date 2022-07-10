<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
	.container {
		margin-left:50px;
		margin-right:50px;
		width: 100%;
	}
	table, th, td {
		border: none;
		border-collapse: collapse;
		padding: 15px;
		font-weight: bold;
	}
	#student {
		margin-left: 15%;
	}
	button {
		color: white; 
		background-color: DodgerBlue; 
		font-weight: bold; 
		cursor: pointer;
		padding: 8px 40px;
		margin: auto;
		border: none;
		border-radius: 12px;
		margin-left: 20%;
	}
	p {
		font-weight: bold;
	}
	input {
		height: 20px;
		border-radius: 4px;
	}
	a {
		color: #0077b3;
	}
</style>

<title>Save Student</title>

<script type="text/javascript">
	function validate() {
		
		var fName = document.student.firstName.value;
		if(fName == null || fName == "") {
			alert("Please Enter the First Name");
			return false;
		}
		
		var lName = document.student.lastName.value;
		if(lName == null || lName == "") {
			alert("Please Enter the Last Name");
			return false;
		}
		
		var course = document.student.course.value;
		if(course == null || course == "") {
			alert("Please Enter the Course");
			return false;
		}
		
		var country = document.student.country.value;
		if(country == null || country == "") {
			alert("Please Enter the Country");
			return false;
		}
	}
</script>

</head>

<body>

	<div class="header">
		
		<h1><B> Student Management </B></h1>
				
	</div>
	
	<br/>
	
	<div class="container" >
		
		<br/><br/>
		
		<h2>Student Details</h2>
		
		<form action="${pageContext.request.contextPath}/student/save" method="POST" style="width:100%;" name="student" >
			
			<!-- Add hidden form field to handle update -->
			<input type="hidden" name="studentId" value="${Student.studentId}" />
			
			<table id="student" >
				<tbody>
					<tr>
						<td> First Name: </td>
						<td> <input type="text" name="firstName" value="${Student.firstName}" placeholder="Enter the First Name"> </td>	
					</tr>
					<tr>
						<td> Last Name: </td>
						<td> <input type="text" name="lastName" value="${Student.lastName}" placeholder="Enter the Last Name"> </td>
					</tr>
					<tr>
						<td> Course: </td>
						<td> <input type="text" name="course" value="${Student.course}" placeholder="Enter the Course"> </td>
					</tr>
					<tr>
						<td> Country: </td>
						<td> <input type="text" name="country" value="${Student.country}" placeholder="Enter the Country"> </td>
					</tr>
				</tbody>
			</table>
						
			<br/><br/>
			
			<button type="submit" onClick="return validate();" > Save </button>
		</form>
		
		<hr>
		<br/><br/>
		
		<!-- Add a Return to Student List link -->
		<a href="${pageContext.request.contextPath}/student/list" >Back to Students List</a>
			
	</div>

</body>
</html>