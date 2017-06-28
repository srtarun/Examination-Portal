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

	String s1=request.getParameter("id");
	String s2=request.getParameter("ques");
	String s3=request.getParameter("opt1");
	String s4=request.getParameter("opt2");
	String s5=request.getParameter("opt3");
	String s6=request.getParameter("opt4");
	String s7=request.getParameter("ans");


	String str="insert into questions(id,question,option1,option2,option3,option4,answer) values('"+s1+"','"+s2+"','"+s3+"','"+s4+"','"+s5+"','"+s6+"','"+s7+"')";

	st.executeUpdate(str);
	out.println("<center><h3> Test Added.. <br> Click <a href=\"addques.jsp?id=" + s1 +"\">here</a> to add another question");
	st.close();
	con.close();
}
catch(Exception e)
{
	out.println(e);
}
	

%>