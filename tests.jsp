<body bgcolor=#FFD664 text=black>
<%@ page import="java.sql.*"%>
<form action='addtest.jsp'>
<input type=submit name="AddTest" value="Add a new Test" style="float: right;"> <br>
</form>
<center><table border=0.5 width='100%'>
<tr>
<th>Test ID</th><th>Test Name</th><th>No. of Questions</th><th>Time Limit(in mins)</th><th>Cost</th><th>Status</th>
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
		out.println("<td><center>"+rs.getString(6)+"</td>");
		if(rs.getString(5).equals("active"))
		{
			out.println("<td><center>Active</td></tr>");
		}
		else
		{
			String s="activatetest.jsp?id=" + rs.getString(1);
			out.println("<td><center><a href="+s+"><button name=\"button\" value=\"OK\" type=\"button\">Activate</button></a></td></tr>");
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