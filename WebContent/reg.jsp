<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
body{
background-image:url("seat.jpg");
background-size:cover;
position:relative;
margin-top:20%;
margin-left:30%
};
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action="Action" method="post" name="reg">
		<label for="user" style="color:white;margin:10px">Enter username</label>
		<input type="text" value="user" name="user" style="margin:10px" /><br />
		<label for="pass" style="color:white;margin:10px">Enter password</label>
		<input type="password" value="pass" name="pass" style="margin:10px"/><br />
		<label for="email" style="color:white;margin:10px">Enter email-id</label>
		<input type="text" value="email" name="email" style="margin:10px"/><br />
		<label for="age" style="color:white;margin:10px">Enter age</label>
		<input type="text" value="age" name="age" style="margin:10px"/><br />
		<label for="sex" style="color:white;margin:10px">Enter gender</label>
		<input type="text" value="gender" name="sex" style="margin:10px"/><br />
		<input type="submit" value="Create user" name="submit" /> 
	</form>
</body>
</html>