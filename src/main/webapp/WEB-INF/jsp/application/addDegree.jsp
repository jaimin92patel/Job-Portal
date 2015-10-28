<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<title>CS Jobs - Add Degree</title>
</head>
<body>
<div class="page-header">
  <h1>CS Jobs<small> ${application.job.title} Application</small></h1>
</div>

<div class="container">
  <h2>${application.applicant.firstName} ${application.applicant.lastName}</h2> 
  <form:form modelAttribute="degree">           
  <table class="table">
    <tbody>
	<tr><th>Degree</th><th>School</th><th>Year</th></tr>
	    <c:forEach items="${application.degrees}" var="degree">
<tr>
  <td>${degree.name}</td>
  <td>${degree.school}</td>
  <td>${degree.year}</td>
</tr>
</c:forEach>
	<tr>
  <td><form:input path="name" /></td>
  <td><form:input path="school" /></td>
  <td><form:input path="year" /></td>
</tr>
	<tr><td><input type="submit" name="add" value="Add" /></td></tr>
	
	
    </tbody>
  </table>
  </form:form>
</div>
<p style= "margin-left: 120px;"><a href="Upload.html">Next</a></p>

</body>
</html>
