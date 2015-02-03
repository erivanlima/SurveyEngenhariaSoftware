<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Models.ResponsavelModel>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Index</h2>

<p>
    <%: Html.ActionLink("Create New", "Create") %>
</p>
  <ul id="menu">
                    <li><%: Html.ActionLink("Survey", "Index", "Survey")%></li>
                    <li><%: Html.ActionLink("Responsável", "Index", "Responsavel")%></li>
                    <li><%: Html.ActionLink("Questão", "Index", "Questao")%></li>
                    <li><%: Html.ActionLink("Resposta", "Index", "Resposta")%></li>
                    <li><%: Html.ActionLink("Home", "Index", "Home")%></li>
                    <li><%: Html.ActionLink("About", "About", "Home")%></li>
        </ul>
<table>
    <tr>
        <th>
            id_Responsavel
        </th>
        <th>
            nome
        </th>
        <th>
            email
        </th>
        <th>
            sobrenome
        </th>
        <th></th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.DisplayFor(modelItem => item.id_Responsavel) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.nome) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.email) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.sobrenome) %>
        </td>
        <td>
            <%: Html.ActionLink("Edit", "Edit", new {  id=item.id_Responsavel  }) %> |
            <%: Html.ActionLink("Details", "Details", new {  id=item.id_Responsavel }) %> |
            <%: Html.ActionLink("Delete", "Delete", new {  id=item.id_Responsavel  }) %>
        </td>
    </tr>
<% } %>

</table>

</asp:Content>
