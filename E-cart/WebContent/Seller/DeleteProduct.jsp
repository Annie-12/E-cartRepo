<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Seller - Edit product</title>
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
response.setHeader("Cache-Control", "no-cache,no-store,must-revalidte");
if(session.getAttribute("email")==null){
response.sendRedirect("/E-cart/");
}

%>
<%
	String prodid=(String)request.getParameter("prodid");
%>
<br><br>
<form >
	<div class="container">
		<div class="jumbotron">
			<div class="form-group">
				<h1 class="display-4 pb-4">Change Status</h1>
				<label>Product Id</label><br>
				<input type="text" class="form-control" name="prod" placeholder="<%=prodid%>" value="<%=prodid %>" readonly> <br>
				
				<button name="sb3" class="btn btn-danger" value="Delete product">Delete product</button>
				<br><cite>This cannot be undone.</cite>
			</div>
		</div>
	</div>
</form>
<%
	if(request.getParameter("sb3")!=null){
		String state=request.getParameter("status");
		ServletContext cn=getServletContext();
		String prod=request.getParameter("prod");
	
		try{
			
			Connection cn1=(Connection)cn.getAttribute("mycon");
			Statement stmt = cn1.createStatement();
			String sql = "Delete from product WHERE id = '"+prod+"'";
		    int editState=stmt.executeUpdate(sql);
		    if(editState>0){
		    	out.write("<script type='text/javascript'>alert('Deleted your product')</script>");
		    	
		    }
		    else{
		    	out.write("<script type='text/javascript'>alert('Could not delete your product')</script>");
		    }
		    response.sendRedirect("SellerDashboard.jsp");
		}
		catch(Exception e){
			
		}
	}
%>
</body>
</html>