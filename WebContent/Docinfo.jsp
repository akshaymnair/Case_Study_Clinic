<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<html><!--  xmlns="http://www.w3.org/1999/xhtml" -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Doctor Info</title>
<link rel="stylesheet" type="text/css" href="style.css" />
<script type='text/javascript' ></script> 
</head>

<style>
table,td,th
{
border:1px solid #1E90FF;
}
</style>
<body>

<div id="topline">	
	<div class="content">
       <a><strong>&nbsp;Doctors</strong>  </a>
    </div>
</div>

<h4>Doctors Information</h4>
<hr color='white' size=5>
<br>
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost:3306/clinic-db"
     user="root"  password="123"/>

<sql:query dataSource="${snapshot}" var="result">
SELECT fname,dept,qual,exp,lname from doctor;
</sql:query>
<center>
<TABLE border="1" width=99% style="background-color: #ffffcc;"> 
<tr>
<th><h4><font color=#483D8B><b>Name</b></font></h4></th>
<th><h4><font color=#483D8B><b>Specialization</b></font></h4></th>
<th><h4><font color=#483D8B><b>Qualification</b></font></h4></th>
<th><h4><font color=#483D8B><b>Experience</b></font></h4></th>
<th><h4><font color=#483D8B><b>Address</b></font></h4></th>
</tr>

<c:forEach var="row" items="${result.rows}">
<tr>
<td><h3><font color=#1E90FF><c:out value="${row.fname}"/></font></h3></td>
<td><h3><font color=#1E90FF><c:out value="${row.dept}"/></font></h3></td>
<td><h3><font color=#1E90FF><c:out value="${row.qual}"/></font></h3></td>
<td><h3><font color=#1E90FF><c:out value="${row.exp}"/></font></h3></td>
<td><h3><font color=#1E90FF><c:out value="${row.lname}"/></font></h3></td>
</tr>
</c:forEach>
</table>
</center>
<br>
<br>
&nbsp;&nbsp;<input type=button onClick="location.href='home.html'" value=' Go Home ' style="font-family: sans-serif; font-size: 25px">
</body>
</html>