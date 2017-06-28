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
		ResultSet rs=stmt.executeQuery("select * from user");  
		while(rs.next()) 
		{
			if(s1.equals(rs.getString(2)) && s2.equals(rs.getString(3)))
			{
				flag=1;
				if(rs.getString(8).equals("active"))
				{
				session.setAttribute("usr",rs.getString(2));
				session.setAttribute("id",rs.getString(1));

				session.setAttribute("img",rs.getString(9));
				response.sendRedirect("studentpage.jsp");
				}
				else
				out.println("Activate your acount by clicking the link sent to your mail.");

			}
		}
		if(flag==0)
		{
		out.println("Invalid Username/Password");
		out.println("<br><center><a href='studentlogin.jsp'>Click Here</a><to back</center>");

		}
	//	System.out.println(rs.getInt(1)+"  "+rs.getString(2)+"  "+rs.getString(3));  
		con.close();  
	}catch(Exception e)
	{ 
	System.out.println(e);  
	}  

%>

</body>