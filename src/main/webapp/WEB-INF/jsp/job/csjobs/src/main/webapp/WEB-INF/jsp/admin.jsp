<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CS Jobs - Admin</title>
</head>
<body>
<h2>CS Jobs (Exam Edition)</h2>

<p>You are logged in as <em>${authenticatedUser.firstName} ${authenticatedUser.lastName}</em>.
<a href="<c:url value='/logout.html' />">Logout</a></p>

<h3>Admin Home</h3>
<h4><a href="<c:url value='/createJob.html' />" > Create New Job</a></h4>
<c:if test="${allJobs.size() > 0}">
<table border="1">
<tr>
<th> Job </th>
<th> Publish Date </th>
<th> Close Date </th>
<th> Operation>
</tr>
<c:forEach items="${allJobs}" var="job">
<tr>
<td><a href="<c:url value='/job/view.html?id=${job.id}' />">${job.title}</a></td>
<td><fmt:formatDate value="${job.publishDate}" pattern="dd/MM/yyyy" /></td>
<td><fmt:formatDate value="${job.closeDate}" pattern="dd/MM/yyyy" /></td>
<td><a href="<c:url value='/job/edit.html?id=${job.id}' />">Edit</a></td>
</tr>
</c:forEach>
</table>
</c:if>
</body>
</html>
