<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<title>Create New Job</title>
</head>
<body>
<div class="page-header">
  <h1>CS Jobs			<small> Create New Job  </small></h1>
</div>

<form:form modelAttribute="job">
 <div class="container">            
  <table class="table">
    <tbody>
      <tr>
        <td>Title:</td>
        <td><form:input path="title" required="required"/></td>
      </tr>
      <tr>
        <td>Description:</td>
        <td><form:input path="description" required="required"/></td>
      </tr>
      <tr>
        <td>Publish Date:</td>
        <td><form:input path="publishDate"  /></td>
      </tr>
      <tr>
        <td>Close Date:</td>
        <td><form:input path="closeDate" /></td>
      </tr>
      <tr>
        <td>Committee Chair:</td>
        <td><form:select path="committeeChair">
	  <c:forEach items="${ComitteeChairList}" var="user">
	  <form:option value="${user.id}">${user.firstName} ${user.lastName}</form:option>
	 </c:forEach>
  		</form:select></td>
      </tr>
      <tr>
        <td>Committee members:</td>
        <td><c:forEach items="${ComitteeChairList}" var="user">
  <form:checkbox path="committeeMembers" value="${user.id}" />${user.firstName} ${user.lastName} 
   </c:forEach></td>
      </tr>
      <tr><td><input type="submit" name="submit"/></td></tr>
      
      
    </tbody>
  </table>
</div>
</form:form>
</body>
</html>