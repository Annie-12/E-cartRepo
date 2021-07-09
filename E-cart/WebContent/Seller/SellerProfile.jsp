<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="/E-cart/Css/AdminPages.css" type="text/css" >
</head>
<body>
<%
			String email=(String)session.getAttribute("email");
			session.setAttribute("email",email );
%>
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

<%
	ServletContext cn=getServletContext();
	
	try{
		Connection cn1=(Connection)cn.getAttribute("mycon");
		Statement st=cn1.createStatement();
		ResultSet rs = st.executeQuery("SELECT * FROM USERADDRESS WHERE EMAIL='"+email+"'");
		int size=0;
		while(rs.next()){
			size=size+1;
		}
		if(size==0){%>
	<div  style="padding-top:100px;padding-left:200px;pading-right:100px;">
	<form style="width:50%; background-color:#a0c99770;margin: auto;
			padding: 3rem 2rem;">
  
    <div class="form-group">
      <label for="inputEmail4">Email</label>
      <input type="email" class="form-control" id="inputEmail4" placeholder="<%=email%>" readonly>     
   </div>
  <div class="form-group">
    <label for="inputAddress">Address</label>
    <input type="text" class="form-control" id="inputAddress" placeholder="Road,street" name="add1">
  </div>
  <div class="form-group">
    <label for="inputAddress2">Address 2</label>
    <input type="text" class="form-control" id="inputAddress2" name="add2" placeholder="Apartment, studio, or floor">
  </div>
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputCity">City</label>
      <input type="text" class="form-control" id="inputCity" name="city">
    </div>
    <div class="form-group col-md-6">
      <label for="inputState">State</label>
      <input type="text" class="form-control" id="inputZip" name="state">
    </div>
    </div>
    <div class="row">

    <div class="form-group col-md-6">
      <label for="inputZip">Zip</label>
      <input type="text" class="form-control" id="inputZip" name="zip">
    </div>
        <div class="form-group col-md-6">
      <label for="inputState">Phone no</label>
      <input type="text" class="form-control" id="inputphone" name="phone">
    </div>
  </div>
  
  <input type="submit" name="sb2" class="btn btn-primary" value="Update profile"/>
</form>
</div>
		<% }
		else{
			rs = st.executeQuery("SELECT * FROM USERADDRESS WHERE EMAIL='"+email+"'");
			while(rs.next()){
			
		%>
			<div class="container" style="margin-left:250px;padding-top:100px">
				<h1 class="mt-5"> Details: </h1>
<table class="table table-hover mt-3">
  <tbody>
    <tr class="tableRows">
      <td class="left">Email</td>
      <td class="mid">:</td>
      <td class="right"><%=email %></td>
    </tr>
    <tr class="tableRows">
      <td class="left">Address Line 1</td>
      <td class="mid">:</td>
      <td class="right"><%=rs.getString(2) %></td>
    </tr>
    <tr class="tableRows">
      <td class="left">Address Line 2</td>
      <td class="mid">:</td>
      <td class="right"><%=rs.getString(3) %></td>
    </tr>
    <tr class="tableRows">
      <td class="left">City</td>
      <td class="mid">:</td>
      <td class="right"><%=rs.getString(4) %></td>
    </tr>
    <tr class="tableRows">
      <td class="left">State</td>
      <td class="mid">:</td>
      <td class="right"><%=rs.getString(5) %></td>
    </tr>
    <tr class="tableRows">
      <td class="left">Pin Code</td>
      <td class="mid">:</td>
      <td class="right"><%=rs.getString(6) %></td>
    </tr>
    <tr class="tableRows">
      <td class="left">Contact no</td>
      <td class="mid">:</td>
      <td class="right"><%=rs.getString(7) %></td>
    </tr>
  </tbody>
</table>
  
    </div>
		<%}
		}
	}
		catch(Exception e){
			e.getMessage();
		}
	
	if(request.getParameter("sb2")!=null){
		ServletContext cn2=getServletContext();
		
		try{
			Connection cn3=(Connection)cn2.getAttribute("mycon");
			Statement st=cn3.createStatement();
			
			PreparedStatement pr=cn3.prepareStatement("insert into useraddress values(?,?,?,?,?,?,?)");
			
			pr.setString(1,email );
			pr.setString(2,request.getParameter("add1"));
			pr.setString(3,request.getParameter("add2"));
			pr.setString(4,request.getParameter("city"));
			pr.setString(5,request.getParameter("state"));
			pr.setString(6,request.getParameter("zip"));
			pr.setString(7,request.getParameter("phone"));
			
			int v=pr.executeUpdate();
			if(v>0){
				out.write("<script type='text/javascript'>alert('Updated your profile')</script>");
				
			}
			else{
				out.write("<script type='text/javascript'>alert('Mistake')</script>");
			}
			out.write("<script type='text/javascript'>window.location='/E-cart/Seller/SellerProfile.jsp';</script>");
			
			
		}catch(Exception e){
			e.getStackTrace();
			String exception=e.getMessage();
			
			out.write("<script type='text/javascript'>alert('"+exception+"')</script>");
		}
	}
%>
</body>
</html>