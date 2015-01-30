<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Models.SurveyModel>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    ListaQuestoes
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>ListaQuestoes</h2>

<p>
    <%: Html.ActionLink("Create New", "Create") %>
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
            <%: Html.ActionLink("Edit", "Edit", new { /* id=item.PrimaryKey */ }) %> |
            <%: Html.ActionLink("Details", "Details", new { /* id=item.PrimaryKey */ }) %> |
            <%: Html.ActionLink("Delete", "Delete", new { /* id=item.PrimaryKey */ }) %>
        </td>
    </tr>
<% } %>

</table>

</asp:Content>
