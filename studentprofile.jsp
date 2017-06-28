<body bgcolor=#FFD664 text=black>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<H1 style="font-size: 2em; position: relative;top: 10;left: -43"><center>Profile</h1></center>
<center>
<table>

<%
	String s1=(String)session.getAttribute("id");
	String s2=(String)session.getAttribute("usr");
	String s3=(String)session.getAttribute("img");
%>

<%
try
{
	Connection con=null;
	Statement st=null;
	ResultSet rs=null;
	
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/exam","root","foodblog");
	st=con.createStatement();
	
	String str="select *from user";
	
	rs=st.executeQuery(str);

	while(rs.next())
	{
		if(rs.getString(1).equals(s1))
		{
			String x=rs.getString(9);
			String s=application.getRealPath("\\exam\\images\\"+s3);
		//	out.println("<center><img src=\""+application.getRealPath("\\exam\\images\\"+s3)+"\"/></center>");
			out.println("<center><h3><tr><th>ID</th><td>"+rs.getString(1)+"</td></tr>");
			out.println("<center><tr><th>UserName</th><td>"+rs.getString(2)+"</td></tr>");
			//out.println("<center>"+rs.getString(3));
			out.println("<center><tr><th>Email</th><td>"+rs.getString(4)+"</td></tr>");
			out.println("<center><tr><th>Contact</th><td>"+rs.getString(5)+"</td></tr>");
			out.println("<center><tr><th>Address</th><td>"+rs.getString(6)+"</td></tr>");
			}

	}
	st.close();
	con.close();
}
catch(Exception e)
{
	out.println(e);
}


%>

</table>
