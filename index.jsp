
<% session.invalidate();%>
<body background="learn1.jpg" text=white style="font-family: Verdana, Geneva, sans-serif">
<%@ page import="java.sql.*"%>
<form action='verify.jsp'>
<H1><center><img src="5078.png" style="height: 45;top: 15;position: relative;"><a href="index.jsp" style="text-decoration: none; color: white;">ONLINE EXAM</a></center></H1>
<div style="background: #212F3D; height: 50"><h3 style="padding-top: 15px"><a href="adminlogin.jsp" style="text-decoration: none; color: white;">ADMIN</a> &nbsp;&nbsp;&nbsp;<a href="studentlogin.jsp" style="text-decoration: none; color:white">USER</a></h3> </div> <br>
<div style="background: #212F3D; height: 100%;width: 20%">
<table style="position: center;top: 200;left: 50;"> 
<tr> <th><h3> <b> Current Tests</b></h3></th> </tr>
<tr><td>Aptitude</td></tr>
<tr><td>Reasoning</td></tr>
<tr><td>Verbal</td></tr> 
</table>
</div>
</form>
</body>

