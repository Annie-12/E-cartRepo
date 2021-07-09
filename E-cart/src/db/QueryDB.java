package db;
import beans.*;
import java.util.ArrayList;  
import java.util.List;  

import java.sql.*;

public class QueryDB {
	public static Connection getConnection(){  
        Connection con=null;  
        try{  
            Class.forName("com.mysql.jdbc.Driver");  
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ecart","root","Smur@67");  
        }catch(Exception e){System.out.println(e);}  
        return con;  
    }  
  
    public static List<Query> getRecords(int start,int total){  
        List<Query> list=new ArrayList<Query>();  
        try{  
            Connection con=getConnection();  
            PreparedStatement ps=con.prepareStatement(  
            		"select * from queries limit "+(start-1)+","+total);  
            ResultSet rs=ps.executeQuery();  
            while(rs.next()){  
                Query q=new Query(); 
                q.setEmail(rs.getString(1));
                q.setQuery(rs.getString(2));
                q.setName(rs.getString(3));
                 
                list.add(q);  
            }  
            con.close();  
        }catch(Exception e){System.out.println(e);}  
        return list;  
    }  
   public static int getTotalQueries() {
	   int size=0;

	   try{  
           Connection con=getConnection();  
            PreparedStatement ps=con.prepareStatement(  
           		"select * from queries");  
           ResultSet rs=ps.executeQuery();  
           while(rs.next()){  
               
                
               size++;  
           }  
           con.close();  
       }catch(Exception e){System.out.println(e);}  
       return size;  
   }
}
