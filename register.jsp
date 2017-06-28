<body>
<jsp:include page="index.jsp"/>
<h3 style='position:absolute;top:93pt;left:217pt;font-size: 1.5em;color: black'> Student Registration </h3>
<form action='sstore.jsp' style='position:absolute;top:110pt;left:510pt'>
<table border=0 style="position: relative;top: 55; color: black;right: 390">
<tr>	
	<th>Student Name</th>
	<td><input type=text name=name>(This is also the username)</td>
</tr>
<tr>
	<th>Password</th>
	<td><input type=password name=password></td>
</tr>
<tr>
	<th>email</th>
	<td><input type=email name=email></td>
</tr>
<tr>
	<th>Contact No</th>
	<td><input type=text name=contact ></td>
</tr>

<tr>
	<th>Address</th>
	<td><textarea name=address rows="5" cols="40"></textarea></td>
</tr>
</table>
<input type=submit value=REGISTER style='position:relative;top: 74;left: -234;'>
</form>