package servlet;

import java.io.*;  
import java.sql.*;  
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;  
import javax.servlet.http.*;  
      
    public class mail extends HttpServlet {  
    	public void doPost(HttpServletRequest request, HttpServletResponse response)  
                throws ServletException, IOException {  
      
    response.setContentType("text/html");  
    PrintWriter out = response.getWriter();  
    
    HttpSession session = request.getSession(true);
    String sender=(String)session.getAttribute("user");
    
    DateFormat df = new SimpleDateFormat("HH:mm:ss dd/MM/yy");
    Calendar calobj = Calendar.getInstance();
    String date=null;
    date=df.format(calobj.getTime());
        
    String receiver=request.getParameter("receiv");  
    String message=request.getParameter("msg");  
    
    Connection con=null;
    PreparedStatement ps= null;
    try{  
    	  Class.forName("com.mysql.jdbc.Driver");    
    con=DriverManager.getConnection(  
    		   "jdbc:mysql://localhost:3306/clinic-db","root","123");
    
     ps=con.prepareStatement("insert into mail values(?,?,?,?)");  
      
    ps.setString(1,sender);  
    ps.setString(2,receiver);  
    ps.setString(3,message);  
    ps.setString(4,date);
    
    ps.executeUpdate();  
 
   
    out.print("<html><title>Sign Up</title><body><br><center> <h1>Message</h1><hr color='blue' size=5><h2>Your message send successfully !!</h2></center>");  
    out.print("<input type=button onClick=location.href='home.html' value='Go Home'></body></html>");     
              
    }catch (SQLIntegrityConstraintViolationException e2) {
    	RequestDispatcher rd = request.getRequestDispatcher("error.jsp");
    	request.setAttribute("error","505: "+e2.getMessage());
    	rd.forward(request, response);
    	
    	System.out.println(e2);
    	}catch (SQLException e) {
    		RequestDispatcher rd = request.getRequestDispatcher("error.jsp");
        	request.setAttribute("error","506: "+e.getMessage());
        	rd.forward(request, response);
    	} catch(Exception e1) {
    		RequestDispatcher rd = request.getRequestDispatcher("error.jsp");
        	request.setAttribute("error","507: "+e1.getMessage());
        	rd.forward(request, response);
    	}
              
    out.close();  
   
    } 
      
    }  
