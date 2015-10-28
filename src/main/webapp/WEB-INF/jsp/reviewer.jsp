<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<title>CS Jobs - Reviewer</title>
</head>
<body>
<div class="page-header">
  <h1>CS Jobs<small> Welcome Reviewer ${authenticatedUser.firstName} </small></h1>
</div>

<form action="/csjobs-exam/logout" method="POST">
<input name="_csrf" type="hidden" value="${_csrf.token}"/>
<input name="submit" type="submit" value="Logout" style="float:right; margin-right:30px;">
</form>

<h3>Reviewer Home</h3>

<div class="container">
  <h2>${job.title}</h2>            
  <table class="table">
    <tbody>
    	<tr>
		<th>Job Title</th>
		<th>View Applicants</th>
		</tr>
		
		<c:if test="${!empty jobs}">
			<c:forEach items="${jobs}" var="job" >
			<tr>
<td><a href="application/ViewJobsByAdmin.html?id=${job.id}">${job.title}</a> </td>
<td><a href="application/ViewApplicantsByAdmin.html?id=${job.id }"> View</a></td>
</tr>
</c:forEach>
</c:if>
      	
    </tbody>
  </table>
</div>

<%-- <table border="1">
<tr>
<th>Job Title</th>
<th>View Applicants</th>
</tr>
 <c:if test="${!empty jobs}">
<c:forEach items="${jobs}" var="job" >
<tr>
<td><a href="application/ViewJobsByAdmin.html?id=${job.id}">${job.title}</a> </td>
<td><a href="application/ViewApplicantsByAdmin.html?id=${job.id }"> View</a></td>
</tr>
</c:forEach>
</c:if>
</table>
 --%>
</body>
</html>
