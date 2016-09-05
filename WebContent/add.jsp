<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action="Action" method="post" name="add">
		<label for="user">Enter movie-id</label>
		<input type="text" value="movie-id" name="user" /><br />
		<label for="pass">Enter movie name</label>
		<input type="text" value="movie name" name="pass" /><br />
		<label for="email">Enter theatre-id</label>
		<input type="text" value="theatre id" name="email" /><br />
		<label for="age">Enter theatre name</label>
		<input type="text" value="theatre name" name="age" /><br />
		<label for="screen">Enter screen name</label>
		<input type="text" value="theatre screen" name="screen" /><br />
		<label for="sex">Enter show date</label>
		<input type="date" value="date" name="sex" /><br />
		<label for="seats">Enter total seats</label>
		<input type="text" value="seats" name="seats" /><br />
		<label for="price">Enter show price</label>
		<input type="text" value="price" name="price" /><br />
		<label for="time">Enter show time</label>
		<input type="time" value="time" name="time" /><br />
		<input type="submit" value="Add Movie" name="submit" /> 
	</form>
</body>
</html>