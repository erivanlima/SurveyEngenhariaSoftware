<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Models.QuestaoModel>>" %>
 
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
Gráficos
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" runat="server">


<script type="text/javascript">
     var ControllerDados ="<%: Url.Action("GetRespostaData","Responsavel",new { id = ViewBag.id_Questao })%>";
     var titulo="Resposta por Questao";
     var nomeId = "graficoRespostaQuestao";
     var ControllerDados2 ="<%: Url.Action("GetRespostaDataColumn","Responsavel",new { id = ViewBag.id_Questao })%>";
     var titulo2="Resposta por Questao2";
     var nomeId2 = "graficoRespostaQuestao2";
</script>

<script src="<%: Url.Content("~/Scripts/grafico.js") %>" type="text/javascript"></script>

<%--<script type="text/javascript">

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
                for (var i = 1; i < data.length; i++) {
                    tdata.addRow([data[i].Item, parseInt(data[i].Quantidade)]);
                    console.log("Blz" + data[i].Item);
                }

                //Opções adicionais do gráfico
                var options = { title: 'Respostas por Questão',
                    'width': 700,
                    'height': 500
                };

                //Define onde será renderizado o gráfico, no caso no elemento divGraficoPizza
                var chart = new google.visualization.PieChart(document.getElementById('divGraficoPizza'));

                //Renderiza o Gráfico com as opções adicionais definidas
                chart.draw(tdata, options);
            }
        });
    }
</script>--%>

</asp:Content>
 
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
 
    <form id="form1" runat="server">
 
<center>

<div id="divGraficoPizza"></div>
<p>Gráfico de Respostas Pizza</p>
<span id="graficoRespostaQuestao"></span>

<p>Gráfico de Respostas Coluna</p>
<span id="graficoRespostaQuestao2"></span>
 </center>
    </form>
</asp:Content>