
<body bgcolor=#FFD664 text=black>
<%@ page import="java.sql.*"%>
<center><table border=0.5 width='100%'>
<%
String s1=(String)session.getAttribute("id");

try
{
	Connection con=null;
	Statement st=null;
	ResultSet rs=null;
	
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/exam","root","foodblog");
	st=con.createStatement();
	

/*	select t.id,t.testname,t.questions,t.time
	from boughttests b, tests t 
	where b.testid=t.id and b.id =  32; */
	String str="select * from user where id=" + s1;
	
	rs=st.executeQuery(str);

	if(rs.next())
	{
		String x=rs.getString(10);
		out.println("<tr><td><center><h3>Wallet Balance:"+ x +"</h3></a></td>");
		String s="testpage.jsp?id=" + x + "&num=" + rs.getString(3) + "&time=" + rs.getString(4);
		//out.println("<td><center><a href="+ s +"><button name=\"button\" value=\"OK\" type=\"button\">Take Test</button></a></td></tr>");

	}
	st.close();
	con.close();
}
catch(Exception e)
{
	out.println(e);
}


%>

<body bgcolor=pink text=blue>
<center><form action='wstore.jsp'>
<table border=0 style="position: relative;top: 35">
<caption style="font-size: 1.5em"><b>Add Balance</b></caption>
<tr></tr>
<tr>	
	<th>Name on Card</th>
	<td><input type=text name=name></td>
</tr>
<tr>
	<th>Card number</th>
	<td><input type=text name=cnum></td>
</tr>
<tr>
	<th>Expire Date</th>
	<td><input type=date name=date></td>
</tr>
<tr>
	<th>CVV</th>
	<td><input type=text name=timelimit ></td>
</tr>
<tr>
	<th>Amount</th>
	<td><input type=text name=Amount ></td>
</tr>
</table>
<input type=submit value=ADD style='position:relative;top: 40;left: 40;'>
</form> </center>