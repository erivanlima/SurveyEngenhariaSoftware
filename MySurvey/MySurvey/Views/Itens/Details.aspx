<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Modelos.Itens_da_QuestaoModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Details</h2>

<fieldset>
    <legend>Itens_da_QuestaoModel</legend>

    <div class="display-label">idTB_ITENS_DA_QUESTAO</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.idTB_ITENS_DA_QUESTAO) %>
    </div>

    <div class="display-label">ItemA</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.ItemA) %>
    </div>

    <div class="display-label">ItemB</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.ItemB) %>
    </div>

    <div class="display-label">ItemC</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.ItemC) %>
    </div>

    <div class="display-label">ItemD</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.ItemD) %>
    </div>

    <div class="display-label">ItemE</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.ItemE) %>
    </div>
</fieldset>
<p>
    <%: Html.ActionLink("Edit", "Edit", new { /* id=Model.PrimaryKey */ }) %> |
    <%: Html.ActionLink("Back to List", "Index") %>
</p>

</asp:Content>
