<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Models.ResponsavelModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Excluir Responsável
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Excluir Responsável</h2>

<h3>Deseja realmente excluir?</h3>
<fieldset>
    <legend>ResponsavelModel</legend>

    <div class="display-label">nome</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.nome) %>
    </div>

    <div class="display-label">email</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.email) %>
    </div>

    <div class="display-label">sobrenome</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.sobrenome) %>
    </div>
</fieldset>
<% using (Html.BeginForm()) { %>
    <p>
        <input type="submit" value="Delete" /> |
        <%: Html.ActionLink("Voltar", "Index") %>
    </p>
<% } %>

</asp:Content>
