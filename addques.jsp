<body bgcolor=#FFD664 text=black>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<center>
<%
	String s1=request.getParameter("id");
	out.println("Enter Question ");

	%>
	<center><form action="quesstore.jsp" >
	<table> <tr>	
	<th> Test Id </th>
	<td><input type=text value=<% out.println(s1); %> name=id readonly></td>
	</tr>
	<th> Question </th>
	<td><textarea name=ques rows="10" cols="100"></textarea></td>
	</tr>
	<tr>
	<th>option 1</th>
		<td><input type=text name=opt1></td>
	</tr>
	<tr>
		<th>option 2</th>
		<td><input type=text name=opt2></td>
	</tr>
	<tr>
		<th>option 3</th>
		<td><input type=text name=opt3 ></td>
	</tr>
	<tr>
		<th>option 4</th>
		<td><input type=text name=opt4></td>
	</tr>
	<tr>
		<th>Answer </th>
		<td><input type=text name=ans></textarea></td>
	</tr>
	</table>
	<input type=submit value=Add Questions>
	</form>
	<%

		try{  
		Class.forName("com.mysql.jdbc.Driver").newInstance();  
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/exam","root","foodblog");  
		//here sonoo is database name, root is username and password  
		Statement stmt=con.createStatement();
	//	stmt.executeUpdate("update tests set status='active' where id='"+s1+"'");
	//	System.out.println(rs.getInt(1)+"  "+rs.getString(2)+"  "+rs.getString(3));  
		con.close();  
	}catch(Exception e){ System.out.println(e);}    

%>

</body>