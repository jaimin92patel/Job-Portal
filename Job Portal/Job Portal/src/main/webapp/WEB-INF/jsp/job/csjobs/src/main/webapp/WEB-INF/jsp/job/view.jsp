<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>CSJobs - Job</title>
</head>
<body>
<h2>CS Jobs (Exam Edition)</h2>
<h3>${job.title}</h3>
<p><b>Posted on:</b> <fmt:formatDate value="${job.publishDate}" pattern="M/d/yyyy" /></p>
<p><b>Close on:</b>  <fmt:formatDate value="${job.closeDate}" pattern="M/d/yyyy" /></p>
<p><b>Job Description:</b></p>
<p>${job.description}</p>
<p><b>Review Committee Chair</b></p>
<p>${job.getCommitteeChair().getFirstName()} ${job.getCommitteeChair().getLastName()}</p>
<c:if test="${nonchairCommitteMembers.size() > 0}">
<p><b>Other Review Committee Members</b></p>
<c:forEach items="${nonchairCommitteMembers}" var="member">
<p>
${member.getFirstName()} ${member.getLastName()}
</p>  
</c:forEach>
</c:if>
</body>
</html>
