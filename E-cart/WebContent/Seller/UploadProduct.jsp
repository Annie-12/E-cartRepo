<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Seller-Upload product</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="/E-cart/Css/AdminPages.css" type="text/css" >
</head>
<body>
<div class="sidenav">
	<a href="SellerDashboard.jsp">Dashboard</a>
  <a href="GetOrders.jsp">Orders</a>
  <a href="SellerProfile.jsp">Profile</a>
  
</div>
<div class="logout" style="float:right;padding:5px">
	
	<form action="/E-cart/logout.jsp">
	<input type="submit" class="btn btn-primary" name="logoutbtn" value="Logout"/></form>
</div>
<div class="container" style="margin-left:200px;padding-top:100px">
	<div class="container">
		<form action="/E-cart/uploadProduct" method="post" enctype="multipart/form-data">
			  	<div class="form-group">
			    	
			    	<label for="inputEmail">Owner</label>
			      	<input class="form-control" type="email" name="owner" placeholder="<%= session.getAttribute("email") %>" value="<%=session.getAttribute("email") %>" readonly>
			  	</div>
			    <div class="form-row">
			    
			    <div class="form-group col-md-6">
			      <label for="inputPassword4">Product Id</label>
			      <input type="text" class="form-control" name="prodId" placeholder="Product Id">
			    </div>
			    <div class="form-group col-md-6">
			      <label for="inputProdName">Product Name</label>
			    	<input type="text" class="form-control" name="prodName" placeholder="Product name">
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="inputDesc">Description</label>
			    <textarea class="form-control" name="prodDesc" placeholder="Describe your product"></textarea>
			  </div>
			  <div class="form-group">
			    <label for="inputImage">Image</label>
			      <input type="file" class="form-control" name="prodImage">
			  </div>
			  <div class="form-row">
			    <div class="form-group col-md-6">
			      
			      <label for="inputProdState">Product Status</label>
			    	<select name="prodState" class="form-control">
			        <option selected>Choose...</option>
			        <option value="availabe">Available</option>
			        <option value="not availabe">Not </option>
			      </select>
			    </div>
			    <div class="form-group col-md-6">
			      <label for="inputProdPrice">Price</label>
			      <input class="form-control" name="prodPrice"/>
			    </div>
			    
			  </div>
			  <div class="form-group">
			    <div class="form-check">
			      <input class="form-check-input" type="checkbox" id="gridCheck" name="featured">
			      <label class="form-check-label" for="gridCheck">
			        Upload as featured project
			      </label>
			    </div>
			  </div>
			  <button type="submit" class="btn btn-primary">Upload</button>
			</form>
		</div>
		<%
			String email=(String)session.getAttribute("email");
			session.setAttribute("owner",email );
		%>
		
</div>
</body>
</html>