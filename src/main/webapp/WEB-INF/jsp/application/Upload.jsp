<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<title>File Upload</title>
</head>
<body>
<div class="page-header">
  <h1>CS Jobs</h1>
</div>
<div class="container">
  <h2>CV Upload</h2>            
  <table class="table">
    <tbody>
	<tr><td><form action="Upload.html?${_csrf.parameterName}=${_csrf.token}" method="POST" enctype="multipart/form-data">
<input type="file" name="file"/> <br/>
<input type="submit" name="upload" value="Upload"/>
</form></td></tr>

    </tbody>
  </table>
</div>
<p style= "margin-left: 120px;"><a href="TeachingStatement.html">Next</a></p>
</body>
</html>