<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page import="java.util.Date,java.text.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Stock</title>
<link rel="stylesheet" type="text/css" href="style.css" />
<script type='text/javascript' src='http://vectorart.org/wp-content/themes/vector/images/jquery.js'></script> 
</head>
<style>
table,th
{
border:2px solid white;
}
</style>

<script>
function validateForm()
{
var x=document.forms["ordr"]["num"].value;
if (x==null || x=="")
  {
  alert("Enter Quantity !!");
  return false;
  }
}
</script>

<body>


<FORM name="ordr" ACTION = "order" onsubmit="return validateForm()" method="post">
<%
String name=(String)session.getAttribute("user");
%>
<input type="hidden" name="use" value=<%=name%> >

<div id="topline">	
	<div class="content">
       <a><strong>&nbsp;Stocks & Orders</strong>  </a>
    </div>
</div>

<h4>&nbsp;&nbsp;&nbsp;STOCKS & ORDERS</h4>
<hr color='white' size=5>
<br/><br/>

<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver" 
     url="jdbc:mysql://localhost:3306/clinic-db"
     user="root"  password="123"/>
     
 <sql:query dataSource="${snapshot}" var="result">
SELECT name from medicine;                          
</sql:query>

<h4><font color="#483D8B" >&nbsp; &nbsp;PLACE YOUR ORDER HERE : </font></h4>

<table width="100%">
<tr>     
<th><h4><font color="#483D8B" >&nbsp;Select Medicine Name: &nbsp;<select name="add"><c:forEach var="row" items="${result.rows}"><option><c:out value="${row.name}" /></option></c:forEach></select></font></h4></th>
<th></th>
<th><h4><font color="#483D8B" >&nbsp;Quantity : &nbsp;<input type="number" name="num"></font></h4></th>
<th></th>
<th>&nbsp;&nbsp;  <input type="submit" value=" Order " style="font-family: sans-serif; font-size: 25px"></th>
</tr>
</table>
<BR/><BR/>

<h4>&nbsp;&nbsp;&nbsp;ADD NEW MEDICINES :&nbsp;&nbsp; <input type=button onClick="location.href='addmed.jsp'" value=' CLICK HERE ' style="font-family: sans-serif; font-size: 25px">
</h4>

</FORM>
</body>
</html>