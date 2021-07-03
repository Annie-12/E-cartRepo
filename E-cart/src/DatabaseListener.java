import java.sql.*;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.ServletRequestListener;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionListener;

/**
 * Application Lifecycle Listener implementation class DatabaseListener
 *
 */
@WebListener
public class DatabaseListener implements ServletContextListener, HttpSessionListener, ServletRequestListener {

    /**
     * Default constructor. 
     */
    public DatabaseListener() {
        // TODO Auto-generated constructor stub
    }


	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    ServletContext cnf;
    public void contextInitialized(ServletContextEvent e)  { 
         // TODO Auto-generated method stub
    	cnf=e.getServletContext();
    	try {
    		Class.forName("com.mysql.jdbc.Driver");
    		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ecart","root","Smur@67");
			cnf.setAttribute("mycon", con);
    	}catch(Exception e1)
    	{
    		e1.printStackTrace();
    	}
    }

	
	
}
