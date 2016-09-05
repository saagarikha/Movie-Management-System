  <%@page import="net.codejava.CookieUtilities"%>
<head>
<title>Insert title here</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

	<link href="css/bootstrap.min.css" rel="stylesheet">
	<style type="text/css">
		div{width:500px;
			height:500px;
			}
	</style>
</head>	

<body>
	<script type="text/javascript">
var xmlhttp;   
function func(str,str1){
	//var s=(String)str;
	//alert(str);
	if (str=="")
  {
  document.getElementById("txtHint").innerHTML="";
  return;
  }
if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
  xmlhttp=new XMLHttpRequest();
  }
else
  { // code for IE6, IE5
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
    document.getElementById("txtHint").innerHTML=xmlhttp.responseText;
    }
  };
  xmlhttp.open("GET","retrive.jsp?q="+str+"&r="+str1,true); 
  xmlhttp.send();
} 

function func1(eid1,numb){
	var s=numb;
	s*=eid1;
	var input=document.getElementById("price");
	input.value=s;
	document.cookie="seat ="+numb;
	document.cookie="price ="+s;
	}
 function func2(str){//alert(str);
	 var s=document.getElementById("numb").value;
	 alert(s);
	 func(str,s);
 }
 function func3(numb)
 {
	 document.cookie="pin="+numb;
 }
 
 function transfer(){
	 document.cookie = 'pin' + 
	    '=; expires=Thu, 01-Jan-70 00:00:01 GMT;';
	 document.cookie = 'numb' + 
	    '=; expires=Thu, 01-Jan-70 00:00:01 GMT;';
	 document.cookie = 'name' + 
	    '=; expires=Thu, 01-Jan-70 00:00:01 GMT;';
	 document.cookie = 'email' + 
	    '=; expires=Thu, 01-Jan-70 00:00:01 GMT;';
	    window.location.href="login.jsp";
 }
</script>


<%String eid="hell";
Cookie[] cookies=request.getCookies();
String name=null;
name =CookieUtilities.getCookieValue(cookies, "name", "sags");%>
<span>
	Welcome <%=name%>
</span>
 <button class="btn btn-medium btn-danger" onclick="transfer()"> Log Out </button>
 <button class="btn btn-large btn-block btn-inverse" type="button" value="movie"
 onclick="func(this.value,this.value)"
 >Choose Movie</button>
<div id="txtHint">
   </div>
</body>
</html>