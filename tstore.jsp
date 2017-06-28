<body bgcolor=#FFD664 text=black>
<%@ page import="java.sql.*"%>
<%
try
{
	Connection con=null;
	Statement st=null;
	
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/exam","root","foodblog");;
	st=con.createStatement();

	String s1=request.getParameter("testid");
	String s2=request.getParameter("testname");
	String s3=request.getParameter("number");
	String s4=request.getParameter("timelimit");
	String s5=request.getParameter("Cost");


	String str="insert into tests(id,testname,questions,time,cost) values('"+s1+"','"+s2+"','"+s3+"','"+s4+"','"+s5+"')";

	st.executeUpdate(str);

	out.println("<center><h2>Test Added..");
	st.close();
	con.close();
}
catch(Exception e)
{
	out.println(e);
}
	

%>