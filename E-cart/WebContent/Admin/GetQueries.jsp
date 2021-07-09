<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="java.util.*,db.*,beans.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Get queries</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="/E-cart/Css/AdminPages.css" type="text/css" >
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
<div style="padding-left:350px;padding-top:70px">
<h3>Queries</h3>	 
<%  
String spageid=request.getParameter("page");  
int pageid=Integer.parseInt(spageid); 
int navpageid=pageid;
int total=2;  
if(pageid==1){}  
else{  
    pageid=pageid-1;  
    pageid=pageid*total+1;  
}  
List<Query> list=QueryDB.getRecords(pageid,total);  
int totalQueries= QueryDB.getTotalQueries();

int noofpages=totalQueries/total+(totalQueries%total==0?0:1);
out.print("<div>");
 
for(Query q:list){  
	out.print("<div class='card border-info mb-3' style='max-width= 18rem;width:80%'> <div class='card-header'>Email : "+q.getEmail()+"</div>");
	  out.print("<div class='card-body text-info' ");
	    out.print("<p class='card-text'>"+q.getQuery()+"</p></div></div>");
    //out.print("<tr><td>"+q.getEmail()+"</td><td>"+q.getName()+"</td><td>"+q.getQuery()+"</td></tr>");  
}  
out.print("</div>");

%>  

 <br>
 <nav aria-label="Page navigation example">
  <ul class="pagination">
  <% if(navpageid>1){%>
    <li class="page-item">
      <a class="page-link" href="GetQueries.jsp?page=<%= navpageid -1 %>" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
        <span class="sr-only">Previous</span>
      </a>
    </li> <%} %>
    <li class="page-item active"><a class="page-link" href="GetQueries.jsp?page=<%= navpageid  %>"><%= navpageid %></a></li>
    <% if(navpageid<noofpages){ %>
    <li class="page-item">
      <a class="page-link" href="GetQueries.jsp?page=<%= navpageid +1 %>" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
        <span class="sr-only">Next</span>
      </a><% } %>
    </li>
  </ul>
</nav>
</div>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</body>
</html>