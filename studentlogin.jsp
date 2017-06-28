<body text=white>
<jsp:include page="index.jsp"/>
<div style="background: #212F3D;">
<form action='verifystudent.jsp'>
<table style='position:absolute;top:110pt;left:510pt'>
<caption><b>USER</b></caption>
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
<p style="position:absolute;top:190pt;left:510pt"> Not a member yet?<a href="register.jsp" style="color: white;">Click here</a> to register</p>
<div style="position: relative;" class="g-signin2" data-onsuccess="onSignIn"></div>
 </form>
 </div>
