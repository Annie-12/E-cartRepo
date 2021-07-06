<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="/E-cart/Css/AdminPages.css" type="text/css" >
<title>E-cart admin</title>

</head>
<body>
<div class="sidenav">
	<a href="AdminHome.jsp">Home</a>
  <a href="GetQueries.jsp?page=1">Get Queries</a>
  <a href="Approve.jsp">Approve featured project</a>
  
</div>
<div class="logout" style="float:right;padding:5px">
<form action="/E-cart/logout.jsp">
	<input type="submit" class="btn btn-primary" name="logoutbtn" value="Logout"/></form>
</div>

<!-- Page content -->
<br>

<%
		ServletContext cn=getServletContext();
	   try{
		   Connection cn1=(Connection)cn.getAttribute("mycon");
			Statement st1=cn1.createStatement();
			Statement st2=cn1.createStatement();
			ResultSet rs=st1.executeQuery("select * from user");
			
			%>
			<div align="center" style="padding-top:100px">
        	<table border="1" cellpadding="5">
            	<caption><h2>List of users</h2></caption>
	            <tr bgcolor="#007bff">
	               
	                <th>Email</th>
	                <th>Name</th>
	                <th>Date of birth</th>
	                <th>Role</th>
	            </tr>
            <%
            	while(rs.next()){%>
            		<tr >
    				<td><%=rs.getString(1)%></td>
    				<td><%=rs.getString(2) %></td>
    				<td><%=rs.getDate(4) %></td>
    				
    				<td><%=rs.getString(5) %></td>


    				</tr>

            <%	}%>
           
            </table>
            </div>
							 
			
	 <%  }catch(Exception e)
	   {
		   e.getMessage();
	   }
	   %>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</body>
</html>