<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Models.Itens_da_QuestaoModel>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    ListaItens
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>ListaItens</h2>

<p>
    <%: Html.ActionLink("Create New", "Create", new { Value = ViewBag.id_Questao })%>
</p>
<table>
    <tr>
        <th></th>
        <th>
            idtb_itens_da_questao
        </th>
        <th>
            id_Questao
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
            <%: item.idtb_itens_da_questao %>
        </td>
        <td>
            <%: item.id_Questao %>
        </td>
        <td>
            <%: item.Item %>
        </td>
    </tr>  
<% } %>

</table>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>

