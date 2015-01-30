<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Models.QuestaoModel>>"%>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    ListaQuestoes
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>ListaQuestoes</h2>

<table>
    <tr>
        <th>
            id_Survey
        </th>
        <th>
            id_Questao
        </th>
        <th>
            Pergunta
        </th>
        <th></th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        
        <td>
            <%: Html.DisplayFor(modelItem => item.id_Survey) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.id_Questao) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Pergunta) %>
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
