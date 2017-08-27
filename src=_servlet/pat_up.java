package servlet;

import java.io.*;  
import java.sql.*;  

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;  
import javax.servlet.http.*;  
      
    public class pat_up extends HttpServlet {  
    	public void doPost(HttpServletRequest request, HttpServletResponse response)  
                throws ServletException, IOException {  
      
    response.setContentType("text/html");  
    PrintWriter out = response.getWriter();  
    int i=0,j=0;          
   
    String lname=request.getParameter("lname");  
    String mail=request.getParameter("mail");  
    String phone=request.getParameter("phone");
    String age=request.getParameter("age");
    String status=request.getParameter("status");
    String job=request.getParameter("job");
 
    String user=request.getParameter("user"); 
    String password=request.getParameter("password"); 
    String acnt=request.getParameter("acnt"); 
   
    Connection con=null;
    PreparedStatement ps= null;
  if(acnt.equals("No")){
    try{  
    	  Class.forName("com.mysql.jdbc.Driver");    
    con=DriverManager.getConnection(  
    		   "jdbc:mysql://localhost:3306/clinic-db","root","123");
    ps=con.prepareStatement("UPDATE patient SET lname=?,mail=?,phone=?,password=?,age=?,status=?,job=? WHERE user=? ");     
    ps.setString(1,lname);  
    ps.setString(2,mail);  
    ps.setString(3,phone);
    ps.setString(4,password);
    ps.setString(5,age);
    ps.setString(6,status);
    ps.setString(7,job);
    ps.setString(8,user);              
    i=ps.executeUpdate();  
 
    if(i>0)
    {out.print("<html><title>Sign Up</title><body><br><center> <h1>Profile Updation</h1><hr color='blue' size=3><h2>You've successfully Updated your account !!</h2></center>");  
     out.print("<input type=button onClick=location.href='home.html' value='Go Home'></body></html>");     
    } 
    else{
    	out.print("<html><title>Sign Up</title><body><br><center> <h1>Profile Updation</h1><hr color='blue' size=3><h2>Updation Failed !!</h2></center>");  
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
  }        
  else if(acnt.equals("Yes"))
  {
	  try{  
    	  Class.forName("com.mysql.jdbc.Driver");    
    con=DriverManager.getConnection(  
    		   "jdbc:mysql://localhost:3306/clinic-db","root","123");
    
     ps=con.prepareStatement("DELETE FROM patient WHERE user=?");  
     
    ps.setString(1,user);  
    j=ps.executeUpdate();  
 
    if(j>0)
    { out.print("<html><title>Sign Up</title><body><br><center> <h1>Profile Updation</h1><hr color='blue' size=3><h2>You've successfully Deleted your account !!</h2></center>");  
      out.print("<input type=button onClick=location.href='home.html' value='Go Home'></body></html>");     
    } 
    else{
    	out.print("<html><title>Sign Up</title><body><br><center> <h1>Profile Updation</h1><hr color='blue' size=3><h2>Deletion Failed !!</h2></center>");  
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
  }   
  out.close();  
   
    } 
      
    }  
