<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<style type="text/css">
.container {
	border-radius: 5px;
	background-color: #a0c99770;
	padding: 20px;
}

input[type=submit] {
	background-color: #1E90FF;
	color: white;
	padding: 12px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}
input[type=text]{
	
	width: 100%;
	padding: 12px; 
	border: 1px solid #ccc; 
	border-radius: 4px; 
	margin-top: 3px;
	margin-bottom: 3px;
}
input[type=email]{
	
	width: 100%;
	padding: 12px; 
	border: 1px solid #ccc; 
	border-radius: 4px; 
	margin-top: 3px;
	margin-bottom: 3px;
}
input[type=password]{
	
	width: 100%;
	padding: 12px; 
	border: 1px solid #ccc; 
	border-radius: 4px; 
	margin-top: 3px;
	margin-bottom: 3px;
}

input[type=submit]:hover {
	background-color: #4169E1;
}

input[type=date], select {
	width: 100%;
	padding: 12px; 
	border: 1px solid #ccc; 
	border-radius: 4px; 
	margin-top: 3px;
	margin-bottom: 3px;
}
.header1{
    font-weight:bold;
    margin-bottom:15px; 
    color:white; 
    padding-left:550px;
}
</style>
</head>
<body >
		<header >
		
			<nav class="navbar navbar-inverse">
			
				<div class="container-fluid">
				   
					<ul class="nav navbar-nav navbar-right">
						
						<li><a href="Login.jsp">Login</a></li>
					</ul>
					<h3 class="header1">WELCOME</h3>
				</div>
			</nav>
		</header>

		<div align="center" class="container"  style="width:864px;height:500px;background-color:#a0c99770">
			<form action="search" method="post">
				<table class="w3-table w3-striped w3-border">
					
		<tr>
        <td>
            Username:
        </td>
       
        <td>
            <input type="text" id="username" placeholder="Enter username">
        </td>
    </tr><br>
    <tr>
    <td>
    	Email:
    	</td>
    	<td>
    	 <input type="email" id="email" name="email" placeholder="Enter your Email">
    	 </td>
    	 </tr><br>
					<tr>					
					<td>
            Password:
        </td>
        <td>
            <input type="password" id="txtPassword" placeholder="Enter password"/>
        </td>
   		 </tr><br>
					 <tr>
        			<td>
           	 			Confirm Password:
        			</td>
       				 <td>
           				 <input type="password" id="txtConfirmPassword" placeholder="Enter password Again" />
       		 </td><br>
   			 </tr>
					<tr>
						<td> Date Of Birth :</td>
						<td><input type="date" name="date" /></td>
					</tr>
					
					<tr>
						<td>Role :</td>
						<td><select name="Role">
								<option value="1">Buyer</option>
								<option value="2">Shop-Owner</option>
								<option value="3">Investor</option>
						</select></td>
					</tr>
					<tr>
						<td></td>
						<td align="right"><input type="submit" name="bt1" value="Register" /></td>
					</tr>
				</table>
			</form>
		</div>

</body>
</html>