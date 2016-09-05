<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
	div{
		background-position: center;
	}
	button{
		margin-top:2cm;
		background-color:maroon;
	}
	a:hover{
	font-color:lime;
	}
</style>
</head>
<body style="background-image:url('mainpg.jpg');">
 <div>
 <h3>
 <center>
	<button value="user" onclick='window.location.href="login.jsp"'><font color="white"><h3>Log in as User</h3></font></button></br>
	<button value="admin" onclick='window.location.href="login.jsp"'><font color="white"><h3>Log in as admin</h3></font></button> </br>
	<a href="reg.jsp" style="background-color:lime; margin-top:3cm">New User?</a>
</center>
</h3>	
</div>
</body>
</html>