<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Seller - Edit order</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="/E-cart/Css/AdminPages.css" type="text/css" >
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
<%
	String orderid=(String)request.getParameter("orderid");
%>
<br><br>
<form >
	<div class="container">
		<div class="jumbotron">
			<div class="form-group">
				<h1 class="display-4 pb-4">Order Status</h1>
				<label>Product Id</label><br>
				<input type="text" class="form-control" name="orderid" placeholder="<%=orderid%>" value="<%=orderid %>" readonly> <br>
				 
				<select class="form-control" name="status">
								<option>..</option>
								<option value="ordered">Ordered</option>
								<option value="delivered">Delivered</option>
				</select><br>
				<input type="submit" name="sb3" class="btn btn-primary" value="Change Status"/>
			</div>
		</div>
	</div>
</form>
<%
	if(request.getParameter("sb3")!=null){
		String state=request.getParameter("status");
		ServletContext cn=getServletContext();
		orderid=request.getParameter("orderid");
	
		try{
			
			Connection cn1=(Connection)cn.getAttribute("mycon");
			Statement stmt = cn1.createStatement();
			String sql = "UPDATE ordertable SET status = '"+state+"' WHERE orderid = '"+orderid+"'";
		    int editState=stmt.executeUpdate(sql);
		    if(editState>0){
		    	out.write("<script type='text/javascript'>alert('Updated the order')</script>");
		    	
		    }
		    else{
		    	out.write("<script type='text/javascript'>alert('Could not update your order')</script>");
		    }
		    response.sendRedirect("GetOrders.jsp");
		}
		catch(Exception e){
			
		}
	}
%>

</body>
</html>