<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<title>CS Jobs - Registration</title>
</head>
<body>
<div class="page-header">
  <h1>CS Jobs		<small> Registration  </small></h1>
</div>
<form:form class="form-horizontal" role="form" modelAttribute="user">
  <div class="form-group">
    <label class="control-label col-sm-2" for="email">Email:</label>
    <div class="col-sm-10">
      <form:input path="email" class="form-control" placeholder="Enter email"/><b><form:errors path="email" /></b>
    </div>
  </div>
  
  <div class="form-group">
    <label class="control-label col-sm-2" for="pwd">Password:</label>
    <div class="col-sm-10"> 
      <form:password path="password" class="form-control" placeholder="Enter password"/><b><form:errors path="password" /></b>
    </div>
  </div>
  
	<div class="form-group">
    <label class="control-label col-sm-2" for="pwd">Password again:</label>
    <div class="col-sm-10"> 
      <form:password path="password2" class="form-control" placeholder="Enter password"/><b><form:errors path="password2" /></b>
    </div>
  </div>
  
  <div class="form-group">
    <label class="control-label col-sm-2" for="pwd">Last Name:</label>
    <div class="col-sm-10"> 
      <form:password path="lastName" class="form-control" placeholder="Enter Last Name"/><b><form:errors path="lastName" /></b>
    </div>
  </div>
	
	<div class="form-group">
    <label class="control-label col-sm-2" for="pwd">First Name:</label>
    <div class="col-sm-10"> 
      <form:password path="firstName" class="form-control" placeholder="Enter First Name"/><b><form:errors path="firstName" /></b>
    </div>
  	</div>
	
	<div class="form-group">
    <label class="control-label col-sm-2" for="pwd">Phone:</label>
    <div class="col-sm-10"> 
      <form:password path="phone" class="form-control" placeholder="Enter Phone"/><b><form:errors path="phone" /></b>
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-sm-2" for="pwd">Address:</label>
    <div class="col-sm-10"> 
      <form:password path="address" class="form-control" placeholder="Enter Address"/><b><form:errors path="address" /></b>
    </div>
  </div>
  <div class="form-group"> 
    <div class="col-sm-offset-2 col-sm-10">
      <button type="submit" name="register" value="register" class="btn btn-default">Submit</button>
    </div>
  </div>
</form:form>
</body>
</html>
