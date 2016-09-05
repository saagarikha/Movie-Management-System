<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style type="text/css">
	center {
	position:relative;
	font:cursive;
	font-size: large;
	font-weight: bold;
	color:silver;
	}
	
	#id1:hover{
	background-color:maroon;
	}
</style>
<title>Login</title>
</head>
<body style="background-image:url(login.jpg);background-repeat:no-repeat;background-size:cover">
	<center style="padding-top:5%"><h1>WELCOME _/\_</h1></center> 
	<form action="Action" method="post" name="login">
	<center style="padding-top:3%">
		<label for="user">Enter username</label>
		<input type="text" value="user" name="user" onchange="validate('id1')" id="id4" style="margin-bottom:15px"/><br />
		<label for="pass">Enter password</label>
		<input type="password" value="pass" name="pass" onchange="validate('id2')" id="id2" style="margin-bottom:15px"/><br />
		<label for="email">Enter email-id</label>
		<input type="text" value="abc@example.com" name="email" onchange="validate('id3')" id="id3" style="margin-bottom:15px;outline-color:silver;" /><br />
		<input type="submit" id="id1" value="LOGIN" name="submit" style="margin-left: 3cm" />
	</center> 
	</form>
</body>
</html>