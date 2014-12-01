<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Modelos.RespostaModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Delete
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Delete</h2>

<h3>Are you sure you want to delete this?</h3>
<fieldset>
    <legend>RespostaModel</legend>

    <div class="display-label">id_Resposta</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.id_Resposta) %>
    </div>

    <div class="display-label">idTB_ENTREVISTADO</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.idTB_ENTREVISTADO) %>
    </div>

    <div class="display-label">id_Questao</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.id_Questao) %>
    </div>

    <div class="display-label">Resposta</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Resposta) %>
    </div>

    <div class="display-label">Item</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Item) %>
    </div>
</fieldset>
<% using (Html.BeginForm()) { %>
    <p>
        <input type="submit" value="Delete" /> |
        <%: Html.ActionLink("Back to List", "Index") %>
    </p>
<% } %>

</asp:Content>
