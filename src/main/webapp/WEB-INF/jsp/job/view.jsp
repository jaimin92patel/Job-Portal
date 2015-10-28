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
<title>CSJobs - Job</title>
</head>
<body>
<div class="page-header">
  <h1>CS Jobs</h1>
</div>

<div class="container">
  <h2>${job.title}</h2>            
  <table class="table">
    <tbody>
      <tr>
        <td><b>Posted on:</b></td>
        <td><fmt:formatDate value="${job.publishDate}" pattern="M/d/yyyy" /></td>
      </tr>
      
      <tr>
        <td><b>Close on:</b></td>
        <td><fmt:formatDate value="${job.closeDate}" pattern="M/d/yyyy" /></td>
      </tr>
      
      <tr>
        <td><b>Job Description:</b></td>
        <td>${job.description}</td>
      </tr>
    </tbody>
  </table>
</div>
</body>
</html>
