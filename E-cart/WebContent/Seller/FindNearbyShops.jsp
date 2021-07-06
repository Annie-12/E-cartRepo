<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Seller - Nearby shops</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="/E-cart/Css/AdminPages.css" type="text/css" >
  <script>
  
	  function getDistanceFromLatLonInKm(lat1,lon1,lat2,lon2) {
		  var R = 6371; // Radius of the earth in km
		  var dLat = deg2rad(lat2-lat1);  // deg2rad below
		  var dLon = deg2rad(lon2-lon1); 
		  var a = 
		    Math.sin(dLat/2) * Math.sin(dLat/2) +
		    Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * 
		    Math.sin(dLon/2) * Math.sin(dLon/2)
		    ; 
		  var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a)); 
		  var d = R * c; // Distance in km
		  return d;
		
  }
	  function deg2rad(deg) {
		  return deg * (Math.PI/180)
		}
  </script>
</head>
<body>
<div class="sidenav">
	<a href="SellerDashboard.jsp">Dashboard</a>
  <a href="GetOrders.jsp">Orders</a>
  <a href="SellerProfile.jsp">Profile</a>
  <a href="FindNearbyShops.jsp">Find nearby shops</a>
  
</div>
<div class="logout" style="float:right;padding:5px;">
	
	<form action="/E-cart/logout.jsp">
	<input type="button" class="btn btn-outline-secondary" name="Add Product" value="Add product" onclick="window.location='UploadProduct.jsp'"/>
	<input type="submit" class="btn btn-primary" name="logoutbtn" value="Logout"/></form>
</div>
<%
	String email=(String)session.getAttribute("email");
%>
<div class="container" style="margin-left:200px;padding-top:100px">
	<%
	ServletContext cn=getServletContext();
	String prod=request.getParameter("prod");

	try{
		
		Connection cn1=(Connection)cn.getAttribute("mycon");
		Statement stmt = cn1.createStatement();
		ResultSet rs=stmt.executeQuery("select zip,State from useraddress where email='"+email+"'");
		String zip="",state="";
		
		if(rs.next()){
			zip=rs.getString(1);
			state=rs.getString(2);
		}
	
		if(zip==""){
			out.write("You have not added pincode");
		}
		else{
		
			Statement stmt2 = cn1.createStatement();
			ResultSet rs2=stmt2.executeQuery("select DISTINCT * from pincodes where State = '"+state+"' or pin like '"+zip.substring(0,3)+"*'");
			
			Statement stmt3 = cn1.createStatement();
			ResultSet rs3=stmt3.executeQuery("select latitude,longitude from pincodes where pin = '"+zip+"'");
			
			double lon2=0.0;
			double lat2=0.0;
			
			while(rs3.next()){
				lat2=Double.parseDouble(rs3.getString(1));
				lon2=Double.parseDouble(rs3.getString(2));
			}
			HashMap<Double,String> mp=new HashMap<>();
			while(rs2.next()){
				double lat1=Double.parseDouble(rs2.getString(4));
				float lon1=Float.parseFloat(rs2.getString(5));
				double theta = lon1 - lon2;
				  double dist = Math.sin((lat1)*Math.PI/180.0) * Math.sin((lat2)*Math.PI/180.0) + Math.cos((lat1)*Math.PI/180.0) * Math.cos((lat2)*Math.PI/180.0) * Math.cos((theta)*Math.PI/180.0);
				  dist = Math.acos(dist);
				  dist = 180.0*(dist)/Math.PI;
				  dist = dist * 60 * 1.1515;
			System.out.println("Dis: "+dist +" l:"+lat1+" lo:"+lon2+" pin: "+rs2.getString(1));
			}
		}
	}
	catch(Exception e){
		System.out.println(e.getMessage());
		
	}
	%>
</div>
</body>
</html>