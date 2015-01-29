<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Models.SurveyModel>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Index</h2>

<p>
    <%: Html.ActionLink("Criar novo Survey", "CreateSurvey") %>
</p>
<table>
    <tr>
        <th>
            id_Survey
        </th>
        <th>
            id_Responsavel
        </th>
        <th>
            Titulo
        </th>
        <th>
            Subtitulo
        </th>
        <th>
            Data_Criacao
        </th>
        <th>
            Data_fim
        </th>
        <th>
            flag_ativo
        </th>
        <th></th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.DisplayFor(modelItem => item.id_Survey) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.id_Responsavel) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Titulo) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Subtitulo) %>
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
            <%: Html.ActionLink("Edit", "Edit", new {  id=item.id_Survey }) %> |
            <%: Html.ActionLink("Delete", "Delete", new {  id=item.id_Survey }) %> |
            <%: Html.ActionLink("Adicionar perguntas", "CreateQuestoes", new {  id=item.id_Survey }) %> |
            <%: Html.ActionLink("Responder Survey", "CreateResposta", new {  id=item.id_Survey }) %>
        </td>
    </tr>
<% } %>

</table>

</asp:Content>
