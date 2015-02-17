<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Models.SurveyModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Enviar Survey
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<br />

<h2>Enviar Survey</h2>

<fieldset>
    <legend></legend>

    <div class="display-label">Titulo do Survey</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Titulo) %>
    </div>

    <div class="display-label">Subtitulo</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Subtitulo) %>
    </div>

    <div class="display-label">Link</div>
    <div class="display-field">
        <p>
    <%: Html.ActionLink("http://localhost:1433/Responsavel/CreateViewTotal/" + Model.id_Survey, "CreateViewTotal", "Responsavel", new { id = Model.id_Survey })%> 
</p>
    </div>

</fieldset>


</asp:Content>
