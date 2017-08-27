package servlet;

import java.io.*;  
import java.sql.*;  

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;  
import javax.servlet.http.*;  
      
    public class apnmnt extends HttpServlet {  
    	public void doPost(HttpServletRequest request, HttpServletResponse response)  
                throws ServletException, IOException {  
      
    response.setContentType("text/html");  
    PrintWriter out = response.getWriter();  
    int i=0;          
    String pat=request.getParameter("pat");  
    String doc=request.getParameter("doc");  
    String dt=request.getParameter("dt"); 
    String ill=request.getParameter("ill"); 
      
    Connection con=null;
    PreparedStatement ps= null;
    try{  
    	  Class.forName("com.mysql.jdbc.Driver");    
    con=DriverManager.getConnection(  
    		   "jdbc:mysql://localhost:3306/clinic-db","root","123");
    
     ps=con.prepareStatement("insert into apnmnt values(?,?,?,?)");  
     
    ps.setString(1,pat);  
    ps.setString(2,doc);  
    ps.setString(3,dt);  
    ps.setString(4,ill); 
    i=ps.executeUpdate();  
 
    if(i>0)
    {
    	out.print("<html><title>Appointment</title><body><br><center> <h1>Appointment</h1><hr color='blue' size=5><h2>You've successfully requested for Appointment !<br> Contact your Doctor for Confirmation. </h2></center>");  
    	out.print("<input type=button onClick=location.href='home.html' value='Go Home'></body></html>");     
    }          
    }catch (SQLIntegrityConstraintViolationException e2) {
    	RequestDispatcher rd = request.getRequestDispatcher("error.jsp");
    	request.setAttribute("error","101: "+e2.getMessage());
    	rd.forward(request, response);
    	
    	System.out.println(e2);
    	}catch (SQLException e) {
    		RequestDispatcher rd = request.getRequestDispatcher("error.jsp");
        	request.setAttribute("error","102: "+e.getMessage());
        	rd.forward(request, response);
    	} catch(Exception e1) {
    		RequestDispatcher rd = request.getRequestDispatcher("error.jsp");
        	request.setAttribute("error","103: "+e1.getMessage());
        	rd.forward(request, response);
    	}
              
    out.close();  
   
    } 
      
    }  
