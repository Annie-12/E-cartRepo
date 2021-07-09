package db;
import beans.*;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;  

import java.sql.*;

public class ProductsDb {
	public static Connection getConnection(){  
        Connection con=null;  
        try{  
            Class.forName("com.mysql.jdbc.Driver");  
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ecart","root","Smur@67");  
        }catch(Exception e){System.out.println(e);}  
        return con;  
    }  
  
    public static List<Products> getProducts(){  
        List<Products> list=new ArrayList<Products>();  
        try{  
            Connection con=getConnection();  
            PreparedStatement ps=con.prepareStatement(  
            		"select * from product where FeaturedProduct='on'");  
            ResultSet rs=ps.executeQuery();  
            while(rs.next()){  
                Products p=new Products();
                p.setId(rs.getString(1));
                p.setName(rs.getString(2));
                p.setDesc(rs.getString(3));
                p.setStatus(rs.getString(4));
                p.setPrice(rs.getString(5));
                p.setOwner(rs.getString(6));
                Blob blob = rs.getBlob(8);
    			
     	       byte byteArray[] = blob.getBytes(1, (int)blob.length());
     	       String encoded= Base64.getEncoder().encodeToString(byteArray);
     	       String pic="data:image/jpg;base64,"+encoded;
     	       p.setLocation(pic);
                list.add(p);  
            }  
            con.close();  
        }catch(Exception e){System.out.println(e);}  
        return list;  
    }  
}
