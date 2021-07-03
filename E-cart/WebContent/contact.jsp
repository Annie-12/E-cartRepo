<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Contact </title>
<script src="Js/main.js" type=module></script>
<link rel="stylesheet" type="text/css" href="Css/contactUs.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<style type="text/css">
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
<form action="alert("You query has been submitted!!");">
	<div class="container">
		<div class="jumbotron">
			<div class="form-group">
				<h1 class="display-4 pb-4">Leave your query</h1>
				<input type="text" class="form-control" name="name" placeholder="Your name"> <br>
				<input type="email" class="form-control" name="email" placeholder="E-mail address"> <br>
				<textarea name="query" class="form-control" placeholder="Type your query here.." rows="4" cols="100"></textarea> <br>
				<button class="btn btn-primary">Submit</button>
			</div>
		</div>
	</div>
</form>


<footer-f></footer-f>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>