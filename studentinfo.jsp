<body bgcolor=#FFD664 text=black>
<%@ page import="java.sql.*"%>
<center><table border=1 width='100%'>
<tr>
<th>Student NO</th><th>Student Name</th><th>Address</th><th>ContactNO</th>
</tr>

<%
try
{
	Connection con=null;
	Statement st=null;
	ResultSet rs=null;
	
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/exam","root","foodblog");
	st=con.createStatement();
	
	String str="select *from user where status='active'";
	
	rs=st.executeQuery(str);

	while(rs.next())
	{
out.println("<tr><td><center>"+rs.getString(1)+"</td>");
       out.println("<td><center>"+rs.getString(2)+"</td>");
       out.println("<td><center>"+rs.getString(4)+"</td>");
      out.println("<td><center>"+rs.getString(5)+"</td></tr>");
	
	}
	st.close();
	con.close();
}
catch(Exception e)
{
	out.println(e);
}


%>