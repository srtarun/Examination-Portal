<body bgcolor=#FFD664 text=black>
<%@ page import="java.sql.*"%>
<%@page import="javax.mail.MessagingException"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.PasswordAuthentication"%>
<%@page import="javax.mail.Session"%>
<%@page import="java.util.Properties"%>
<%@page import="java.util.Random"%>
<%@page import="java.io.*"%>
<jsp:include page="index.jsp"/>
<%
try
{
	Connection con=null;
	Statement st=null;
	
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/exam","root","foodblog");;
	st=con.createStatement();

	String s1=request.getParameter("name");
	String s2=request.getParameter("password");
	String s3=request.getParameter("email");
	String s4=request.getParameter("contact");
	String s5=request.getParameter("address");
	String s6=request.getParameter("image");
	if(s6==null)
	{
		s6="....";
	}
/*
	String x1=application.getRealPath("\\exam\\images\\"+s6);
	out.println(x1);
	File src=new File("C:/images/"+s6);
	File dst=new File(x1);
	InputStream is = null;
    OutputStream os = null;
    try {
        is = new FileInputStream(src);
        os = new FileOutputStream(dst);
        byte[] buffer = new byte[1024];
        int length;
        while ((length = is.read(buffer)) > 0) {
            os.write(buffer, 0, length);
        }
    }
    catch(Exception e)
    {
    	out.println(e);
    } finally {
        is.close();
        os.close();
    }
	 */
	Random r = new Random();
	int x=r.nextInt(6000)+1000;
	String code = new Integer(x).toString();
	String messg = " Dear Student , <br/> Thank you for registering to our online Exam portal <br><i>please click on the below link to activate your account</i> <br><br> ";
	String msg="http://172.16.30.44:8081/exam/activate.jsp?username=";
	msg=msg.concat(s3);
	msg=msg.concat("&code=");
	msg=msg.concat(code);
	messg=messg.concat(msg);

	String str="insert into user(username,password,email,contact,address,otp,photo) values('"+s1+"','"+s2+"','"+s3+"','"+s4+"','"+s5+"','"+x+"','"+s6+"')";

	st.executeUpdate(str);

	String host = "smtp.gmail.com";

	// Creating Properties object
	Properties props = new Properties();

	props.put("mail.smtp.host", host);
	props.put("mail.transport.protocol", "smtp");
	props.put("mail.smtp.auth", "true");
	props.put("mail.smtp.starttls.enable", "true");
	props.put("mail.user", "tarunsethupat@gmail.com");
	props.put("mail.password", "sr***17");
	props.put("mail.port", "465");

	// Authorized the Session object.
		Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {
		@Override
		protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication("tarunsethupat@gmail.com", "sr***17");
		}
		});


		try {
			// Create a default MimeMessage object.
			MimeMessage message = new MimeMessage(mailSession);
			// Set From: header field of the header.
			message.setFrom(new InternetAddress("tarunsethupat@gmail.com"));
			// Set To: header field of the header.
			message.addRecipient(Message.RecipientType.TO,
			        new InternetAddress(s3));
			// Set Subject: header field
			message.setSubject("Exam registration..");
			// Now set the actual message
			message.setContent(messg, "text/html; charset=utf-8");
			// Send message
			Transport.send(message);
		} catch (MessagingException mex) {
			    mex.printStackTrace();
			    String result = "Error: unable to send mail....";
		}

	out.println("<center><h2>Registration Successful.. <br> Please check your mail and click the link to activate your acount");
	st.close();
	con.close();
}
catch(Exception e)
{
	out.println(e);
}
	

%>
