<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Models.QuestaoModel>>" %>

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
            id_Questao
        </th>
        <th>
            idTB_ITENS_DA_QUESTAO
        </th>
        <th>
            id_Survey
        </th>
        <th>
            Tipo
        </th>
        <th>
            Pergunta
        </th>
        <th>
            Randomica
        </th>
        <th>
            Obrigatoria
        </th>
        <th>
            Codigo
        </th>
        <th>
            Linguagem
        </th>
        <th></th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.DisplayFor(modelItem => item.id_Questao) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.idTB_ITENS_DA_QUESTAO) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.id_Survey) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Tipo) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Pergunta) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Randomica) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Obrigatoria) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Codigo) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Linguagem) %>
        </td>
        <td>
            <%: Html.ActionLink("Edit", "Edit", new { id=item.id_Questao }) %> |
            <%: Html.ActionLink("Delete", "Delete", new { id = item.id_Questao })%> |
            <%: Html.ActionLink("Criar Resposta", "CreateResposta", new { id = item.id_Questao })%> |
            <%: Html.ActionLink("Listar Questões", "ListaQuestoes", new {  id=item.id_Survey }) %>
        </td>
    </tr>
<% } %>

</table>

</asp:Content>
