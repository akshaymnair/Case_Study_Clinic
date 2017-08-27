<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Add Medicine</title>
<link rel="stylesheet" type="text/css" href="style.css" />

</head>
<style>
p {text-align:center;}

</style>
<body>
<h1><font color=Khaki><h4>Add New Medicine Stock</h4></font></h1>

<form name="addmed" action="addmed" method="post">

<%
String name=(String)session.getAttribute("user");
%>
<input type="hidden" name="user" value=<%=name%> >
<hr color='white' size=5><br>
<img alt="doc" src="images/pills.jpg" align="left" >
<pre><b>
<h4>&nbsp;Name			:<input type="text" name="name" size="50" required/>
&nbsp;Content			:<input type="text" name="content" size="50" required/>
&nbsp;Benefits			:<input type="text" name="benefit" size="50" required />
&nbsp;Side Effects		:<input type="text" name="side" size="50" required/>
&nbsp;Quantity		:<input type="number" name="num" required>
&nbsp;Price			:<input type="number" name="price" required />
<br>
</h4>
<p>
<input type="submit" value=" Submit "  style="font-family: sans-serif; font-size: 25px">&nbsp;	<input type="reset" value=" Clear " style="font-family: sans-serif; font-size: 25px">&nbsp;	<input type=button onClick="location.href='home.html'" value=' Go Home ' style="font-family: sans-serif; font-size: 25px">
</p>
</b>
</pre>
</form>
</body>
</html>