<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page import="java.util.Date,java.text.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Appointment</title>
<link rel="stylesheet" type="text/css" href="style.css" />
<script type='text/javascript' src='http://vectorart.org/wp-content/themes/vector/images/jquery.js'></script> 
</head>
<style>
table,th
{
border:2px solid white;
}
</style>

<body>
<form action="apnmnt" method="post">
<%
String name=(String)session.getAttribute("user");
%>
<input type="hidden" name="pat" value=<%=name %>>

<div id="topline">	
	<div class="content">
       <a><strong>&nbsp;Appointment</strong>  </a>
    </div>
</div>

<h4>&nbsp;&nbsp;&nbsp;Book Appointment with Doctor</h4>
<hr color='white' size=5>
<br/><br/>

<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver" 
     url="jdbc:mysql://localhost:3306/clinic-db"
     user="root"  password="123"/>
     
 <sql:query dataSource="${snapshot}" var="result">
SELECT fname from doctor;                          
</sql:query>

<table width="100%">
<tr>     
<th><h4><font color="#483D8B" >&nbsp;Select Doctor Name : &nbsp;<select name="doc"><c:forEach var="row" items="${result.rows}"><option><c:out value="${row.fname}" /></option></c:forEach></select></font></h4></th>
<th></th>
<th><h4><font color="#483D8B" >&nbsp; Preferable Date&Time : &nbsp;<input type="datetime" name="dt" required></font></h4></th>
<th></th>
<th><h4><font color="#483D8B" >&nbsp; Illness : &nbsp;<input type="text" name="ill" required></font></h4></th>
<th></th>
<th>&nbsp; &nbsp; <input type="submit" value=" Apply " style="font-family: sans-serif; font-size: 25px"/></th>
</tr>
</table>
<BR/><BR/>

</form>
</body>
</html>