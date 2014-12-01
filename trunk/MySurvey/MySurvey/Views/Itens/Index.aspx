<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Modelos.Itens_da_QuestaoModel>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Index</h2>

<p>
    <%: Html.ActionLink("Create New", "Create") %>
</p>
<table>
    <tr>
        <th>
            idTB_ITENS_DA_QUESTAO
        </th>
        <th>
            ItemA
        </th>
        <th>
            ItemB
        </th>
        <th>
            ItemC
        </th>
        <th>
            ItemD
        </th>
        <th>
            ItemE
        </th>
        <th></th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.DisplayFor(modelItem => item.idTB_ITENS_DA_QUESTAO) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.ItemA) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.ItemB) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.ItemC) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.ItemD) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.ItemE) %>
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
