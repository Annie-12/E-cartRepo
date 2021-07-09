

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginFilter
 */
@WebServlet("/loginfilter")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String email=(String)request.getParameter("email");
		String ps=(String)request.getParameter("password");
		String psw="",ty="";
		HttpSession ses=request.getSession();
		ServletContext cn=getServletContext();
		try{
			Connection cn1=(Connection)cn.getAttribute("mycon");
			PreparedStatement pr=cn1.prepareStatement("select password, role from user where Email= ?");
			String typ="Admin";
			pr.setString(1,email);
			ResultSet rs=pr.executeQuery();
			if(rs.next()){
				
				psw=rs.getString(1);
				ty=rs.getString(2);
				if(psw.equals(ps)){
					ses.setAttribute("email", email);
					ses.setAttribute("ps", ps);
					switch(ty) {
					case "Admin":
						response.sendRedirect("/E-cart/Admin/AdminHome.jsp");
						break;
					case "Seller":
						response.sendRedirect("/E-cart/Seller/SellerDashboard.jsp");
						break;
					
					case "Buyer":
						response.sendRedirect("/E-cart/Buyer/BuyerDashboard.jsp");
						break;
					case "Investor":
						response.sendRedirect("/E-cart/Investor/InvestorDashboard.jsp");
						break;
					}
					
					
				}
				else
				{
					out.write("<script>alert('password mismatch');window.location.href='/E-cart/';</script>");
							
					//response.sendRedirect("/E-cart/");
					
				}
			}
			else {
				
				
			}
			
		}catch(Exception e1){
			System.out.println("in catchh");
			e1.printStackTrace();
		}
	}

}
