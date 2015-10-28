<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<title>CS Jobs - Admin</title>
</head>
<body>
<div class="page-header">
  <h1>CS Jobs		<small>  Admin  </small></h1>
</div>

<form action="/csjobs-exam/logout" method="POST">
<input name="_csrf" type="hidden" value="${_csrf.token}"/>

<input name="submit" type="submit" value="Logout" style="float:right; margin-right:30px;"/>
</form>

<p style= "margin-left: 120px;"><b><a href="<c:url value='/job/CreateNewJob.html?' />">Create New Job</a></b></p>

<div class="container">
  <h2>${job.title}</h2>            
  <table class="table">
    <tbody>
    	<tr>
    	<th>Publish Date</th><th>Close Date</th><th>Operations</th><th>Edit Job</th><th>View Applicants</th>
    	</tr>
    	<c:forEach items="${jobs}" var="jobs">
      <tr>
        <td><a href="<c:url value='/application/ViewJobsByAdmin.html?id=${jobs.id}' />">${jobs.title}</a></td>
        <td><fmt:formatDate value="${jobs.publishDate}" pattern="M/d/yyyy" /></td>
        <td><fmt:formatDate value="${jobs.closeDate}" pattern="M/d/yyyy" /></td>
        <td><a href="<c:url value='/job/Edit.html?id=${jobs.id}' />">Edit</a></td>
        <td><a href="<c:url value='/application/ViewApplicantsByAdmin.html?id=${jobs.id}' />">View</a></td>
      </tr>
      </c:forEach>
      
    </tbody>
  </table>
</div>
</body>
</html>
