<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
    <%@page import="java.io.OutputStream"%>
    <%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Seller-Dashboard</title>
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
<table class="table table-hover" style="width:120%">
    <thead>
      <tr>
      	<th>Product Id</th>
      	<th>Image</th>
        <th>Name</th>
        <th>Description</th>      
        <th>Status</th>
        <th>Price</th><th></th><th></th>
      </tr>
    </thead>
    
    <%
    String email=(String)session.getAttribute("email");
    
    ServletContext cn=getServletContext();
	try{
		
		Connection cn1=(Connection)cn.getAttribute("mycon");
		Statement st1=cn1.createStatement();
		ResultSet rs=st1.executeQuery("select * from product where Owner='"+email+"'");
		while(rs.next()){	
			
			Blob blob = rs.getBlob(8);
			
	       byte byteArray[] = blob.getBytes(1, (int)blob.length());
	       String encoded= Base64.getEncoder().encodeToString(byteArray);
	       String pic="data:image/jpg;base64,"+encoded;%>
	       
	       <tr><td><%=rs.getString(1)%></td><td><img src="<%=pic%>" width="50" height="50"></td>
	     
	      <%
	      out.write("<td>"+rs.getString(2)+"</td><td style='width:40%'>"+rs.getString(3)+"</td><td>"+rs.getString(4)+"</td><td>"+rs.getString(5)+"</td><td><a href='EditProduct.jsp?prodid="+rs.getString(1) +"'>Change Status</a></td><td><a href='DeleteProduct.jsp?prodid="+rs.getString(1) +"'>Delete</a></td>");
	        
	      // os.flush();
       // os.close();}
	}}
	catch(Exception e){
		e.getStackTrace();
	}
	%>
    	
   
     
  </table>
  
  </div>
  
</body>
</html>