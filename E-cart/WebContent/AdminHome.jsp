<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<title>E-cart admin</title>
<style>
.sidenav {
  height: 100%; /* Full-height: remove this if you want "auto" height */
  width: 160px; /* Set the width of the sidebar */
  position: fixed; /* Fixed Sidebar (stay in place on scroll) */
  z-index: 1; /* Stay on top */
  top: 0; /* Stay at the top */
  left: 0;
  background-color: #111; /* Black */
  overflow-x: hidden; /* Disable horizontal scroll */
  padding-top: 20px;
}

/* The navigation menu links */
.sidenav a {
  padding: 6px 8px 6px 16px;
  text-decoration: none;
  font-size: 18px;
  color: #818181;
  display: block;
}

/* When you mouse over the navigation links, change their color */
.sidenav a:hover {
  color: #f1f1f1;
}

/* Style page content */
.main {
  margin-left: 400px; /* Same as the width of the sidebar */
  padding: 0px 10px;
}

/* On smaller screens, where height is less than 450px, change the style of the sidebar (less padding and a smaller font size) */
@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}
</style>
</head>
<body>
<div class="sidenav">
	<a href="AdminHome.jsp">Home</a>
  <a href="GetQueries.jsp">Get Queries</a>
  <a href="Approve.jsp">Approve featured project</a>
  
</div>
<div class="logout" style="float:right;padding:5px">
<form action="logout.jsp">
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