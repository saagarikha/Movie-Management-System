package net.codejava;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Action
 */
public class Action extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Action() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @param <Gson>
	 * @return 
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String val=request.getParameter("user");
		String val1=request.getParameter("pass");
		String val2=request.getParameter("email");
		String val3=request.getParameter("age");
		String val4=request.getParameter("sex");
		String val5=request.getParameter("submit");
		Connection connect = null;int flg=0;
		try {
			connect=DriverManager.getConnection("jdbc:mysql://localhost:3306/movies", "root", "");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		PreparedStatement prep;
		ResultSet rs;
		if(val5.equals("LOGIN"))
		{
		if(val.equals("admin") && val1.equals("adminpw"))
		{
			String target="admin.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(target);
			rd.forward(request,response);
		}
		else{
			String sql="select user_name,user_pwd from movies.login where email= '"+val2+"'";
			try {
				prep=connect.prepareStatement(sql);
				rs=prep.executeQuery();
				while(rs.next())
				{
					if(val.equals(rs.getString(1)) && val1.equals(rs.getString(2)))
					{
						Cookie userCookie = new Cookie("name",val);
						response.addCookie(userCookie);
						Cookie userCookie1 = new Cookie("account",val2);
						response.addCookie(userCookie1);
						String target="user.jsp";
						RequestDispatcher rd=request.getRequestDispatcher(target);
						rd.forward(request,response);
					}
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		}
		if(val5.equals("Create user")){		
			String sql="insert into movies.login (user_name,user_pwd,email,age,sex) values(?,?,?,?,?)";
			try {
				prep=connect.prepareStatement(sql);
				prep.setString(1,val);
				prep.setString(2,val1);
				prep.setString(3,val2);
				prep.setString(4,val3);
				prep.setString(5,val4);
				prep.executeUpdate();
				String target="login.jsp";
				RequestDispatcher rd=request.getRequestDispatcher(target);
				rd.forward(request,response);
				//((Object) prep).closeOnCompletion();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	
		}
		if(val5.equals("Add Movie")){int flag=0;
		    String check="select * from movies.movie";
		    String check1="select * from movies.movie_bank";
		    String sql="insert into movies.movie (movie_name) values(?)";
		    String sql2="insert into movies.movie_bank (t_name,cash) values(?,?)";
		    String sql1="insert into movies.theatre (t_id,t_name,t_screen,movie_name,show_date,seats,price,show_time) values(?,?,?,?,?,?,?,?)";
			String val6=request.getParameter("seats");
			String val7=request.getParameter("price");
			String val8=request.getParameter("time");
			String val9=request.getParameter("screen");
			try {
				prep=connect.prepareStatement(check);
				rs=prep.executeQuery();
				while(rs.next())
				{
					if(val1.equals(rs.getString(1)))
						flag=1;
				}
				prep=connect.prepareStatement(check1);
				rs=prep.executeQuery();
				while(rs.next())
				{
					if(val3.equals(rs.getString(1)))
						flg=2;
				}
				if(flg==0){
					prep=connect.prepareStatement(sql2);
					prep.setString(1,val3);
					prep.setString(2,"0");
					prep.executeUpdate();
				}
				if(flag==0){
				prep=connect.prepareStatement(sql);
				prep.setString(1,val1);
				prep.executeUpdate();}
				prep=connect.prepareStatement(sql1);
				prep.setString(1,val2);
				prep.setString(2,val3);
				prep.setString(3,val9);
				prep.setString(4,val1);
				prep.setString(5,val4);
				prep.setString(6,val6);
				prep.setString(7,val7);
				prep.setString(8,val8);
				prep.executeUpdate();
				String target="admin.jsp";
				RequestDispatcher rd=request.getRequestDispatcher(target);
				rd.forward(request,response);
				//((Object) prep).closeOnCompletion();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	
		}
		if(val5.equals("Update"))
		{
			String sql="update theatre set "+request.getParameter("optone")+" = '"+request.getParameter("change")+"' where t_id= '"+request.getParameter("tid")+"'";
			try {
				prep=connect.prepareStatement(sql);
				prep.executeUpdate();
				String target="admin.jsp";
				RequestDispatcher rd=request.getRequestDispatcher(target);
				rd.forward(request,response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(val5.equals("Delete"))
		{
			String sql="delete from theatre where t_id= '"+request.getParameter("tid")+"'";
			try {
				prep=connect.prepareStatement(sql);

				prep.executeUpdate();
				String target="admin.jsp";
				RequestDispatcher rd=request.getRequestDispatcher(target);
				rd.forward(request,response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(val5.equals("Check Theatre"))
		{
			String sql="select * from theatre";
			try {
				prep=connect.prepareStatement(sql);
				rs=prep.executeQuery();
				String s = "\n";
				response.setContentType("text/html");
				response.getOutputStream().print("<table>"+
						"<td> Theatre ID: </td>"+"\n"+
						"<td> Theatre Name: </td>"+"\n"+
						"<td> Theatre Screen: </td>"+"\n"+
						"<td> Movie Name: </td>"+"\n"+
						"<td> Show date: </td>"+"\n"+
						"<td> Seats: </td>"+"\n"+
						"<td> Price: </td>"+"\n"+
						"<td> Show time: </td>"+"\n </table>");
				while(rs.next())
				{
					s+=rs.getString(1)+"$";
					s+=rs.getString(2)+"$";
					s+=rs.getString(3)+"$";
					s+=rs.getString(4)+"$";
					s+=rs.getString(5)+"$";
					s+=rs.getString(6)+"$";
					s+=rs.getString(7)+"$";
					s+=rs.getString(8)+"$";
				request.setAttribute("ResultSet",rs);
				String target="user.jsp";
				String[] s1=s.split("\\$");
				response.getOutputStream().print("<tr>");
				for(int i=0;i<7;i++)
				{
					response.getOutputStream().print("\n <td>"+s1[i]+"</td>");
				}
				response.getOutputStream().print("\n</tr>");
				   //	RequestDispatcher rd=request.getRequestDispatcher(target);
				//rd.forward(request,response);
			}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(val5.equals("Choose Movie"))
		{
			String sql="select * from movie";
			try {
				prep=connect.prepareStatement(sql);
				rs=prep.executeQuery();
				String s = "\n";
				while(rs.next())
				{
					s+=rs.getString(1);
					s+="$";
				}
				request.setAttribute("ResultSet",rs);
				request.setAttribute("flag",1);
				String target="user.jsp";
				   request.setAttribute("answer",s);			
				   	RequestDispatcher rd=request.getRequestDispatcher(target);
				rd.forward(request,response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
