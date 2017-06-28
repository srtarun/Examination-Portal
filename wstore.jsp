<body bgcolor=#FFD664 text=black>
<%@ page import="java.sql.*"%>
<%
String cnum=(String)request.getParameter("cnum");
String amount=(String)request.getParameter("Amount");
//int rate=Integer.parseInt(s2);
//out.println(rate);
String id=(String)session.getAttribute("id");
try
{
	Connection con=null;
	Statement st=null;
	ResultSet rs=null;
	
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/exam","root","foodblog");
	st=con.createStatement();
	
	String str="select * from user where id='" + id + "'";
	
	rs=st.executeQuery(str);

//	con=null;
//	st=null;
	if(rs.next())
	{
		int x= Integer.parseInt(rs.getString(10));
	//	out.println(rate);
		int y=Integer.parseInt(amount);
		x = x + y;
		str="update user set wallet='" + Integer.toString(x) + "' where id= '" + id + "'";	
		st.executeUpdate(str);
		out.println("<h3><center>Amount Added to your wallet <br> Click <a href=\"studentpage.jsp\" target=_top>Here</a> to go back." );
	}
	rs.close();
	st.close();
	con.close();
}
catch(Exception e)
{
	out.println(e);
}


%>