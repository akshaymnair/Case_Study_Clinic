<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Supplier Page</title>
<link rel="stylesheet" type="text/css" href="style.css" />
<script type='text/javascript' src='http://vectorart.org/wp-content/themes/vector/images/jquery.js'></script> 
</head>

<body>
<%
String name=(String)session.getAttribute("user");
%>

<div id="topline">	
	<div class="content">
       <a><strong>Welcome !!</strong> <%=name %> </a>
    </div>
</div><!-- topline -->

<div id="wrapper">

    	<div class="content">
    	
             <div id="header">
                     <div id="menu">
                
                        <ul>	
                        <br></br>
                        <br></br>
                        <br></br>
                       		<li class="selected"><a href="su-mail.jsp"><font color=white>Mail</font></a></li>
                            <li class="selected"><a href="med.jsp"><font color=white>Pharmacy</font></a></li>
                            <li class="selected"><a href="stock.jsp"><font color=white>Stock & Orders</font></a></li>
                           <li class="selected"><a href="home.html"><font color=white>LogOut</font></a></li>
                        </ul>
                    
                	</div><!-- menu -->
                
             </div><!--header-->
             </div>
             </div>
             <div id="footer">
    	<div class="content">
        		
                      <center><font color=white>
                   copyright 2014 Akshay</font>
                  </center>
                                     
                   
                 </div><!--content-->
                        
</div><!--footer-->    


</body>
</html>