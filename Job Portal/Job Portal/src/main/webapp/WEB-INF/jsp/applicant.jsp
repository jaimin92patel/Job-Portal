<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<title>CS Jobs - Applicant</title>
</head>
<body>
<div class="page-header">
  <h1>CS Jobs<small> Welcome Applicant</small></h1>
</div>
<p>

<form action="/csjobs-exam/logout" method="POST">
<input name="_csrf" type="hidden" value="${_csrf.token}"/>
<input name="submit" type="submit" value="Logout" style="float:right; margin-right:30px;"/>
</form>
<c:if test="${not empty user.applications}">
<div class="container">
  <h2>Job Positions Applied</h2>            
  <table class="table">
    <tbody>
    	<tr>
		<th>Job Title</th>
		<th>View Applicants</th>
		</tr>
    
    <c:if test="${user.applications.size() > 0}">
  		<c:forEach items="${user.applications}" var="application">
 <tr><td><a href="<c:url value='/job/view.html?id=${application.job.id}' />">${application.job.title}</a></td>
    <td><a href="<c:url value='/application/view.html?id=${application.id}' />">Application</a></td></tr>
 
  </c:forEach>

</c:if>
    </tbody>
  </table>
</div>
</c:if>
<c:if test="${not empty availableJobs}">
<div class="container">
  <h2>Job Positions Available</h2>            
  <table class="table">
    <tbody>
    	<tr>
		<th>Job Title</th>
		<th>View Applicants</th>
		</tr>
    
    <c:if test="${availableJobs.size() > 0}">
  		
  		<c:forEach items="${availableJobs}" var="job">
 			<tr><td><a href="<c:url value='/job/view.html?id=${job.id}' />">${job.title}</a></td>
    		<td><a href="<c:url value='/application/apply.html?jobId=${job.id}' />">Apply</a></td></tr>
 
  </c:forEach>

</c:if>
    </tbody>
  </table>
</div>
</c:if>
<%-- <h3>Job Positions Applied</h3>
<c:if test="${user.applications.size() > 0}">
<ul>
  <c:forEach items="${user.applications}" var="application">
  <li><a href="<c:url value='/job/view.html?id=${application.job.id}' />">${application.job.title}</a>
    [<a href="<c:url value='/application/view.html?id=${application.id}' />">Application</a>]
  </li>
  </c:forEach>
</ul>
</c:if>
 --%>

<%-- <h3>Job Positions Available</h3>
<c:if test="${availableJobs.size() > 0}">
<ul>
  <c:forEach items="${availableJobs}" var="job">
  <li><a href="<c:url value='/job/view.html?id=${job.id}' />">${job.title}</a>
    [<a href="<c:url value='/application/apply.html?jobId=${job.id}' />">Apply</a>]
  </li>
  </c:forEach>
</ul>
</c:if>
 --%>
</body>
</html>
