
<body bgcolor=#FFD664 text=black>
<%@ page import="java.sql.*"%>
<center>

<%
	Connection con=null;
	Statement st=null;
	ResultSet rs=null;
	String s1=request.getParameter("id");
	String s2=request.getParameter("num");
	String ans=request.getParameter("opt");
//	out.println(ans);
	String ques=(String)session.getAttribute("ques"); 
	String next=request.getParameter("next");
	String sid=(String)session.getAttribute("id"); 
	int flag=0;
	String correct = (String)session.getAttribute("correct");
	if(correct==null)
	{
		session.setAttribute("correct","0");
	}

	String wrong = (String)session.getAttribute("wrong");
	if(correct==null)
	{
		session.setAttribute("wrong","0");
	} 

	String noattempt = (String)session.getAttribute("noattempt");
	if(noattempt == null)
	{
		session.setAttribute("noattempt","0");
	}
	try{
	if(ans == null)
	{
		noattempt = Integer.toString(Integer.parseInt(noattempt) + 1);
		session.setAttribute("noattempt", noattempt);
	}
}catch(Exception e)
{
}
	if(next==null)
		next="0";
	if(s1==null)
	{
	s1=(String)session.getAttribute("tid");
	s2=(String)session.getAttribute("num");
	int i = Integer.parseInt(s2);
	i--;
	s2 = Integer.toString(i);
	session.setAttribute("num",s2);
	String Score =(String)session.getAttribute("score");
	//out.println("Score:" +Score);
	}
	else
	{
	session.setAttribute("tid",s1);
	session.setAttribute("num",s2);
	String Score="0";
	session.setAttribute("score",Score);
	}
	String Score =(String) session.getAttribute("score");
	//out.println("score:"+Score);
	if(ques!=null && ans!=null)
	{
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/exam","root","foodblog");
		st=con.createStatement();
		String str="select * from questions where id=" + s1;
		rs=st.executeQuery(str);
		while(rs.next())
		{
			if(ques.equals(rs.getString(2)) && ans.equals(rs.getString(7)))
			{
				correct = Integer.toString(Integer.parseInt(correct) + 1);
				String attr = Integer.toString(Integer.parseInt(Score)+5);
				session.setAttribute("score", attr);
				flag=1;
				session.setAttribute("correct", correct);
				//out.println(Integer.parseInt(Score+5) + " - "+attr);
			}
		}
		if(flag==0)
		{
			wrong = Integer.toString(Integer.parseInt(wrong) + 1);
			session.setAttribute("wrong", wrong);
		}
	}
	if(next.equals("Submit Test"))
	{
		out.println("<h2>Test Completed<h2>");
		out.println("<center><h3>Your Score:" + (String) session.getAttribute("score") + "</h3>");
		String x = (String)session.getAttribute("noattempt");
		x = Integer.toString(Integer.parseInt(x) - 1);
		session.setAttribute("noattempt",x);
		out.println("<h4>Click <a href=\"chartindex.jsp\">here</a> to get your performance chart.</h4>");

	}
	else if(next.equals("Submit Test1"))
	{
	  out.println(" <script> window.top.location.href=\"taketest.jsp?next=Submit+Test\"; </script> ");
	//  String s = (String)session.getAttribute("noattempt");
	// s = Integer.toString(Integer.parseInt(s) - 1);
	//  session.setAttribute("noattempt",s);
	}
	else
	{

%>
	<form action="taketest.jsp" >
<%
try
{

	Class.forName("com.mysql.jdbc.Driver").newInstance();
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/exam","root","foodblog");
	st=con.createStatement();
	
	String str="select * from questions where id=" + s1;
	
	rs=st.executeQuery(str);
	int x;
	int j = Integer.parseInt(s2);
	for(x=1;x<j;x++)
	{
		rs.next();
	}
	if(rs.next())
	{
	//	String y =Integer.toString(i);
	//	out.println("<tr><td><center>"+ x +"</a></td>");
		session.setAttribute("ques",rs.getString(2));
		out.println("<center><h2>"+rs.getString(2)+"</h2></td>");
		out.println("<h4><input type=radio name=opt value=\""+rs.getString(3)+"\">" + rs.getString(3) + "&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;");
		out.println("<input type=radio name=opt value=\""+rs.getString(4)+"\">" + rs.getString(4) + "&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;");
		out.println("<input type=radio name=opt value=\""+rs.getString(5)+"\">" + rs.getString(5) + "&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;");
		out.println("<input type=radio name=opt value=\""+rs.getString(6)+"\">" + rs.getString(6) + "&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;");
		if(Integer.parseInt(s2)!=1)
		out.println("<td><br><br><br><center><input type=submit name=next value=\"Next Question\">");
		else if(Integer.parseInt(s2)==1)
		{
		out.println("<td><br><br><br><center><input onclick=\"javascript:window.top.location.href='taketest.jsp?next=Submit+Test1'\" type=submit name=next value=\"Submit Test\">");
		}
//		out.println("<br><a href=\"\" ><button name=\"next\" value=\"next\">Next</button></a> </form>");
	}
	st.close();
	con.close();
}
catch(Exception e)
{
	out.println(e);
}

}

%>


</body>