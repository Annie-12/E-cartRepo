<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Seller</title>
<script src="/E-cart/Js/main.js" type=module></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<style>
.bgimg{
	background-image: url('/E-cart/img/seller-bg.jpg');
    background-repeat: no-repeat;
    background-attachment: fixed; 
    background-size: 100% 80%;
    height:800px;
    overflow:hidden;
}
@media screen and (max-height: 450px) {
	.mid{
		margin-left:400px;		
	}
}
.column {
  float: left;
  width: 33%;
  padding:40px;
  text-align:center;
  height: 200px; /* Should be removed. Only for demonstration */
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Responsive layout - makes the three columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {
  .column {
    width: 100%;
  }
}
</style>
</head>
<body>
<header-h></header-h>
<div class="bgimg">

</div>

<div class="mid" style="margin-top:-450px;margin-left:700px">
<button class="btn btn-primary" onclick="window.location='SellerRegistration.jsp'">Become a seller</button>
<h2>Flaunt your skill and<br> Get PAID</h2>
</div>
<div style="margin-top:200px;padding-left:45%"><h3>How it works<br></h3></div>
<div class="row" style="background-color:#ccc;">
<br>
  <div class="column" >
    <h2>Step:1</h2>
    <p>Upload your post.</p>
  </div>
  <div class="column">
    <h2>Step:2</h2>
    <p>Get Discovered by users</p>
  </div>
  <div class="column">
    <h2>Step:3</h2>
    <p>Deliver the product</p>
  </div>
</div>
<br>
<footer-f></footer-f>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>