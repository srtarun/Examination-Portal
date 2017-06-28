<body bgcolor=#FFD664 text=black>
<%

String time=request.getParameter("time");
String Score =(String) session.getAttribute("score");
%>
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
    //  alert("Timeup. \n Your Score:" + <% out.print(Score); %> );
      window.top.location.href="taketest.jsp?next=Submit+Test";
    }
  }

  updateClock();
  var timeinterval = setInterval(updateClock, 1000);
}

var deadline = new Date(Date.parse(new Date()) + <% out.print(Integer.parseInt(time)); %> * 60 * 1000);
initializeClock('clockdiv', deadline);


</script>

</body>