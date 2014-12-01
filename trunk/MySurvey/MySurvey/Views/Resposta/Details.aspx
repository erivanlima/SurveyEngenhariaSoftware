<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Modelos.RespostaModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Details</h2>

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
<p>
    <%: Html.ActionLink("Edit", "Edit", new { /* id=Model.PrimaryKey */ }) %> |
    <%: Html.ActionLink("Back to List", "Index") %>
</p>

</asp:Content>
