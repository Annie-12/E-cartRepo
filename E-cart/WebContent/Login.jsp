<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  isELIgnored="false" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1" charset="ISO-8859-1">
<title>Login</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
  
<style>
input[type=text], select {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 5px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

input[type=password], select {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

input[type=submit] {
	width: 15%;
	background-color: White;
	color: black;
	width: 80px;
}
Body {  
  font-family: Calibri, Helvetica, sans-serif;  
  }  
button {   
         
       width: 100%;  
       
        padding: 15px;   
        margin: 10px 0px;   
        border: none;   
        cursor: pointer;   
 }
         }   
 form {   
        border: 3px solid #f1f1f1;   
    }   
</style>
</head>

<body> 
   <%String show=(String)request.getAttribute("show"); if(show!=null && show.equals("show")) {%>
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            <strong> ${message} </strong>
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
            </button>
     </div> <%} %>        
	<br><br><br><br><br><br>
	<div align="center" class="container"  style="width:600px;height:400px;">
			
	<form action="login">  
		<table align="center" width="600">
			<tr>
				<td bgcolor=#40E0D0></td>
				<td bgcolor=#40E0D0 size="50">
								<b>Login</b></td>
			</tr>
			<tr >
				<th align="left">UserName:</th>
				<td><font color="red"></font><input type="text"
					name="username" required></td>
			</tr>
			<tr>
				<th align="left">Password:</th>
				<td><font color="red"></font><input type="password"
					name="password" required></td>
			</tr>
			
			<tr>
				<th></th>
				<td colspan="1" align="left"><font color="blue"><a
						href="forget.jsp"> Forgot Password?</a></font></td>
						
			</tr>
			
			<th></th>
						<td colspan="1" align="left"><font color="blue">
						<a href="Registration.jsp">New User Register</a></font></td>
			</tr>
			
			
			<tr>
				<td colspan="2" align="right" bgcolor=#40E0D0><input
					type="submit" value="Log in"></td>
		</table>

	</form>
	</div>
	<br />
	
	
	
	
</body>
</html>