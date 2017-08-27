<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<html> <!-- xmlns="http://www.w3.org/1999/xhtml"-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Pharmacy</title>
<link rel="stylesheet" type="text/css" href="style.css" />
<script type='text/javascript' src='http://vectorart.org/wp-content/themes/vector/images/jquery.js'></script> 
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
       <a><strong>&nbsp;Pharmacy</strong>  </a>
    </div>
</div>
<h4>&nbsp;&nbsp;&nbsp;Pharmacy</h4>
<hr color='white' size=5>
<br>
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost:3306/clinic-db"
     user="root"  password="123"/>

<sql:query dataSource="${snapshot}" var="result">
SELECT name,content,benefit,side,stock,price,status from medicine ORDER BY name ASC;
</sql:query>
<center>
<TABLE border="1" width=99% style="background-color: #ffffcc;"> 
<tr>
<th><h4><font color=#483D8B><b>Name</b></font></h4></th>
<th><h4><font color=#483D8B><b>Contents</b></font></h4></th>
<th><h4><font color=#483D8B><b>Benefits</b></font></h4></th>
<th><h4><font color=#483D8B><b>Side Effects</b></font></h4></th>
<th><h4><font color=#483D8B><b>Stock</b></font></h4></th>
<th><h4><font color=#483D8B><b>price</b></font></h4></th>
<th><h4><font color=#483D8B><b>Ordered By</b></font></h4></th>
</tr>

<c:forEach var="row" items="${result.rows}">
<tr>
<td><h3><font color=#1E90FF><c:out value="${row.name}"/></font></h3></td>
<td><h3><font color=#1E90FF><c:out value="${row.content}"/></font></h3></td>
<td><h3><font color=#1E90FF><c:out value="${row.benefit}"/></font></h3></td>
<td><h3><font color=#1E90FF><c:out value="${row.side}"/></font></h3></td>
<td><h3><font color=#1E90FF><c:out value="${row.stock}"/></font></h3></td>
<td><h3><font color=#1E90FF><c:out value="${row.price}"/></font></h3></td>
<td><h3><font color=#1E90FF><c:out value="${row.status}"/></font></h3></td>
</tr>
</c:forEach>
</table>
</center>
<br>
<br>
&nbsp;&nbsp;&nbsp;<input type=button onClick="location.href='home.html'" value=' Go Home ' style="font-family: sans-serif; font-size: 25px">
</body>
</html>