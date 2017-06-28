<body bgcolor=#FFD664 text=black>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<center>
<%
	String s1=request.getParameter("id");
	int flag=0;

		try{  
		Class.forName("com.mysql.jdbc.Driver").newInstance();  
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/exam","root","foodblog");  
		//here sonoo is database name, root is username and password  
		Statement stmt=con.createStatement();
		stmt.executeUpdate("update tests set status='active' where id='"+s1+"'");
		out.println("<center>Test Activated..<br>Click <a href='tests.jsp'>here</a> to go back.");
	//	System.out.println(rs.getInt(1)+"  "+rs.getString(2)+"  "+rs.getString(3));  
		con.close();  
	}catch(Exception e){ System.out.println(e);}    

%>

</body>