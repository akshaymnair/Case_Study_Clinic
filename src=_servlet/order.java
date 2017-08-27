package servlet;

import java.io.*;  
import java.sql.*;  

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;  
import javax.servlet.http.*;

public class order extends HttpServlet {
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
	{
		String name = req.getParameter("add");
		String quantity = req.getParameter("num");
		String status=req.getParameter("use");
		
		 PrintWriter out = res.getWriter(); 
			try{  
		    	  Class.forName("com.mysql.jdbc.Driver");    
		    Connection con=DriverManager.getConnection(  
		    		   "jdbc:mysql://localhost:3306/clinic-db","root","123");
		    
		    PreparedStatement ps=con.prepareStatement("UPDATE medicine SET stock=?, status=? WHERE name=? ");  
		         
		        ps.setString(1,quantity); 
		        ps.setString(2,status); 
		        ps.setString(3,name); 
		      
		        ps.executeUpdate(); 
		        
		    				
			}catch (Exception e2) {
				//System.out.println(e2);
				RequestDispatcher rd = req.getRequestDispatcher("error.jsp");
	        	req.setAttribute("error","102: "+e2.getMessage());
	        	rd.forward(req, res);
	        	}  

			out.println("<html><title>Sign Up</title><body><br><center> <h1>Order Medicine</h1><hr color='blue' size=5><h2>You have successfully Ordered Medicine :"+name +"  !!</h2></center>");  
		    out.println("<input type=button onClick=location.href='home.html' value='Go Home'></body></html>");     
		    out.close();
			
			}
		
}
	
