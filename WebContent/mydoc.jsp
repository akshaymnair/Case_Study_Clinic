<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page import="java.util.Date,java.text.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>My Doctors</title>
<link rel="stylesheet" type="text/css" href="style.css" />
<script type='text/javascript' src='http://vectorart.org/wp-content/themes/vector/images/jquery.js'></script> 
</head>
<style>
table,td
{
border:1px solid #1E90FF;
}
</style>

<body>
<form action="apnmnt" method="post">
<%
String name=(String)session.getAttribute("user");
%>
<c:set var="pat" value='<%=name%>'/>

<div id="topline">	
	<div class="content">
       <a><strong>&nbsp;<%=name %>'s &nbsp; Doctors</strong>  </a>
    </div>
</div> 

<h4>&nbsp;&nbsp;&nbsp;Doctors I have Appointment with</h4>
<hr color='white' size=5>
<br/><br/>
<img alt="sale" src="images/5.jpg" align="left"/>

<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver" 
     url="jdbc:mysql://localhost:3306/clinic-db"
     user="root"  password="123"/>
     
 <sql:query dataSource="${snapshot}" var="result">
SELECT distinct doc,apont,prblm from apnmnt where pat=?;
<sql:param value="${pat}" />                        
</sql:query>
<h3>
<table align="center" border="1" width=50% style="background-color: #ffffcc;"> 
<tr>
<td><font color=#1E90FF><b>Names</b></font></td>
<td><font color=#1E90FF><b>Appointment Date</b></font></td>
<td><font color=#1E90FF><b>My Problem</b></font></td>
</tr>
<c:forEach var="row" items="${result.rows}">
<tr>
<td><font color=DarkSlateGray><c:out value="${row.doc}"/></font></td>
<td><font color=DarkSlateGray><c:out value="${row.apont}"/></font></td>
<td><font color=DarkSlateGray><c:out value="${row.prblm}"/></font></td>
</tr>
</c:forEach>
</table>
</h3>

</form>
</body>
</html>