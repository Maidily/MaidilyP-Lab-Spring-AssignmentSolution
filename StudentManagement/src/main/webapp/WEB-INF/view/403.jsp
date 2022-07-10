<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<style>
	body {
		margin-left:50px;
		margin-right:50px;
	}
	h1 {
		color:#ff944d;
	}
	a {
		color: #0077b3;
	}
</style>

<title>Error Page</title>
</head>
<body>
	
	<br/><br/>
	
	<h1> HTTP Status 403 - Access is denied </h1>
	<h2> ${msg} </h2>
	
		
	<br/><br/>
	<hr/>
	<br/><br/>
	
	<a href="${pageContext.request.contextPath}/student/list">Back to Students List</a>
	
</body>
</html>