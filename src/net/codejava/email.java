package net.codejava;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.*;
import java.util.*;

import javax.mail.*;
import javax.mail.internet.*;

/**
 * Servlet implementation class email
 */
public class email extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public email() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stud
		      // Recipient's email ID needs to be mentioned.\
		Cookie[] cookie=request.getCookies();
		      String to = CookieUtilities.getCookieValue(cookie, "email", "sags.srini@gmail.com");
		 
		      // Sender's email ID needs to be mentioned
		      String from = "vijay.varsha@gmail.com";
		 
		      // Assuming you are sending email from localhost
		 
		      // Get system properties
		 
		      // Setup mail server\
		      final String username = "vijay.varsha@gmail.com";
		      final String password = "!dravid!123";

		      Properties props = System.getProperties();
		      props.put("mail.smtp.auth", "true");
		      props.put("mail.smtp.host", "smtp.gmail.com");
		      props.put("mail.smtp.starttls.enable", "true");
				props.put("mail.smtp.auth", "true");
				props.put("mail.smtp.port", "25");
				props.put("mail.smtp.user", username);
				props.put("mail.smtp.password", password);
		 		      
		      Session session = Session.getDefaultInstance(props,
		    		    new javax.mail.Authenticator(){
		    		        protected PasswordAuthentication getPasswordAuthentication() {
		    		            return new PasswordAuthentication(
		    		                "vijay.varsha@gmail.com", "!dravid!123");
		    		        }
		      });
		      		      
		    		// Set response content type
		      response.setContentType("text/html");
		      PrintWriter out = response.getWriter();

		      try{
		         // Create a default MimeMessage object.
		         MimeMessage message = new MimeMessage(session);
		         // Set From: header field of the header.
		         message.setFrom(new InternetAddress(from));
		         // Set To: header field of the header.
		         message.addRecipient(Message.RecipientType.TO,
		                                  new InternetAddress(to));
		         // Set Subject: header field
		         message.setSubject("Ticket Confirmation!");
		         // Now set the actual message
		         message.setText("Ticket booked thanks for booking..Enjoy your show");
		         // Send message
		         Transport trans=session.getTransport("smtp");
		         Transport.send(message);
		         String title = "Send Email";
		         String res = "Sent message successfully....";
		         String docType =
		         "<!doctype html public \"-//w3c//dtd html 4.0 " +
		         "transitional//en\">\n";
		         out.println(docType +
		         "<html>\n" +
		         "<head><title>" + title + "</title></head>\n" +
		         "<body bgcolor=\"#f0f0f0\">\n" +
		         "<h1 align=\"center\">" + title + "</h1>\n" +
		         "<p align=\"center\">" + res + "</p>\n" +
		         "</body></html>");
		         eraseCookie(request,response);
		      }catch (MessagingException mex) {
		         mex.printStackTrace();
		      }
		   }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}
	private void eraseCookie(HttpServletRequest req, HttpServletResponse resp) {
	    Cookie[] cookies = req.getCookies();
	    if (cookies != null)
	        for (int i = 0; i < cookies.length; i++) {
	            cookies[i].setValue("");
	            cookies[i].setPath("/");
	            cookies[i].setMaxAge(0);
	            resp.addCookie(cookies[i]);
	        }
	}
}
