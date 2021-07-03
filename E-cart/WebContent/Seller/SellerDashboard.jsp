<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<div class="sidenav">
	<a href="AdminHome.jsp">Dashboard</a>
  <a href="GetQueries.jsp">Orders</a>
  <a href="Approve.jsp">Products</a>
  
</div>
<div class="logout" style="float:right;padding:5px">
	<input type="button" class="btn btn-outline-secondary" name="Add Product" value="Add product" onclick="window.location='UploadProduct.jsp'"/>
	<input type="button" class="btn btn-primary" name="logoutbtn" value="Logout"/>
</div>
<div align="center" style="padding-top:100px;padding-left:300px;pading-right:100px">
<table class="table table-hover" style="width:80%">
    <thead>
      <tr>
        <th>Name</th>
        <th>Status</th>
        <th>Price</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>John</td>
        <td>Doe</td>
        <td>john@example.com</td>
      </tr>
      <tr>
        <td>Mary</td>
        <td>Moe</td>
        <td>mary@example.com</td>
      </tr>
      <tr>
        <td>July</td>
        <td>Dooley</td>
        <td>july@example.com</td>
      </tr>
    </tbody>
  </table>
  </div>
  
</body>
</html>