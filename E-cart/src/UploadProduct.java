

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.*;
 import javax.servlet.http.Part;

import javax.servlet.ServletException;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UploadProduct
 */
@WebServlet("/uploadProduct")
@MultipartConfig(maxFileSize = 16177216)
public class UploadProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadProduct() {
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
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		resp.setContentType("text/html");
		PrintWriter out=resp.getWriter();
		String connectionURL = "jdbc:mysql://localhost:3306/ecart";
		String user = "root";
		String pass = "Smur@67";
		 
		int result = 0;
		Connection con = null;
		
		Part part = req.getPart("prodImage");
		 
		if(part != null){
		try{
		Class.forName("com.mysql.jdbc.Driver");
		
		String owner= req.getParameter("owner");
		String prodId=owner+req.getParameter("prodId");
		String prodName=req.getParameter("prodName");
		String prodDesc=req.getParameter("prodDesc");
		String prodState=req.getParameter("prodState");
		String prodPrice=req.getParameter("prodPrice");
		String featured=(String)req.getParameter("featured");
		
		    con = DriverManager.getConnection(connectionURL, user, pass);
		    
		    PreparedStatement ps = con.prepareStatement("insert into product values(?,?,?,?,?,?,?,?)");
		    ps.setString(1, prodId);
		    ps.setString(2, prodName);
		    ps.setString(3,prodDesc);
		    ps.setString(4, prodState);
		    ps.setString(5, prodPrice);
		    ps.setString(6, owner);
		    ps.setString(7, featured);
		    InputStream is = part.getInputStream();
		    ps.setBlob(8, is);
		    result = ps.executeUpdate();
		   
		}
		catch(Exception e){
		e.printStackTrace();
		}
		finally{
		if(con != null){
		try{
		con.close();
		}
		catch(Exception e){
		e.printStackTrace();
		
		}
		}
		}
		}
		else {
			out.write("<script>alert('Upload a sample picture of the item')</script>");
			resp.sendRedirect("/E-cart/Seller/UploadProduct.jsp");
		}
		if(result > 0){
			out.write("<script>alert('Product uploaded')</script>");
		     resp.sendRedirect("/E-cart/Seller/SellerDashboard.jsp");
		    }
		else{
			out.write("<script>alert('Could not upload product')</script>");
			resp.sendRedirect("/E-cart/Seller/UploadProduct.jsp");
		}
		}
		

}
