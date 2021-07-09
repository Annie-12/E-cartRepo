<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,java.time.format.DateTimeFormatter, java.time.LocalDateTime"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Investor - Place order</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>

	.jumbotron {
			background-color: #a0c99770;
			width: 50%;
			margin: auto;
			
		}
</style>

</head>
<body>
<%
response.setHeader("Cache-Control", "no-cache,no-store,must-revalidte");
if(session.getAttribute("email")==null){
response.sendRedirect("/E-cart/");
}

%>
<%
String prodid=(String)request.getParameter("prodid"); 
String email = (String)session.getAttribute("email");
%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarToggler" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>
	  <a class="navbar-brand">E-cart</a>

	  <div class="collapse navbar-collapse" id="navbarToggler">
	    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
	      <li class="nav-item">
	        <a class="nav-link" href="InvestorDashboard.jsp">Home <span class="sr-only">(current)</span></a>
	      </li>
	      
	      <li class="nav-item" id="contact">
	        <a class="nav-link" href="Orders.jsp">Orders</a>
	      </li>
	    </ul>        
	     
	     <button class="btn btn-primary"><a href="/E-cart/logout.jsp" style="text-decoration:none;color:white">Logout</a></button>
	     

	  </div>
	</nav>
	<br>
	<form action="" method="post">
	<div class="container">
		<div class="jumbotron">
			<div class="form-group">
				<h3>Place order</h3>
				<label>Product ID : </label>
				<input type="text" class="form-control" name="prodid" placeholder="<%=prodid%>" readonly>
				<label>Investor ID : </label>
				<input type="text" class="form-control" name="email" placeholder="<%=email%>" readonly>
				<label>Start date</label>
				<input class="form-control" type="date" name="startdate" />
				<label>End date</label>
				<input class="form-control" type="date" name="enddate"/>
				<label>Quantity</label>
				<input class="form-control" type="text" name="quantity"/>
				<label>Specify any requirement</label>
				<textarea rows="3" class="form-control" name="req"></textarea>
				<label>Payment mode</label>
				<select class="form-control" name="payment">
					<option>..</option>
					<option value="online">Online</option>
					<option value="offline">Offline</option>
				</select><br>
				<button class="btn btn-primary" name="orderbtn">Confirm</button>
			</div>
		</div>
	</div>
</form>
<%

	if(request.getParameter("orderbtn")!=null){
		ServletContext cn=getServletContext();
		try{
			
			Connection cn1=(Connection)cn.getAttribute("mycon");
			PreparedStatement stmt=cn1.prepareStatement("insert into investororder values(?,?,?,?,?,?,?,?,?)");  
		
			DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");  
			   LocalDateTime now = LocalDateTime.now();  
			   String orderid=email+dtf.format(now);
			stmt.setString(1,orderid);//1 specifies the first parameter in the query  
			stmt.setString(2,prodid);
			stmt.setString(3,email);
			stmt.setString(4, request.getParameter("startdate"));
			stmt.setString(5,request.getParameter("enddate"));
			stmt.setString(6,request.getParameter("quantity"));
			stmt.setString(7,request.getParameter("req"));
			stmt.setString(8,request.getParameter("payment"));
			int seller= prodid.indexOf(".com");
			stmt.setString(9,prodid.substring(0,seller+4));
			int v=stmt.executeUpdate();
			
			
		}
		catch(Exception e){
			e.getMessage();
		}
	}
%>



<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


</body>
</html>