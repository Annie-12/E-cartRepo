<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false" import="java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration</title>
<script src="Js/main.js" type=module></script>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<style type="text/css">
.container {
	border-radius: 5px;
	background-color: #a0c99770;
	
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
		<header-h></header-h><br>

		<div align="center" class="container"  style="width:864px;height:500px;background-color:#a0c99770">
			<form method="post">
				<table class="w3-table w3-striped w3-border">
					
		<tr>
        <td>
            Name:
        </td>
       
        <td>
            <input type="text" id="name" name="name" placeholder="Enter username">
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
            <input type="password" id="txtPassword" placeholder="Enter password" name="password"/>
        </td>
   		 </tr><br>
					 <tr>
        			<td>
           	 			Confirm Password:
        			</td>
       				 <td>
           				 <input type="password" id="txtConfirmPassword" placeholder="Enter password Again" name="conpsw"/>
       		 </td><br>
   			 </tr>
					<tr>
						<td> Date Of Birth :</td>
						<td><input type="date" name="date" /></td>
					</tr>
					
					<tr>
						<td>Role :</td>
						<td><select name="Role">
								<option>..</option>
								<option value="Shop-owner">Shop-Owner</option>
								<option value="Investor">Investor</option>
						</select></td>
					</tr>
					<tr>
						<td></td>
						<td align="right"><input type="submit" name="bt1" value="Register" /></td>
					</tr>
				</table>
			</form>
		</div>
		<% 
    if(request.getParameter("bt1")!=null){
    
    	session.setAttribute("name",request.getParameter("name"));
    	if((request.getParameter("password")).equals(request.getParameter("conpsw"))){
    		session.setAttribute("ps",request.getParameter("passowrd"));
    		session.setAttribute("mail",request.getParameter("email"));
    		session.setAttribute("role",request.getParameter("Role"));
    		session.setAttribute("dob",request.getParameter("date"));
    		//response.("<script language='javascript'>window.alert('Done');window.location='URL';</script>");
    		ServletContext cn=getServletContext();
    		
    		try{
    			Connection cn1=(Connection)cn.getAttribute("mycon");
    			Statement st=cn1.createStatement();
    			
    			PreparedStatement pr=cn1.prepareStatement("insert into user values(?,?,?,?,?)");
    			
    			pr.setString(1,request.getParameter("email") );
    			pr.setString(2,request.getParameter("name"));
    			
    			pr.setString(3,request.getParameter("conpsw"));
    			
    			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");  
    			java.util.Date util_StartDate = format.parse( request.getParameter("date") );
    			java.sql.Date sql_StartDate = new java.sql.Date( util_StartDate.getTime() );
    			System.out.println(sql_StartDate);
    			pr.setDate(4,sql_StartDate);
    			pr.setString(5,request.getParameter("Role"));
    			int v=pr.executeUpdate();
    			if(v>0){
    				out.write("<script type='text/javascript'>alert('you have registered succesfully')</script>");
    				
    			}
    			else
    			{
    				out.write("<script type='text/javascript'>alert('Password mismatch')</script>");
    			}
    			out.write("<script type='text/javascript'>window.location='Login.jsp';</script>");
    			
    			
    		}catch(Exception e){
    			e.getStackTrace();
    			String exception=e.getMessage();
    			out.write("<script type='text/javascript'>alert('Insert values properly')</script>");
    		}
     }
    }
    %>
		<footer-f></footer-f>	
</body>
</html>