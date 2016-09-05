<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page import="net.codejava.CookieUtilities"%>


<% int flg=0,i;String s1[]=null,dif=null,name=null,price=null,seats=null;
try{

	int cash=0;
    String eid=request.getParameter("q");
    String eid1=request.getParameter("r");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/movies","root","");
    PreparedStatement pstmt=null;
    ResultSet rs=null;
    if(eid1.equals("Confirm Transaction"))
    {
    	flg=6;s1=eid.split("\\$");
    }
    else if(eid1.equals("credit") || eid1.equals("accnt_no"))
    {
    	flg=5;
    	Cookie userCookie = new Cookie("account",eid1);
		response.addCookie(userCookie);
    	s1=eid.split("\\$");
    }
    else if(eid.equals("movie")){
    	flg=1;
    pstmt=con.prepareStatement("select * from "+eid);
    rs=pstmt.executeQuery();
    }
    else if(eid.indexOf("$")==-1)
    { flg=2;
    	pstmt=con.prepareStatement("select * from theatre where movie_name= '"+eid + "'");
    	rs=pstmt.executeQuery();
    }
    else{
    flg=3;
    s1=eid.split("\\$");
    if(!eid1.equals("Book Tickets"))
	    {	   	flg=4;
	    	int val=Integer.parseInt(eid1);
	    }
    }
   if(flg==1)
    {  %>
        <TABLE> <TR>
                <td>Movie Name:</td>
            </tr>
     <%while(rs.next()) {%>
            <tr>
                <td><input type="button" name="" onclick="func(this.value,this.value)" value="<%=rs.getString(1)%>"></td>
             </tr><%} %>
	        </TABLE>     
       <%}
    else if(flg==2){%>
           <TABLE> <TR>
                <td>Theatre ID:</td>
                <td>Theatre Name:</td>
                <td>Theatre Screen:</td>
                <td>Movie name:</td>
                <td>Date:</td>
                <td>Seats:</td>
                <td>Price:</td>
                <td>Time:</td>
            </tr>
           <%while(rs.next()){ String s="\n";%> 
            <tr>
            <% for(i=1;i<=8;i++) {%>
                <td><input type="button" name="" value="<%=rs.getString(i)%>"></td>
                <% s+=rs.getString(i)+"$";}%>
                <td><input type="button" name="<%=s%>" value="Book Tickets" onclick="func(this.name,this.value)"></td>
                </tr><%} %>    
	        </TABLE> 
    <%}
    else if(flg==3){
    %>
   <label for="numb">Total seats required :</label>
   <input type="text" id="numb" name="numb" value='<%=request.getParameter("numb")%>' onchange="return func1(<%=s1[6]%>,this.value)" /> <br>
    <label for="price">Total price:</label>
    <input type="text" name="price" id="price" />
    <input type="button" value="confirm booking" name="<%=eid%>" onclick="func2(this.name);" />
   <%
     }
    else if(flg==4){%>
    	 <select name="<%=eid%>" onchange="func(this.name,this.value)">
  		  <option value="">.......</option>
  		  <option value="credit">Credit Card</option>
			<option value="accnt_no">Bank Account</option>
		</select>	
	<%
    }
    else if(flg==5){%><label for="pin"> Enter pin number:</label>
    		<input type="text" name="pin" onchange="func3(this.value)"/>	
    	<input type="button" value="Confirm Transaction" name="<%=eid%>" onclick="func(this.name,this.value)"/>
    	  <% }
   
    else {
     Cookie[] cookies=request.getCookies();
	 String pin=CookieUtilities.getCookieValue(cookies, "pin", "blackkk");
	 String account=CookieUtilities.getCookieValue(cookies, "account", "blackkk");
     name =CookieUtilities.getCookieValue(cookies, "name", "blackkk"); 
	 String sql="select * from bank where user_name='"+name+"' and "+account+"='"+pin+"'";
	 System.out.println(sql);
	 pstmt=con.prepareStatement(sql);
		rs=pstmt.executeQuery();
	if(rs.next()){
	 price =CookieUtilities.getCookieValue(cookies, "price", "blackkk");
	 cash=Integer.parseInt(rs.getString(4))-Integer.parseInt(price);
	 seats =CookieUtilities.getCookieValue(cookies, "seat", "blackkk");
	 int chas=Integer.parseInt(s1[5])-Integer.parseInt(seats);  
	 System.out.println("diff value:" +seats);
	 dif=Integer.toString(chas);%>
	    <h2>Ticket Booked!!!
	    </h2>
	    <form method="get" action="email">
	    <input type="submit" value="Mail your ticket"/>
	    </form>
	 <% }
	else{%>
		   <h2>Invalid Number!!!</h2>		
	  <%}
	System.out.println("cash value:" +cash);
	   if(cash>0)
	   {
			pstmt=con.prepareStatement("update bank set cash='"+cash+"' where user_name='"+name+"'");
			pstmt.executeUpdate();
			pstmt=con.prepareStatement("update theatre set seats = '" +dif+ "' where movie_name= '"+s1[3]+ "' and t_id= '"+s1[0]+ "' and t_name ='"+s1[1]+ "' and t_screen= '"+s1[2]+ "' and show_date= '"+s1[4]+ "' and show_time= '"+s1[7]+ "'");
			pstmt.executeUpdate();
			price =CookieUtilities.getCookieValue(cookies, "price", "blackkk");
			 pstmt=con.prepareStatement("select * from movie_bank where t_name='"+s1[1]+"'");
			rs=pstmt.executeQuery();String val1=null;
		if(rs.next()){
			val1=rs.getString(2);
		 }
		pstmt=con.prepareStatement("update movie_bank set cash='"+Integer.toString(Integer.parseInt(val1)-Integer.parseInt(price))+"' where t_name='"+s1[1]+"'");
		pstmt.executeUpdate();
	   }
	   else{%>
		   <h2>Balance too low!!!</h2>
	   <%}
    }
}catch(Exception e){ }
%>
