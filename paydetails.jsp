<body bgcolor=#FFD664 text=black>
<%@ page import="java.sql.*"%>
<%
String tid=request.getParameter("id");
String num=request.getParameter("num");
String s2=request.getParameter("cost");
int rate=Integer.parseInt(s2);
//out.println(rate);
String s3=(String)session.getAttribute("id");
//out.println(s3);
try
{
	Connection con=null;
	Statement st=null;
	ResultSet rs=null;
	
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/exam","root","foodblog");
	st=con.createStatement();
	
	String str="select * from user where id='" + s3 + "'";
	
	rs=st.executeQuery(str);

//	con=null;
//	st=null;
	if(rs.next())
	{
		int x= Integer.parseInt(rs.getString(10));
	//	out.println("x:"+x);
	//	out.println(rate);

		if( x >= rate)
		{
			try{
			str="insert into boughttests values('" + s3 + "'," + "'" + tid +"','" + s2 + "','" + num + "')"; 
			st.executeUpdate(str);
			str="update user set wallet='" + Integer.toString(x-rate) + "' where id= '" + s3 + "'";	
			st.executeUpdate(str);
			out.println("<h3><center>Payment Succesful.. <br> All the best for your exam. ");
			} catch(Exception e){
			out.println("<h3><center>You have Already registered for the test");
			}
		}
		else
		{
		out.println("<h3><center>Insufficient Account balance..");
		}
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