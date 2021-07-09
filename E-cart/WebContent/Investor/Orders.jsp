<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Investor</title>
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
<div class="container" style="width:50%">
<%



ServletContext cn=getServletContext();
try{
	
	Connection cn1=(Connection)cn.getAttribute("mycon");
	Statement st1=cn1.createStatement();
	//select * from order,prod where (order.prodid=prod.id) and (prod.owner = "email");
	ResultSet rs=st1.executeQuery("select * from investororder where investorid = '"+email+"'");
	int size=0;
	while(rs.next()){%>
		
		
<div class="card bg-light" >
  <div class="card-header" id="pid<%=rs.getString(1) %>">  Product Id: <%= rs.getString(2) %> </div>
  	<div class="card-body">
    <p class="card-text" id="dt<%=rs.getString(1) %>"> Start-date: <%=rs.getString(4) %> End-date : <%=rs.getString(5) %></p>
    <p class="card-text" id="spec<%=rs.getString(1) %>">Specification : <%=rs.getString(7) %>
    <p class="card-text" id="q<%=rs.getString(1) %>">Quantity : <%=rs.getString(6) %></p>
    </div>
  	<footer class="blockquote-footer">Payment method : <cite title="Source Title" id="pay<%=rs.getString(1) %>"> <%=rs.getString(8) %></cite></footer>
  
  <button id="btn<%=rs.getString(1) %>" onClick="reply_click(this.id)" class="btn btn-secondary">Download</button>
  </div>
  
	<br>	
<%	}
	
}
catch(Exception e){
	System.out.println(""+e.getMessage());
}
%>
</div>	
  


<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script>

function download(file, text) {
	
	//creating an invisible element
	var element = document.createElement('a');
	element.setAttribute('href',
	'data:text/plain;charset=utf-8, '
	+ encodeURIComponent(text));
	element.setAttribute('download', file);

	// Above code is equivalent to
	// <a href="path of file" download="file name">

	document.body.appendChild(element);

	//onClick property
	element.click();

	document.body.removeChild(element);
}
function reply_click(clicked_id)
{
    var abc=clicked_id.substring(3);
    
	var text = document.getElementById("pid"+abc).innerHTML+document.getElementById("dt"+abc).innerHTML+"\n"
	
	+document.getElementById("spec"+abc).innerHTML+document.getElementById("q"+abc).innerHTML+"\n  payment :"+
	document.getElementById("pay"+abc).innerHTML;
	var filename = "pledge-identifier.txt";

	download(filename, text);
}

</script>
</body>
</html>