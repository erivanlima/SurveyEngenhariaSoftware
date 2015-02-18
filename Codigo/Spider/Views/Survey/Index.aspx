<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Models.SurveyModel>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Meus Surveys
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2></h2>

<p>
    <%: Html.ActionLink("Criar Novo Survey", "CreateSurvey",null,new { @class = "button" }) %>
</p>
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
            <%: Html.DisplayFor(modelItem => item.Data_Criacao)%>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Data_fim)%>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.flag_ativo) %>
        </td>
        <td>
            <%: Html.ActionLink("Manter Questões", "ListaQuestoes", "Questao", new { id = item.id_Survey }, new { @class = "button" })%> 
            <%: Html.ActionLink("Editar", "Edit", new {  id=item.id_Survey }, new { @class = "button" }) %> 
            <%: Html.ActionLink("Excluir", "Delete", new {  id=item.id_Survey }, new { @class = "button" }) %> 
            <%: Html.ActionLink("Visualizar", "CreateViewTotal", "Responsavel", new { id = item.id_Survey }, new { @class = "button" })%> 
            
        </td>
    </tr>
<% } %>

</table>

</asp:Content>
