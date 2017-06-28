<body bgcolor=#FFD664 text=black>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<center>
<%
	String s1=request.getParameter("username");
	String s2=request.getParameter("password");
	int flag=0;

		try{  
		Class.forName("com.mysql.jdbc.Driver").newInstance();  
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/exam","root","foodblog");  
		//here sonoo is database name, root is username and password  
		Statement stmt=con.createStatement();
		ResultSet rs=stmt.executeQuery("select * from admin");  
		while(rs.next())
		{
			String s3=rs.getString(2);
			out.println(s3);
			if(s1.equals(rs.getString(2)) && s2.equals(rs.getString(3)))
			{
				session.setAttribute("usr","Administrator");
				flag=1;
				response.sendRedirect("adminpage.jsp");
			}
		}
		if(flag==0)
		{
		out.println("Invalid Username/Password");
		out.println("<br><center><a href='adminlogin.jsp'>Click Here</a><to back</center>");

		}
	//	System.out.println(rs.getInt(1)+"  "+rs.getString(2)+"  "+rs.getString(3));  
		con.close();  
	}catch(Exception e){ System.out.println(e);}    

%>

</body>