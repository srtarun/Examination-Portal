
<%  

	String s1=request.getParameter("id");
	String s2=request.getParameter("num");
	String s3=request.getParameter("time");
%>


<frameset rows='20%,80%' border='1'>
	<frame name='f1' src=<% out.print("testheading.jsp?time=" + s3); %> noresize>
	<frame name='f2' noresize src=<% out.print("taketest.jsp?id=" + s1 + "&num=" + s2); %>  >
      </frameset>
</frameset>