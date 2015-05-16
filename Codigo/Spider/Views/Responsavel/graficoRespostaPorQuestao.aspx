<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Gráfico
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<script type="text/javascript" src="https://www.google.com/jsapi"></script>
 <script type="text/javascript">
     
</script>

<h2>Gráfico</h2>

<%--<p>
    <%: Html.ActionLink("Create New", "Create") %>
</p>
<table>
    <tr>
        <th></th>
        <th>
            id_Resposta
        </th>
        <th>
            idTB_ENTREVISTADO
        </th>
        <th>
            id_Questao
        </th>
        <th>
            Resposta
        </th>
        <th>
            Item
        </th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.ActionLink("Edit", "Edit", new { /* id=item.PrimaryKey */ }) %> |
            <%: Html.ActionLink("Details", "Details", new { /* id=item.PrimaryKey */ }) %> |
            <%: Html.ActionLink("Delete", "Delete", new { /* id=item.PrimaryKey */ }) %>
        </td>
        <td>
            <%: item.id_Resposta %>
        </td>
        <td>
            <%: item.idTB_ENTREVISTADO %>
        </td>
        <td>
            <%: item.id_Questao %>
        </td>
        <td>
            <%: item.Resposta %>
        </td>
        <td>
            <%: item.Item %>
        </td>
    </tr>  

<% } %>

</table>
--%>
    
    <%--<span id="graficoRespostas"></span>--%>
    <%--<img src="<%: Url.Action("graficoRespostaPorQuestao", "Responsavel") %>" alt="Drawing chart with HTML Helper" />--%>
            
  

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>

