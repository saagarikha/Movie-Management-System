<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="Action" method="post" name="myform">
<label for="tid">Enter Theatre ID:</label>
<input type="text" value="Theatre-id" name="tid" />
	<select name="optone" onchange="setOptions(document.myform.optone[document.myform.optone.selectedIndex].value);">
<option selected="" value="Default">(Please select a value to update)</option>
    <option value="movie_id">Movie id</option>
	<option value="t_screen">Theatre Screen</option>
<option value="t_name"> Theatre Name</option>
<option value="seats"> Total Seats</option>
<option value="price"> Price</option>
<option value="show_time"> Show timings</option>
<option value="show_date"> Show date</option>
</select>
<label for="change"> Enter value :</label>
<input type="text" value=" " name="change" />
<input type="submit" value="Update" name="submit" />
</form>
</body>
</html>