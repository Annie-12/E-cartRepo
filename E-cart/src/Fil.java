

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

/**
 * Servlet Filter implementation class Fil
 */
@WebFilter("/Fil")
public class Fil implements Filter {

    /**
     * Default constructor. 
     */
    public Fil() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here

		// pass the request along the filter chain
		String nm=request.getParameter("t7");
		String ps=request.getParameter("t8");		
		String psw="";
		PrintWriter out=response.getWriter();
	
		try{
			Class.forName("com.mysql.jdbc.Driver");
    		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/projects","root","Ananya@12");
			PreparedStatement pr=con.prepareStatement("select password from user where Email= ?");
			//String typ="Admin";
			pr.setString(1,nm);
			ResultSet rs=pr.executeQuery();
			if(rs.next()){
				psw=rs.getString(1);
				out.write(""+nm);
				if(psw.equals(ps)){
					
					
					chain.doFilter(request, response);
				}
				else
				{
					RequestDispatcher rq=request.getRequestDispatcher("home.jsp");
					rq.forward(request, response);
				
					
				}
			}
			
		}catch(Exception e1){
			e1.printStackTrace();
		}
		
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
