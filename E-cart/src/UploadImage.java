

import java.io.IOException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UploadImage
 */
@WebServlet("/uploadImage")
@MultipartConfig(maxFileSize = 16177216)
public class UploadImage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadImage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String connectionURL = "jdbc:mysql://localhost:3306/ecart";
		String user = "root";
		String pass = "Smur@67";
		 
		int result = 0;
		Connection con = null;
		Part part = req.getPart("image");
		 
		if(part != null){
		try{
		Class.forName("com.mysql.jdbc.Driver");
		    con = DriverManager.getConnection(connectionURL, user, pass);
		    
		    PreparedStatement ps = con.prepareStatement("insert into data values(?,?)");
		    InputStream is = part.getInputStream();
		    ps.setInt(1, 0);
		    ps.setBlob(2, is);
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
		if(result > 0){
		     resp.sendRedirect("result.jsp?message=Image+Uploaded");
		    }
		else{
		resp.sendRedirect("result.jsp?message=Some+Error+Occurred");
		};
	}

}
