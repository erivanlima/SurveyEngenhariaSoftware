<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Models.SurveyModel>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Meus Surveys
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<br />

<h2> Enviar Survey</h2>


<table>
    <tr>
        <th>
            Titulo do Survey
        </th>
        <th>
            Data Criado
        </th>
        <th>
            Data de Encerramento
        </th>
        <th>
            Ativo
        </th>
        <th id="thc">
            Ações
        </th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.DisplayFor(modelItem => item.Titulo) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Data_Criacao) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Data_fim) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.flag_ativo) %>
        </td>
        <td>
            <%: Html.ActionLink("Gerar Link", "GerarLinkSurvey", "Responsavel", new { id = item.id_Survey }, new { @class = "button" })%> 
            <%: Html.ActionLink("Enviar via Rede Social", "Edit", new { id = item.id_Survey }, new { @class = "button" })%>  
            <%: Html.ActionLink("Visualizar", "VisualizarEnviarSurvey", "Survey", new { id = item.id_Survey }, new { @class = "button" })%> 
            
        </td>
    </tr>
<% } %>

</table>

</asp:Content>
