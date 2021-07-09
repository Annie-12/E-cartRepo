<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
    <%@page import="java.io.OutputStream"%>
    <%@page import="java.util.*,beans.*,db.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Investor - Home</title>
<script src="/E-cart/Js/main.js" type=module></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<%
response.setHeader("Cache-Control", "no-cache,no-store,must-revalidte");
if(session.getAttribute("email")==null){
response.sendRedirect("/E-cart/");
}

%>
<%
String email=(String)session.getAttribute("email");

%>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarToggler" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>
	  <a class="navbar-brand">E-cart</a>

	  <div class="collapse navbar-collapse" id="navbarToggler">
	    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
	      <li class="nav-item">
	        <a class="nav-link" href="InvestorDashboard">Home <span class="sr-only">(current)</span></a>
	      </li>
	      
	      <li class="nav-item" id="contact">
	        <a class="nav-link" href="Orders.jsp">Orders</a>
	      </li>
	    </ul>        
	     
	     <button class="btn btn-primary"><a href="/E-cart/logout.jsp" style="text-decoration:none;color:white">Logout</a></button>
	     

	  </div>
	</nav>

<img src="https://png.pngtree.com/thumb_back/fw800/background/20190221/ourmid/pngtree-simple-gradient-e-commerce-web-page-image_21108.jpg" alt="home" style="width:100%;">

<div style="text-align:center">

	<h1>Products</h1>
	
</div>
<br>
<%

       List<Products> ls=ProductsDb.getProducts();
      
       for(Products p:ls){
    	   String src=p.getLocation();
    	   String productId=p.getId();
    	   session.setAttribute(p.getId(), productId);
  			
    	   %>
    	   <div class="card" style="width: 20%;">
  				<img class="card-img-top" src="<%=src %>" alt="Card image cap">
				  <div class="card-body">
				    <h5 class="card-title"><%=p.getName() %></h5>
				    <p class="card-text"><%= p.getDesc() %></p>
				   <%out.write("<a class='btn btn-primary' href='PlaceOrder.jsp?prodid="+productId +"'>Place order</a>"); %>
				    
				  </div>
</div>
 <% }
      
       
        
      // os.flush();
   // os.close();}
	

%>




<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>



</body>
</html>