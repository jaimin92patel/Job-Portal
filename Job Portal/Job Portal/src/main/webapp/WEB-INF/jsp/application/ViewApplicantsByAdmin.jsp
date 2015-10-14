<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<title>Applicants</title>
</head>
<body>


<div class="page-header">
  <h1>CS Jobs		<small>Applicants</small></h1>
</div>

<c:if test="${empty apps}">
					<b>No Applicants</b>
</c:if>
<c:if test="${not empty apps}">
<div class="container">
  <h2>${job.title}</h2>            
  <table class="table">
    <tbody>
    	<tr>
		<th>applicant Name</th>
		<th>View Application</th>
		</tr>
      		<c:if test="${!empty apps}">
			<c:forEach items="${apps}" var="app" >
			<tr>
				<td>${app.applicant.firstName } ${app.applicant.lastName}</td>
				<td><a href="view.html?id=${ app.id}">View</a></td>
			</tr>
			</c:forEach>
			</c:if>
    </tbody>
  </table>
</div>
</c:if>
</body>
</html>