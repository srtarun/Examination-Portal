<body bgcolor=#FFD664 text=black>
<%@ page import="java.sql.*"%>
<center><table border=0.5 width='100%'>
<%
String s1=(String)session.getAttribute("id");
String tid=(String)request.getParameter("id");
String cost=(String)request.getParameter("cost");
String num=(String)request.getParameter("num");
session.setAttribute("num",num);
session.setAttribute("cost",cost);
	
	Connection con=null;
	Statement st=null;
	ResultSet rs=null;

	Class.forName("com.mysql.jdbc.Driver").newInstance();
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/exam","root","foodblog");
	st=con.createStatement();

	String str1 = "select * from boughttests where id='" + s1 + "' and testid='" + tid + "'";

	rs=st.executeQuery(str1);

	if(rs.next())
	{
		out.println("<center><h3>You Have Already Registered for the test..</h3> <br> Click <a href=\"studentpage.jsp\" target=\"_top\">here</a> to go back");
	}
	else
	{

%>
<center><form action='paydetails.jsp'>
<table border=0 style="position: relative;top: 35">
<caption style="font-size: 1.5em"><b>Enter your card details</b></caption>
<tr></tr>
<tr>	
	<th>Test id</th>
	<td><input type=text name=id value= <% out.print(tid); %> readonly></td>
</tr>
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
	<td><input type=text name=cvv></td>
</tr>
<tr>
	<th>Contact Number</th>
	<td><input type=text name=contact></td>
</tr>
<tr>
	<th>cost</th>
	<td><input type=text name=contact value=<%out.print(cost);%> readonly></td>
</tr>
</table>
<input type=submit value=ADD style='position:relative;top: 40;left: 40;'>
</form> </center>

<% } %>