<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>


<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    GetRespostaData
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="HeadContent" runat="server">

<script type="text/javascript">

    //Carrega o tipo de gráfico a ser utilizado
    google.load('visualization', '1.0', { packages: ['corechart'] });
    google.setOnLoadCallback(drawChart);


    function drawChart() {
        $.ajax({
            type: 'GET',
            contentType: 'application/json; charset=utf-8',
            url: '/Responsavel/GetRespostaData',
            dataType: 'json',
            success: function (data) {
                var tdata = new google.visualization.DataTable(data);
                //Adiciona as colunas do gráfico
                tdata.addColumn('string', 'Item');
                tdata.addColumn('number', 'Quantidade');
                tdata.addColumn('number', 'Questao');
                //                tdata.addColumn('number', 'Questao');
                //                tdata.addColumn('string', 'Resposta');
                //                tdata.addColumn('number', 'Id');
                //Adiciona as linhas do gráfico
                //            data.addRows([
                //              ['Zona Norte', 7],
                //              ['Zona Sul', 1],
                //              ['Zona Oeste', 4],
                //              ['Zona Leste', 10],
                //              ['Demais', 2]
                //            ]);
                for (var i = 0; i < data.length; i++) {
                    tdata.addRow([data[i].Item, data[i].qtdItens, data[i].tb_questao_id_Questao]);
                }

                //Opções adicionais do gráfico
                var options = { title: 'Respostas por Questão',
                    'width': 500,
                    'height': 400
                };

                //Define onde será renderizado o gráfico, no caso no elemento divGraficoPizza
                var chart = new google.visualization.PieChart(document.getElementById('divGraficoPizza'));

                //Renderiza o Gráfico com as opções adicionais definidas
                chart.draw(tdata, options);
            }
        });
    }
</script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script src="../../Scripts/jquery-2.1.3.min.js" type="text/javascript"></script>
    <script src="../../Scripts/jsapi.js" type="text/javascript"></script>
    <script type="text/javascript" src="https://www.google.com/jsapi?autoload={'modules':[{'name':'visualization','version':'1','packages':['corechart']}]}"></script>
    <script src="../../Scripts/MyChart.js" type="text/javascript"></script>
    <h2>
        GetRespostaData</h2>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
    <div>
        <input type="button" id="btnPieChart" value="Pie Chart" />
        <div id="piechart" style="width: 900px; height: 500px;">
            <asp:Chart ID="Chart1" runat="server" onload="Chart1_Load">
                <Series>
                    <asp:Series Name="Series1">
                    </asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">
                    </asp:ChartArea>
                </ChartAreas>
            </asp:Chart>
        </div>
    </div>
    </form>
</asp:Content>
