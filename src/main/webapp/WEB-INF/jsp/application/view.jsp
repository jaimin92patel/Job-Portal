<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<title>CS Jobs - Application</title>
</head>
<body>
<div class="page-header">
  <h1>CS Jobs<small> View Application </small></h1>
</div>

<div class="container">
  <h2>${application.job.title}</h2>            
  <table class="table">
    <tbody>
    	<tr>
    	<td>Applicant:</td><td>${application.applicant.firstName} ${application.applicant.lastName}</td>
    	</tr>
		<tr>
		<td>Submitted:</td><td><fmt:formatDate value="${application.submitDate}" pattern="M/d/yyyy" /></td>
		</tr>
		<tr><td>Current Position:</td><td>${application.currentJobTitle} at ${application.currentJobInstitution}
				since ${application.currentJobYear}</td>
		</tr>
		<tr>
		<td>CV:</td><td><a href="Download.html?applicationId=${application.id}">${application.cv.name}</a></td>
		</tr>
		<tr><td>Teaching Statement:</td><td><a href="TeachingStatementDownload.html?applicationId=${application.id}">${application.teachingStatement.name}</a></td>
		</tr>
		<tr><td>Research Statement:</td><td><a href="ResearchStatementDownload.html?applicationId=${application.id}">${application.researchStatement.name}</a></td>
		</tr>
	
    </tbody>
  </table>
</div>

<c:if test="${!empty application.degrees}">
<div class="container">           
  <table class="table">
    <tbody>
    	<tr>
    	<th>Degree</th><th>School</th><th>Year</th>
    	</tr>
		<c:forEach items="${application.degrees}" var="degree">
<tr>
  <td>${degree.name}</td>
  <td>${degree.school}</td>
  <td>${degree.year}</td>
</tr>
</c:forEach>
    </tbody>
  </table>
</div>
</c:if>
<%-- 
<table border="1">
<tr><th>Degree</th><th>School</th><th>Year</th></tr>
<c:forEach items="${application.degrees}" var="degree">
<tr>
  <td>${degree.name}</td>
  <td>${degree.school}</td>
  <td>${degree.year}</td>
</tr>
</c:forEach>
</table> --%>
<%-- 
<p>Applicant: ${application.applicant.firstName} ${application.applicant.lastName}</p>
<p>Submitted: <fmt:formatDate value="${application.submitDate}" pattern="M/d/yyyy" /></p>
<p>Current Position: ${application.currentJobTitle} at ${application.currentJobInstitution}
since ${application.currentJobYear}</p><br />

<b>CV:</b><a href="Download.html?applicationId=${application.id}">${application.cv.name}</a><br/>
<b>Teaching Statement:</b><a href="TeachingStatementDownload.html?applicationId=${application.id}">${application.teachingStatement.name}</a><br />
<b>Research Statement:</b><a href="ResearchStatementDownload.html?applicationId=${application.id}">${application.researchStatement.name}</a> 		<br />
 --%>
<%-- <table border="1">
<tr><th>Degree</th><th>School</th><th>Year</th></tr>
<c:forEach items="${application.degrees}" var="degree">
<tr>
  <td>${degree.name}</td>
  <td>${degree.school}</td>
  <td>${degree.year}</td>
</tr>
</c:forEach>
</table> --%>


</body>
</html>
