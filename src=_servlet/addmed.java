package servlet;

import java.io.*;  
import java.sql.*;  

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;  
import javax.servlet.http.*;

public class addmed extends HttpServlet {
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
	{
		String name = req.getParameter("name");
		String content = req.getParameter("content");
		String benefit = req.getParameter("benefit");
		String side = req.getParameter("side");
		String quantity = req.getParameter("num");
		String price = req.getParameter("price");
		String status=req.getParameter("user");
		
		 PrintWriter out = res.getWriter(); 
			try{  
		    	  Class.forName("com.mysql.jdbc.Driver");    
		    Connection con=DriverManager.getConnection(  
		    		   "jdbc:mysql://localhost:3306/clinic-db","root","123");
		    
		    PreparedStatement ps=con.prepareStatement("insert into medicine values (?,?,?,?,?,?,?)");  
		         
		        ps.setString(1,name); 
		        ps.setString(2,content); 
		        ps.setString(3,benefit); 
		        ps.setString(4,side);
		        ps.setString(5,quantity);
		        ps.setString(6,price);
		        ps.setString(7,status);
		        
		        ps.executeUpdate(); 
		        
		    				
			}catch (Exception e2) {
				//System.out.println(e2);
				RequestDispatcher rd = req.getRequestDispatcher("error.jsp");
	        	req.setAttribute("error","102: "+e2.getMessage());
	        	rd.forward(req, res);
	        	}  

			out.println("<html><title>Sign Up</title><body><br><center> <h1>Add Medicine</h1><hr color='blue' size=5><h2>You have successfully Added Medicine :"+name +" in to Stock !!</h2></center>");  
		    out.println("<input type=button onClick=location.href='home.html' value='Go Home'></body></html>");     
		    out.close();
			
			}
		
}
	
