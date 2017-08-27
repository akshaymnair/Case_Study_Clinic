<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page import="java.util.Date,java.text.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Mail Box</title>
<link rel="stylesheet" type="text/css" href="style.css" />
<script type='text/javascript' ></script> 
</head>

<script>
function validateForm()
{
var x=document.forms["mail"]["msg"].value;
if (x==null || x=="")
  {
  alert("Write your Message !!");
  return false;
  }
}
</script>

<style>
table,td
{
border:1px solid #1E90FF;
}
</style>
<body>
<FORM name="mail" ACTION = "mail" onsubmit="return validateForm()" method="post">

<%
String name=(String)session.getAttribute("user");

%>
<c:set var="use" value='<%=name%>'/>
<div id="topline">	
	<div class="content">
       <a>Hi,<strong>&nbsp;<c:out value="${use}"/></strong>  </a>
    </div>
</div>
<h4>&nbsp;&nbsp;&nbsp;Mail Box</h4>
<hr color='white' size=3>

<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver" 
     url="jdbc:mysql://localhost:3306/clinic-db"
     user="root"  password="123"/>
     
 <sql:query dataSource="${snapshot}" var="result">
SELECT user from patient;                          
</sql:query>
<pre>
<h3><font color=khaki><b>
&nbsp;&nbsp;&nbsp; Select your Patient	:<select name="receiv">
<c:forEach var="row" items="${result.rows}">
     <option><c:out value="${row.user}" /> </option>
</c:forEach>
</select>
&nbsp;&nbsp;&nbsp; Message			:<INPUT TYPE = TEXT NAME = "msg" size="100" ><BR>
&nbsp;&nbsp;&nbsp;<input type="submit" value=' Send Message ' style="font-family: sans-serif; font-size: 25px">
</b></font></h3></pre> 
</FORM>


<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost:3306/clinic-db"
     user="root"  password="123"/>

 <h4>
<table style="width:100%">
<tr>
    <td>Received Messages</td>
    <td align="right">Send Messages</td>
  </tr>
</table>
</h4> 
 
<sql:query dataSource="${snapshot}" var="result">
SELECT sender,msg,date from mail where receiver=? ORDER BY date DESC
 <sql:param value="${use}" /> 
</sql:query>

<h3>
<table align="left" border="1" width=50% style="background-color: #ffffcc;"> 
<tr>
<td><font color=#1E90FF><b>Sender</b></font></td>
<td><font color=#1E90FF><b>Message</b></font></td>
<td><font color=#1E90FF><b>Time & Date</b></font></td>
</tr>
<c:forEach var="row" items="${result.rows}">
<tr>
<td><font color=DarkSlateGray><c:out value="${row.sender}"/></font></td>
<td><font color=DarkSlateGray><c:out value="${row.msg}"/></font></td>
<td><font color=DarkSlateGray><c:out value="${row.date}"/></font></td>
</tr>
</c:forEach>
</table>

<sql:query dataSource="${snapshot}" var="result1">
SELECT receiver,msg,date from mail where sender=? ORDER BY date DESC
 <sql:param value="${use}" />
 
</sql:query>
<table align="right" border="1" width=50% style="background-color: #ffffcc;"> 
<tr>
<td><font color=#1E90FF><b>Receiver</b></font></td>
<td><font color=#1E90FF><b>Message</b></font></td>
<td><font color=#1E90FF><b>Time & Date</b></font></td>
</tr>
<c:forEach var="row1" items="${result1.rows}">
<tr>
<td><font color=DarkSlateGray><c:out value="${row1.Receiver}"/></font></td>
<td><font color=DarkSlateGray><c:out value="${row1.msg}"/></font></td>
<td><font color=DarkSlateGray><c:out value="${row1.date}"/></font></td>
</tr>
</c:forEach>
</table>
</h3>


</body>      
</html>