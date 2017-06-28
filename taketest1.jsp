
<body bgcolor=#FFD664 text=black>
<%@ page import="java.sql.*"%>
<center>

<div style=""><h3>Time Left</h3>
<div id="clockdiv">
  <span>
    <span class="days"></span>
    <span class="smalltext">:</span> 
  </span>
  <span>
    <span class="hours"></span>
    <span id="mins"class="smalltext">:</span>
  </span>
  <span>
    <span class="minutes"></span>
    <span class="smalltext">:</span>
  </span>
  <span>
    <span class="seconds"></span>
    <span class="smalltext"></span>
  </span>
</div> </div>
<br><br>



<script>

function getTimeRemaining(endtime) {
  var t = Date.parse(endtime) - Date.parse(new Date());
  var seconds = Math.floor((t / 1000) % 60);
  var minutes = Math.floor((t / 1000 / 60) % 60);
  var hours = Math.floor((t / (1000 * 60 * 60)) % 24);
  var days = Math.floor(t / (1000 * 60 * 60 * 24));
  return {
    'total': t,
    'days': days,
    'hours': hours,
    'minutes': minutes,
    'seconds': seconds
  };
}

function initializeClock(id, endtime) {
  var clock = document.getElementById(id);
  var daysSpan = clock.querySelector('.days');
  var hoursSpan = clock.querySelector('.hours');
  var minutesSpan = clock.querySelector('.minutes');
  var secondsSpan = clock.querySelector('.seconds');

  function updateClock() {
    var t = getTimeRemaining(endtime);

    daysSpan.innerHTML = t.days;
    hoursSpan.innerHTML = ('0' + t.hours).slice(-2);
    minutesSpan.innerHTML = ('0' + t.minutes).slice(-2);
    secondsSpan.innerHTML = ('0' + t.seconds).slice(-2);

    if (t.total <= 0) {
      clearInterval(timeinterval);
    }
  }

  updateClock();
  var timeinterval = setInterval(updateClock, 1000);
}

var deadline = new Date(Date.parse(new Date()) + 10 * 60 * 1000);
initializeClock('clockdiv', deadline);


</script>

<%

	String time=request.getParameter("time");
//	out.println(time);
	int temp=0;
	if(time!=null)
	{
		temp= Integer.parseInt(time);
		temp= temp * 60 * 1000;
	//	out.println(temp);
	}

%>

<%
	Connection con=null;
	Statement st=null;
	ResultSet rs=null;
	String s1=request.getParameter("id");
	String s2=request.getParameter("num");
	String ans=request.getParameter("opt");
	String ques=(String)session.getAttribute("ques"); 
	String next=request.getParameter("next");
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
				String attr = Integer.toString(Integer.parseInt(Score)+5);
				session.setAttribute("score", attr);
				//out.println(Integer.parseInt(Score+5) + " - "+attr);
			}
		}
	}
	if(next.equals("Submit Test"))
	{
		out.println("<h2>Test Completed<h2>");
		out.println("<center><h3>Your Score:" + (String) session.getAttribute("score") + "</h3>");
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
		out.println("<td><br><br><br><center><input type=submit name=next value=\"Submit Test\">");
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

<script>

function getTimeRemaining(endtime) {
  var t = Date.parse(endtime) - Date.parse(new Date());
  var seconds = Math.floor((t / 1000) % 60);
  var minutes = Math.floor((t / 1000 / 60) % 60);
  var hours = Math.floor((t / (1000 * 60 * 60)) % 24);
  var days = Math.floor(t / (1000 * 60 * 60 * 24));
  return {
    'total': t,
    'days': days,
    'hours': hours,
    'minutes': minutes,
    'seconds': seconds
  };
}

function initializeClock(id, endtime) {
  var clock = document.getElementById(id);
  var daysSpan = clock.querySelector('.days');
  var hoursSpan = clock.querySelector('.hours');
  var minutesSpan = clock.querySelector('.minutes');
  var secondsSpan = clock.querySelector('.seconds');

  function updateClock() {
    var t = getTimeRemaining(endtime);
    daysSpan.innerHTML = t.days;
    hoursSpan.innerHTML = ('0' + t.hours).slice(-2);
    minutesSpan.innerHTML = ('0' + t.minutes).slice(-2);
    secondsSpan.innerHTML = ('0' + t.seconds).slice(-2);
    
    if (t.total <= 0) {
      clearInterval(timeinterval);
    }
  }

  updateClock();
  var timeinterval = setInterval(updateClock, 1000);
}
//if(localStorage.getItem("time")==null)
var deadline = new Date(Date.parse(new Date()) + 1 * 60 * 1000);
initializeClock('clockdiv', deadline);


</script>

</body>