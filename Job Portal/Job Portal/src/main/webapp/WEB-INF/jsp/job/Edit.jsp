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
<title>Edit</title>
</head>
<body>
<div class="page-header">
  <h1>CS Jobs			<small> Job Edit  </small></h1>
</div>

 <form:form role="form" modelAttribute="job">
 <div class="container">            
  <table class="table">
    <tbody>
      <tr>
        <td>Job Title</td>
        <td><form:input path="title" required="required"/></td>
      </tr>
      <tr>
        <td>Job Description</td>
        <td><form:input path="description" required="required"/></td>
      </tr>
      <tr>
        <td>Job Publish date</td>
        <td><form:input path="publishDate"/></td>
      </tr>
      <tr>
        <td>Job close date</td>
        <td><form:input path="closeDate"/></td>
      </tr>
      <tr>
        <td>Committee Chair</td>
        <td><form:select path="committeeChair">
	  <c:forEach items="${ComitteeChairList}" var="user">
	  <form:option value="${user.id}">${user.firstName} ${user.lastName}</form:option>
	 </c:forEach>
  		</form:select>
  		</td>
      </tr>
      
      <tr>
        <td>Committee members</td>
        <td><c:forEach items="${ComitteeChairList}" var="user">
  <form:checkbox path="committeeMembers" value="${user.id}" />${user.firstName} ${user.lastName} 
   </c:forEach></td>
      </tr>
      <tr><td></td><td><form:button class="btn btn-default" type="submit" name="submit">Submit</form:button></td>
      
      </tr>
      
    </tbody>
  </table>
</div>
</form:form>
 
<%-- <form:form role="form" modelAttribute="job">
  
  <div class="form-group">
    <label for="email">Job Title</label>
    <form:input path="title" required="required"/>
  </div>
  
  <div class="form-group">
    <label for="pwd">Job Description</label>
    <form:input path="description" required="required"/>
  </div>
  <div class="form-group">
    <label for="email">Job Publish date</label>
    <form:input path="publishDate"/>
  </div>
  <div class="form-group">
    <label for="email">Job close date</label>
    <form:input path="closeDate"/>
  </div>
  <div class="form-group">
    <label for="email">Committee Chair</label>
    <form:select path="committeeChair">
	  <c:forEach items="${ComitteeChairList}" var="user">
	  <form:option value="${user.id}">${user.firstName} ${user.lastName}</form:option>
	 </c:forEach>
  </form:select>
  </div>
  <div class="form-group">
    <label for="email">Committee members</label>
    <c:forEach items="${ComitteeChairList}" var="user">
  <form:checkbox path="committeeMembers" value="${user.id}" />${user.firstName} ${user.lastName} <br/>
   </c:forEach>
  </div>
  <form:button class="btn btn-default" type="submit" name="submit">Submit</form:button>
   <button type="submit" class="btn btn-default">Submit</button>
</form:form> --%>
</body>
</html>