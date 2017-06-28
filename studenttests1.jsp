
<body bgcolor=pink text=blue>
<%@ page import="java.sql.*"%>
<center><table border=0.5 width='100%'>
<tr>
<th>Test ID</th><th>Test Name</th><th>No. of Questions</th><th>Time Limit</th><th>Cost</th>
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
	
	String str="select *from tests where status='active'";
	
	rs=st.executeQuery(str);

	while(rs.next())
	{
		String x=rs.getString(1);
		out.println("<tr><td><center>"+ x +"</a></td>");
		out.println("<td><center>"+rs.getString(2)+"</td>");
		out.println("<td><center>"+rs.getString(3)+"</td>");
		out.println("<td><center>"+rs.getString(4)+"</td>");
		out.println("<td><center>"+rs.getString(6)+"</td>");
		String s="testpage.jsp?id=" + x + "&num=" + rs.getString(3) + "&time=" + rs.getString(4);
		out.println("<td><center><a href="+ s +"><button name=\"button\" value=\"OK\" type=\"button\">Take Test</button></a></td></tr>");

	}
	st.close();
	con.close();
}
catch(Exception e)
{
	out.println(e);
}


%>