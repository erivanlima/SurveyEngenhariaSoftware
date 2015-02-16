<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Models.RespostaModel>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Respostas
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Respostas</h2>

<p>
    <%--<%: Html.ActionLink("Create New", "Create") %>--%>
</p>
<table>
    <tr>
        <th>
            id_Resposta
        </th>
        <th>
            ENTREVISTADO
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
        <th></th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.DisplayFor(modelItem => item.id_Resposta) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.idTB_ENTREVISTADO) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.id_Questao) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Resposta) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Item) %>
        </td>
        <%--<td>
            <%: Html.ActionLink("Edit", "Edit", new { /* id=item.PrimaryKey */ }) %> |
            <%: Html.ActionLink("Details", "Details", new { /* id=item.PrimaryKey */ }) %> |
            <%: Html.ActionLink("Delete", "Delete", new { /* id=item.PrimaryKey */ }) %>
        </td>--%>
    </tr>
<% } %>

</table>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
