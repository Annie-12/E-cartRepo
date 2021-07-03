<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  isELIgnored="false" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1" charset="ISO-8859-1">
<title>Login</title>
<script src="Js/main.js" type=module></script>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
  
<style>
	.jumbotron {
			background-color: #a0c99770;
			width: 50%;
			margin: auto;
			padding: 3rem 2rem;
		}
		
</style>
</head>

<body> 
<header-h></header-h>
<br>
<form action="LoginProcess.jsp" method="post">
	<div class="container">
		<div class="jumbotron">
			<div class="form-group">
				<h1 class="display-4 pb-4">Login</h1>
				
				<input type="email" class="form-control" name="email" placeholder="E-mail address"> <br>
				<input type="password" class="form-control" name="password" placeholder="Password"><br>
				<a href="Registration.jsp">New User Register</a>
				<button class="btn btn-primary">Login</button>
			</div>
		</div>
	</div>
</form>
<%

	
%>

<footer-f></footer-f>	
	
	
	
</body>
</html>