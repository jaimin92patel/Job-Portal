<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CS Jobs</title>
</head>
<body>
<h2>CS Jobs (Exam Edition)</h2>

<c:if test="${empty authenticatedUser}">
<p>
  <a href="<c:url value='/register.html' />">Register</a> |
  <a href="<c:url value='/login.html' />">Login</a>
</p>
</c:if>

<c:if test="${not empty authenticatedUser}">
<p>You are logged in as <em>${authenticatedUser.firstName}, ${authenticatedUser.lastName}</em>.
<a href="<c:url value='/logout.html' />">Logout</a></p>
</c:if>

<h3>Open Job Postions</h3>
<ul>
<c:forEach items="${openJobs}" var="job">
  <li><a href="<c:url value='/job/view.html?id=${job.id}' />">${job.title}</a></li>
</c:forEach>
</ul>
</body>
</html>
