
google.load("visualization", "1", { packages: ["corechart"] });
if (typeof ControllerDados != "undefined") 
google.setOnLoadCallback(drawChart);
if (typeof ControllerDados2 != "undefined")
google.setOnLoadCallback(drawChart2);
if (typeof ControllerDados3 != "undefined")
google.setOnLoadCallback(drawChart3);
if (typeof ControllerDados4 != "undefined")
google.setOnLoadCallback(drawChart4);
if (typeof ControllerDados5 != "undefined")
google.setOnLoadCallback(drawChart5);
if (typeof ControllerDados6 != "undefined")
 google.setOnLoadCallback(drawChart6);
if (typeof ControllerDados7 != "undefined")
 google.setOnLoadCallback(drawChart7);
function drawChart() {

        $.post(ControllerDados, {},
    function (data) {
        var tdata = new google.visualization.DataTable();
        var rows = data.length;
        var cols = data[0].length;

        tdata.addColumn('string', data[0][0]);
        for (var i = 0; i < cols; i++) {
            tdata.addColumn('number', data[0][i]);
        }

        tdata.addRows(data.length);
        for (var i = 1; i < data.length; i++) {
            tdata.setCell(i, 0, data[i][0]);
            for (var j = 1; j < cols; j++) {
                var value = parseInt(data[i][j]);
                tdata.setCell(i, j, value);

            }
        }

        var options = {
            title: titulo,
            isStacked: true,
            width: 600,
            height: 400,
            slices: { 4: { offset: 0.2 },
                12: { offset: 0.3 },
                14: { offset: 0.4 },
                15: { offset: 0.5 }
            },
            vAxis: { title: "More Text" },
            hAxis: { title: "Date" }
          
        }
        var chart = new google.visualization.PieChart(document.getElementById(nomeId));
        chart.draw(tdata, options);
    });

}

function drawChart2() {
    
    $.post(ControllerDados2, {},
    function (data) {
        var tdata = new google.visualization.DataTable();
        var rows = data.length;
        var cols = data[0].length;

        tdata.addColumn('string', data[0][0]);
        for (var i = 0; i < cols; i++) {
            tdata.addColumn('number', data[0][i]);
        }

        tdata.addRows(data.length);
        for (var i = 1; i < data.length; i++) {
            tdata.setCell(i, 0, data[i][0]);
            for (var j = 1; j < cols; j++) {
                var value = parseInt(data[i][j]);
                tdata.setCell(i, j, value);

            }
        }

        var options = {
            title: titulo2,
            isStacked: true,
            width: 600,
            height: 300,
                      slices: {  4: {offset: 0.2},
                    12: {offset: 0.3},
                    14: {offset: 0.4},
                    15: {offset: 0.5}
                           },

            vAxis: { title: data[0][1] },
            hAxis: { title: data[0][0] }
            
        };
        


        var chart = new google.visualization.ColumnChart(document.getElementById(nomeId2));
        chart.draw(tdata, options);
       
    });

}

function drawChart3() {

    $.post(ControllerDados3, {},
    function (data) {
        var tdata = new google.visualization.DataTable();
        var rows = data.length;
        var cols = data[0].length;

        tdata.addColumn('string', data[0][0]);
        for (var i = 0; i < cols; i++) {
            tdata.addColumn('number', data[0][i]);
        }

        tdata.addRows(data.length);
        for (var i = 1; i < data.length; i++) {
            tdata.setCell(i, 0, data[i][0]);
            for (var j = 1; j < cols; j++) {
                var value = parseInt(data[i][j]);
                tdata.setCell(i, j, value);

            }
        }

        var options = {
            title: titulo3,
            isStacked: true,
            width: 600,
            height: 300,
            slices: { 4: { offset: 0.2 },
                12: { offset: 0.3 },
                14: { offset: 0.4 },
                15: { offset: 0.5 }
            },

            vAxis: { title: "More Text" },
            hAxis: { title: "Date" }

        };



        var chart = new google.visualization.PieChart(document.getElementById(nomeId3));
        chart.draw(tdata, options);

    });

}

function drawChart4() {

    $.post(ControllerDados4, {},
    function (data) {
        var tdata = new google.visualization.DataTable();
        var rows = data.length;
        var cols = data[0].length;

        tdata.addColumn('string', data[0][0]);
        for (var i = 0; i < cols; i++) {
            tdata.addColumn('number', data[0][i]);
        }

        tdata.addRows(data.length);
        for (var i = 1; i < data.length; i++) {
            tdata.setCell(i, 0, data[i][0]);
            for (var j = 1; j < cols; j++) {
                var value = parseInt(data[i][j]);
                tdata.setCell(i, j, value);

            }
        }

        var options = {
            title: titulo4,
            isStacked: true,
            width: 600,
            height: 300,
            slices: { 4: { offset: 0.2 },
                12: { offset: 0.3 },
                14: { offset: 0.4 },
                15: { offset: 0.5 }
            },

            vAxis: { title: "More Text" },
            hAxis: { title: "Date" }

        };



        var chart = new google.visualization.PieChart(document.getElementById(nomeId4));
        chart.draw(tdata, options);

    });

}

function drawChart5() {

    $.post(ControllerDados5, {},
    function (data) {
        var tdata = new google.visualization.DataTable();
        var rows = data.length;
        var cols = data[0].length;

        tdata.addColumn('string', data[0][0]);
        for (var i = 0; i < cols; i++) {
            tdata.addColumn('number', data[0][i]);
        }

        tdata.addRows(data.length);
        for (var i = 1; i < data.length; i++) {
            tdata.setCell(i, 0, data[i][0]);
            for (var j = 1; j < cols; j++) {
                var value = parseInt(data[i][j]);
                tdata.setCell(i, j, value);

            }
        }

        var options = {
            title: titulo5,
            isStacked: true,
            width: 600,
            height: 300,
            slices: { 4: { offset: 0.2 },
                12: { offset: 0.3 },
                14: { offset: 0.4 },
                15: { offset: 0.5 }
            },

            vAxis: { title: "More Text" },
            hAxis: { title: "Date" }

        };



        var chart = new google.visualization.PieChart(document.getElementById(nomeId5));
        chart.draw(tdata, options);

    });

}

function drawChart6() {

    $.post(ControllerDados6, {},
    function (data) {
        var tdata = new google.visualization.DataTable();
        var rows = data.length;
        var cols = data[0].length;

        tdata.addColumn('string', data[0][0]);
        for (var i = 0; i < cols; i++) {
            tdata.addColumn('number', data[0][i]);
        }

        tdata.addRows(data.length);
        for (var i = 1; i < data.length; i++) {
            tdata.setCell(i, 0, data[i][0]);
            for (var j = 1; j < cols; j++) {
                var value = parseInt(data[i][j]);
                tdata.setCell(i, j, value);

            }
        }

        var options = {
            title: titulo6,
            isStacked: true,
            width: 600,
            height: 300,
            slices: { 4: { offset: 0.2 },
                12: { offset: 0.3 },
                14: { offset: 0.4 },
                15: { offset: 0.5 }
            },

            vAxis: { title: "More Text" },
            hAxis: { title: "Date" }

        };



        var chart = new google.visualization.PieChart(document.getElementById(nomeId6));
        chart.draw(tdata, options);

    });

}

function drawChart7() {

    $.post(ControllerDados7, {},
    function (data) {
        var tdata = new google.visualization.DataTable();
        var rows = data.length;
        var cols = data[0].length;

        tdata.addColumn('string', data[0][0]);
        for (var i = 0; i < cols; i++) {
            tdata.addColumn('number', data[0][i]);
        }

        tdata.addRows(data.length);
        for (var i = 1; i < data.length; i++) {
            tdata.setCell(i, 0, data[i][0]);
            for (var j = 1; j < cols; j++) {
                var value = parseInt(data[i][j]);
                tdata.setCell(i, j, value);

            }
        }

        var options = {
            title: titulo7,
            isStacked: true,
            width: 600,
            height: 300,
            slices: { 4: { offset: 0.2 },
                12: { offset: 0.3 },
                14: { offset: 0.4 },
                15: { offset: 0.5 }
            },

            vAxis: { title: "More Text" },
            hAxis: { title: "Date" }

        };



        var chart = new google.visualization.PieChart(document.getElementById(nomeId7));
        chart.draw(tdata, options);

    });

}