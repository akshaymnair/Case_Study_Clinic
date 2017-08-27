<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>LogIn Page</title>
<link rel="stylesheet" type="text/css" href="style.css" />
<script type='text/javascript' src='images/jquery.js'></script> 
</head>
<body>

<h1>User Login</h1>
<hr color='blue' size=5>

<FORM ACTION = "logcls" method="post">
<h4>
	<pre>
&nbsp;Username	:<INPUT TYPE = TEXT NAME = "user" ><BR>
&nbsp;Password	:<INPUT TYPE = PASSWORD NAME = "password" ><BR>
&nbsp;Role		:<select name="role">
<option>doctor</option>
<option>patient</option>
<option>supplier</option>
<option>salesman</option>
</select>
</pre></h4>
<br><br>
		&nbsp;	<INPUT TYPE = SUBMIT VALUE = " Login " style="font-family: sans-serif; font-size: 25px">

			&nbsp;<input type="reset" value=" Clear " style="font-family: sans-serif; font-size: 25px">
  
    	&nbsp;	<input type=button onClick="location.href='home.html'" value=' Go Home ' style="font-family: sans-serif; font-size: 25px">
     </FORM><br>
    </pre>
</body>
</html>