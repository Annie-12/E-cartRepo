package bean;
import java.sql.*;

import javax.servlet.RequestDispatcher;
public class LoginDao {
	public static boolean validate(LoginBean bean){  
		boolean status=false;  
		try{  
			
			Class.forName("com.mysql.jdbc.Driver");
    		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ecart","root","Smur@67");
    		
    		PreparedStatement ps=con.prepareStatement(  
    			    "select * from user where email=? and pass=?");  
    			  
    			ps.setString(1,bean.getEmail());  
    			ps.setString(2, bean.getPass());  
    			              
    			ResultSet rs=ps.executeQuery();  
    			status=rs.next();  
		}catch(Exception e){}  
		  
		return status;  

}}
