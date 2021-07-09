<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
    <%@page import="java.io.OutputStream"%>
    <%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin- All products</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
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
	<a href="AdminHome.jsp">Home</a>
  <a href="GetQueries.jsp?page=1">Get Queries</a>
  <a href="AllProducts.jsp">Products</a>
  
</div>

<div class="logout" style="float:right;padding:5px">
<form action="/E-cart/logout.jsp">
	<input type="submit" class="btn btn-primary" name="logoutbtn" value="Logout"/></form>
</div>
<div style="padding-left:160px;padding-top:70px">
<table class="table table-hover" style="width:120%">
    <thead>
      <tr>
      	<th>Product Id</th>
      	<th>Image</th>
        <th>Name</th>
        <th>Description</th>      
        <th>Status</th>
        <th>Price</th>
      </tr>
    </thead>
    
    <%
    
    
    ServletContext cn=getServletContext();
	try{
		
		Connection cn1=(Connection)cn.getAttribute("mycon");
		Statement st1=cn1.createStatement();
		ResultSet rs=st1.executeQuery("select * from product");
		while(rs.next()){	
			
			Blob blob = rs.getBlob(8);
			
	       byte byteArray[] = blob.getBytes(1, (int)blob.length());
	       String encoded= Base64.getEncoder().encodeToString(byteArray);
	       String pic="data:image/jpg;base64,"+encoded;%>
	       
	       <tr><td><%=rs.getString(1)%></td><td><img src="<%=pic%>" width="50" height="50"></td>
	     
	      <%
	      out.write("<td>"+rs.getString(2)+"</td><td style='width:40%'>"+rs.getString(3)+"</td><td>"+rs.getString(4)+"</td><td>"+rs.getString(5)+"</td>");
	        
	      // os.flush();
       // os.close();}
	}}
	catch(Exception e){
		e.getStackTrace();
	}
	%>
    	
   
     
  </table>
  
</div>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</body>
</html>