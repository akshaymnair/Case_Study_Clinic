package servlet;

import java.io.*;  
import java.sql.*;  

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;  
import javax.servlet.http.*;  
      
    public class user extends HttpServlet {  
    	public void doPost(HttpServletRequest request, HttpServletResponse response)  
                throws ServletException, IOException {  
      
    response.setContentType("text/html");  
    PrintWriter out = response.getWriter();  
    int i=0;          
    String fname=request.getParameter("fname");  
    String lname=request.getParameter("lname");  
    String mail=request.getParameter("mail");  
    String phone=request.getParameter("phone"); 
    String role=request.getParameter("role"); 
    String user=request.getParameter("user"); 
    if(user.equals("")) user=null;
   
    String password=request.getParameter("password"); 
    
   
    Connection con=null;
    PreparedStatement ps= null;
    try{  
    	  Class.forName("com.mysql.jdbc.Driver");    
    con=DriverManager.getConnection(  
    		   "jdbc:mysql://localhost:3306/clinic-db","root","123");
    
     ps=con.prepareStatement("insert into "+role+" values(?,?,?,?,?,?)");  
      
    ps.setString(1,fname);  
    ps.setString(2,lname);  
    ps.setString(3,mail);  
    ps.setString(4,phone);
    ps.setString(5,user);
    ps.setString(6,password);
              
    i=ps.executeUpdate();  
 
    if(i>0)
    {
    	out.print("<html><title>Sign Up</title><body><br><center> <h1>User Sign Up</h1><hr color='blue' size=5><h2>You are successfully registered !!</h2></center>");  
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
