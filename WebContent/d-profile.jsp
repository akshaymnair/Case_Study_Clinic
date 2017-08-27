<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page import="java.util.Date,java.text.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> <!-- xmlns="http://www.w3.org/1999/xhtml"-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Doctor profile</title>
<link rel="stylesheet" type="text/css" href="style.css" />
<script type='text/javascript' src='http://vectorart.org/wp-content/themes/vector/images/jquery.js'></script> 
</head>
<body>
<%
String name=(String)session.getAttribute("user");
%>
<c:set var="use" value='<%=name%>'/>

<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver" 
     url="jdbc:mysql://localhost:3306/clinic-db"
     user="root"  password="123"/>
     
 <sql:query dataSource="${snapshot}" var="result">
SELECT * from doctor where user=?;
<sql:param value= "${use}" />                           
</sql:query>

<div id="topline">	
	<div class="content">
       <a><strong>Profile: Dr. </strong> <%=name %> </a>
    </div>
</div>
<h4>&nbsp;&nbsp;&nbsp;Update Profile</h4>
<hr color='white' size=3>

<form name="regForm" action="doc_up" method="post">
<br/>
<c:forEach var="row" items="${result.rows}">


<input type="hidden" name="user" value="${use}">
<img alt="doc" src="images/5.jpg" align="left" >
<pre><b><h4>
&nbsp;Name			:&nbsp;&nbsp;<c:out value="${row.fname}"/>
&nbsp;Mail id			:<input type="email" name="mail" value="${row.mail}"/>
&nbsp;Phone			:<input type="number" name="phone" value="${row.phone}" />
&nbsp;Address			:<input type="text" name="lname" size="100" value="${row.lname}">
&nbsp;Experience		:<input type="number" name="exp" min="0" max="50" value="${row.exp}">
&nbsp;Specialization	:&nbsp;&nbsp;<c:out value="${row.dept}"/>
&nbsp;Qualification		:<select name="qual">
<option>MBBS</option>
<option>BDS</option>
<option>MD</option>
<option>FRCS</option>
</select>
&nbsp;User name		:&nbsp;&nbsp;<%=name %>
&nbsp;Password		:<INPUT TYPE = PASSWORD NAME = "password" value="${row.password}"/>
&nbsp;<font color=red>Delete Account	:<select name="acnt">
<option>No</option>
<option>Yes</option>
</select></font>
</h4>
<p>
&nbsp;&nbsp;&nbsp;<input type="submit" value= " Submit "  style="font-family: sans-serif; font-size: 25px">&nbsp;<input type="reset" value=" Clear " style="font-family: sans-serif; font-size: 25px">&nbsp;	<input type=button onClick="location.href='home.html'" value=' Go Home ' style="font-family: sans-serif; font-size: 25px">
</p>
</b>
</pre>
</c:forEach>
</form>


</body>
</html>