package servlet;
import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.*;
import javax.servlet.http.*;

public class logcls extends HttpServlet {
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
	{
		String username = req.getParameter("user");
		String password = req.getParameter("password");
		String role = req.getParameter("role");
		String pass=null;
		int counter = 0;
		
		PrintWriter out = res.getWriter();
		HttpSession session = req.getSession(true);
		session.setAttribute("user", username);
		session.setAttribute("role", role);
		
		if(username != null)
		{	
			try{  
		    	  Class.forName("com.mysql.jdbc.Driver");    
		    Connection con=DriverManager.getConnection(  
		    		   "jdbc:mysql://localhost:3306/clinic-db","root","123");
		    
		    PreparedStatement ps=con.prepareStatement("select password from "+role+" where user=?");  
		         
		        ps.setString(1,username);  
		        ResultSet rs =ps.executeQuery();  
		        
		    
			while(rs.next())
				{pass = rs.getString("password"); 
				
				}
			rs.close(); 
		if(pass.equals(password))
			{
			
			RequestDispatcher rd = req.getRequestDispatcher(role+".jsp");
			rd.forward(req, res);
			 counter = 1;
			}
	
					
			}catch (Exception e2) {System.out.println(e2);}  

			}
		
		 if(counter == 0)
		{
			
	
	RequestDispatcher rd = req.getRequestDispatcher("error.jsp");
	req.setAttribute("error","404: Wrong Username Or Password !! ");
	rd.forward(req, res);
	out.close();
		}
}
	}
