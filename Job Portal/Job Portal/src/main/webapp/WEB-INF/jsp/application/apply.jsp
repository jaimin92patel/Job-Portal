<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<title>CS Jobs - Apply</title>
</head>
<body>
<div class="page-header">
  <h1>CS Jobs<small> Job Application </small></h1>
</div>

<div class="container">
  <h2>${application.job.title}</h2>            
  <table class="table">
    <tbody>
		<tr><td>Applicant:</td><td>${application.applicant.firstName} ${application.applicant.lastName}</td>
		</tr>
		<form:form modelAttribute="application">
		<tr><td><b>Current Job Position:</b></td></tr>
		<tr><td>Title</td><td><form:input path="currentJobTitle" /></td></tr>
		<tr><td>Institution or Company</td><td><form:input path="currentJobInstitution" /></td></tr>
		<tr><td>Starting Year</td><td><form:input path="currentJobYear" /></td></tr>
		<tr><td></td><td><input type="submit" name="next" value="Next" /></td></tr>
		</form:form>
    </tbody>
  </table>
</div>
</body>
</html>
