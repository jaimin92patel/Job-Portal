<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CS Jobs</title>
</head>
<body>
<h2>Create a New Job</h2>

<c:if test="${empty authenticatedUser}">
<p>
  <a href="<c:url value='/register.html' />">Register</a> |
  <a href="<c:url value='/login.html' />">Login</a>
</p>
</c:if>

<c:if test="${not empty authenticatedUser}">
	<c:if test="${authenticatedUser.isAdmin()}">	
		<p>You are logged in as <em>${authenticatedUser.firstName}, ${authenticatedUser.lastName}</em>.
		<a href="<c:url value='/logout.html' />">Logout</a></p>
		
		<form:form modelAttribute="job">
			<table border="1">
			<tr>
			  <th>Title:</th>
			  <td><form:input path="title" /> <b><form:errors path="title" /></b></td>
			</tr>
			<tr>
			  <th>Description:</th>
			  <td><form:textarea rows="4" cols="50" path="description" /> <b><form:errors path="description" /></b></td>
			</tr>
			<tr>
			  <th>Publish Date:</th>
			  <td><form:input path="publishDate" /> <b><form:errors path="publishDate" /></b></td>
			</tr>
			<tr>
			  <th>Close Date:</th>
			  <td><form:input path="closeDate" /> <b><form:errors path="closeDate" /></b></td>
			</tr>
			<tr>
			  <th>CommitteeChair:</th>
			  <td>
			  	<select modelAttribute="chair" >
					<c:forEach items="${users}" var="user">
					    <option value="${user.getId()}">${user.getFirstName()},${user.getLastName()}
					    </option>
					</c:forEach>
				</select>
			  </td>
			</tr>
			<tr>
			  <th>Committee Members:</th>
			  <td>
			  	<c:forEach items="${users}" var="user">
			  	 	<form:checkbox path="" value="${user.getId()}" /> 
			  	 	${user.getFirstName()},${user.getLastName()} <br/>				   
				</c:forEach>
			 
			  </td>
			</tr>
			<tr>
			  <td><input type="submit" name="create" value="create" /><br />
			  </td><td></td>
			</tr>
			</table>
		</form:form>
	</c:if>
	<c:if test="${not authenticatedUser.isAdmin()}">	
		<p><em>You are not admin. You cannot create job.</em>
		<a href="<c:url value='/logout.html' />">Logout</a></p>		
	</c:if>
</c:if>

</body>
</html>
