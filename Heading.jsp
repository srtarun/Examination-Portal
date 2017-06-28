<body background="learn1.jpg" text=white style="font-family: Verdana, Geneva, sans-serif">
<H1 style="font-size: 2em;"><center><img src="5078.png" style="height: 45;top: 15;position: relative;"><a href="index.jsp" target="_top" style="text-decoration: none;color: white">ONLINE EXAM</a></h1></center>
<%
	String s1=(String)session.getAttribute("usr");
	out.println("welcome "+s1);

%>
</body>