<body >
<jsp:include page="index.jsp"/>
<form action='verifyadmin.jsp'>
<table style='position:absolute;top:110pt;left:510pt'>
<caption><b>ADMIN</b></caption>

<tr>
	<th style="background: #212F3D">User Name</th>
	<td><input type='text' name='username'></td>
</tr>
<tr>
	<th style="background: #212F3D">Password</th>
	<td><input type='password' name='password'></td>
</tr>
</table>
<input type=submit value="Login" style='position:absolute;top:175pt;left:585pt'>
</form>