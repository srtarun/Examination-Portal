<body bgcolor=#FFD664 text=black>
<%@ page import="java.sql.*"%>
<center><table border=0.5 width='100%'>
<tr>
<th>Test ID</th><th>Test Name</th><th>No. of Questions</th><th>Time Limit</th><th>Status</th>
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
	
	String str="select *from tests";
	
	rs=st.executeQuery(str);

	while(rs.next())
	{
			out.println("<tr><td><center>"+rs.getString(1)+"</a></td>");
			out.println("<td><center>"+rs.getString(2)+"</td>");
			out.println("<td><center>"+rs.getString(3)+"</td>");
			out.println("<td><center>"+rs.getString(4)+"</td>");
			String s="addques.jsp?id=" + rs.getString(1);
			out.println("<td><center><a href="+s+"><button name=\"button\" value=\"OK\" type=\"button\">Add Questions</button></a></td></tr>");
	}
	st.close();
	con.close();
}
catch(Exception e)
{
	out.println(e);
}


%>