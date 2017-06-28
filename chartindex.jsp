<%
String c = (String)session.getAttribute("correct");
String w = (String)session.getAttribute("wrong");
String n = (String)session.getAttribute("noattempt");

%>

<html>
  <head>
    <!--Load the AJAX API-->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">

      // Load the Visualization API and the corechart package.
      google.charts.load('current', {'packages':['corechart']});

      // Set a callback to run when the Google Visualization API is loaded.
      google.charts.setOnLoadCallback(drawChart);

      // Callback that creates and populates a data table,
      // instantiates the pie chart, passes in the data and
      // draws it.
      function drawChart() {

        // Create the data table.
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Topping');
        data.addColumn('number', 'Slices');
        data.addRows([
          ['RightAnswers', <% out.print(c); %>],
          ['WrongAnswers', <% out.print(w); %>],
          ['Didnt Attempt', <% out.print(n); %>],
  //        ['Zucchini', 1],
  //        ['Pepperoni', 2]
        ]);

        // Set chart options
        var options = {'title':'Your performance',
                       'width':600,
                       'height':500};

        // Instantiate and draw our chart, passing in some options.
        var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
    </script>
  </head>

  <body>
    <!--Div that will hold the pie chart-->
    <div id="chart_div"></div>
  </body>

<%
session.setAttribute("correct","0");
session.setAttribute("wrong","0");
session.setAttribute("noattempt","0");
%>



</html>