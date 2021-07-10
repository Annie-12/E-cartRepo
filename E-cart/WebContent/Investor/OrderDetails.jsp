<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Investor - Print</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript">
        $("#btnPrint").live("click", function () {
            var divContents = $("#order").html();
            var printWindow = window.open('', '', 'height=400,width=800');
            printWindow.document.write('<html><head><title>Order receipt</title>');
            printWindow.document.write('</head><body >');
            printWindow.document.write(divContents);
            printWindow.document.write('<br><br><label>Order placed</label>');
            printWindow.document.write('</body></html>');
            printWindow.document.close();
            printWindow.print();
        });
    </script>
<style type="text/css">
		.jumbotron {
			background-color: #a0c99770;
			width: 50%;
			margin: auto;
			padding: 3rem 2rem;
		}
		#order h3{
			color:gray;
		}
		</style>
</head>
<body>
<%
	String orderid=(String)request.getParameter("orderid");
%>
<br>
<br>
<div class="container">
<a href='Orders.jsp'>Back</a>
</div>

<%

ServletContext cn=getServletContext();
try{
	
	Connection cn1=(Connection)cn.getAttribute("mycon");
	Statement st1=cn1.createStatement();
	//select * from order,prod where (order.prodid=prod.id) and (prod.owner = "email");
	ResultSet rs=st1.executeQuery("select * from investororder where orderId = '"+orderid+"'");
	
	if(rs.next()){ %>
<form >
	<div class="container" >
		<div class="jumbotron">
			<div class="form-group" id="order">
				<h3>Order details : <%=rs.getString(3) %> </h3><br><br>
				<label>Order Id : <%=rs.getString(1) %></label><br>
				<label>Product Id : <%=rs.getString(2) %></label><br>
				<label>Start date : <%=rs.getString(4) %></label>
				<label>End date: <%=rs.getString(5) %></label><br>
				<label>Quantity : <%=rs.getString(6) %></label><br>
				
				
			</div>
			<input type="button" id="btnPrint" class="btn btn-primary" value="Print"/>
		</div>
		
	</div>
	
</form>
	<%}
}
catch(Exception e){
	e.getMessage();
}
%>


<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</body>
</html>