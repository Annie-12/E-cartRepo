<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Seller - Get orders</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="/E-cart/Css/AdminPages.css" type="text/css" >
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
<div class="sidenav">
	<a href="SellerDashboard.jsp">Dashboard</a>
  <a href="GetOrders.jsp">Orders</a>
  <a href="SellerProfile.jsp">Profile</a>
  
</div>
<div class="logout" style="float:right;padding:5px;">
	
	<form action="/E-cart/logout.jsp">
	<input type="button" class="btn btn-outline-secondary" name="Add Product" value="Add product" onclick="window.location='UploadProduct.jsp'"/>
	<input type="submit" class="btn btn-primary" name="logoutbtn" value="Logout"/></form>
</div>
<div class="container" style="margin-left:200px;padding-top:100px">
<%



ServletContext cn=getServletContext();
try{
	
	Connection cn1=(Connection)cn.getAttribute("mycon");
	Statement st1=cn1.createStatement();
	//select * from order,prod where (order.prodid=prod.id) and (prod.owner = "email");
	ResultSet rs=st1.executeQuery("select * from ordertable where sellerid = '"+email+"'");
	int size=0;
	while(rs.next()){%>
		
		
			<div class="card bg-light" >
  <div class="card-header">Order id : <%= rs.getString(1)%> ,  Product Id: <%= rs.getString(2) %> </div>
  	<div class="card-body">
    <p class="card-text">Ordered by : <%=rs.getString(3) %> Status: <%=rs.getString(5) %></p>
    <div style="float:right;margin-top:-30px">
    <%
    	if(rs.getString(5).equals("ordered")){%>
    		<a class="btn btn-outline-warning" href="EditOrder.jsp?orderid=<%=rs.getString(1)%>">Change Status</a>
    	<%}
    %>
    </div>
  	<footer class="blockquote-footer">Ordered on: <cite title="Source Title"> <%=rs.getString(6) %></cite></footer>
  </div>
  </div>
		
<%	}
	
}
catch(Exception e){
	System.out.println(""+e.getMessage());
}
%>
<div>
<h3>Featured orders</h3>
<%



ServletContext cn3=getServletContext();
try{
	
	Connection cn1=(Connection)cn3.getAttribute("mycon");
	Statement st1=cn1.createStatement();
	//select * from order,prod where (order.prodid=prod.id) and (prod.owner = "email");
	ResultSet rs=st1.executeQuery("select * from investororder where SellerId = '"+email+"'");
	int size=0;
	while(rs.next()){%>
		
		
			<div class="card bg-light" >
  <div class="card-header">Order id : <%= rs.getString(1)%> ,  Product Id: <%= rs.getString(2) %> </div>
  	<div class="card-body">
    <p class="card-text">Ordered by : <%=rs.getString(3) %> End date: <%=rs.getString(5) %></p>
    
  	<footer class="blockquote-footer">Quantity: <cite title="Source Title"> <%=rs.getString(6) %></cite></footer>
  </div>
  </div>
		
<%	}
	
}
catch(Exception e){
	System.out.println(""+e.getMessage());
}
%>
</div>
	
  
</div>

</body>
</html>