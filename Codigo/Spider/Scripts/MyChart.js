$(document).ready(function () {
    $('#btnPieChart').on('click', function () {
        drawChart();
    });
    $('#btnBarChart').on('click', function () {
        drawBarChart();
    });
});

function drawChart() {
    $.ajax({
        type: 'GET',
        contentType: 'application/json; charset=utf-8',
        url: '/Responsavel/GetRespostaData',
        dataType: "json",
        success: function (browsersData) {
            var data = new google.visualization.DataTable();
            // assumes "word" is a string and "count" is a number
            data.addColumn('string', 'word');
            data.addColumn('number', 'count');

            $.each(browsersData, function (i, d) {
                data.addRow([browsersData[i].Name, browsersData[i].Shares]);
            });

            var options = {
                title: 'Browser Shares in 2014',
                is3D: true
            };
            var chart = new google.visualization.PieChart(document.getElementById('piechart'));
            chart.draw(data, options);
        },
        error: function (data) {
            alert("Error In getting Records");
        }
    });
}

function drawBarChart() {
    $.ajax({
        type: 'GET',
        contentType: 'application/json; charset=utf-8',
        url: '/Home/GetCompanyData',
        dataType: "json",
        success: function (companyData) {
            var data = new google.visualization.DataTable();
            data.addColumn('string', 'Year');
            data.addColumn('number', 'Expenses');
            data.addColumn('number', 'Profit');
            $.each(companyData, function (i, d) {
                data.addRow([companyData[i].Year, companyData[i].Expenses, companyData[i].Profit]);
            });
            var options = {
                chart: {
                    title: 'Company Performance',
                    subtitle: 'Expenses, and Profit'
                },
                bars: 'vertical'
            };
            var chart = new google.charts.Bar(document.getElementById('barchart'));
            chart.draw(data, options);
        },
        error: function (data) {
            alert("Error In getting Records");
        }
    });
}