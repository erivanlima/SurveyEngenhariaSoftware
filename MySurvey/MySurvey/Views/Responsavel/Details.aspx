<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Modelos.ResponsavelModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Details</h2>

<fieldset>
    <legend>ResponsavelModel</legend>

    <div class="display-label">id_Responsavel</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.id_Responsavel) %>
    </div>

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
<p>
    <%: Html.ActionLink("Edit", "Edit", new { /* id=Model.PrimaryKey */ }) %> |
    <%: Html.ActionLink("Back to List", "Index") %>
</p>

</asp:Content>
