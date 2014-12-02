<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Models.SurveyModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Details</h2>

<fieldset>
    <legend>SurveyModel</legend>

    <div class="display-label">id_Survey</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.id_Survey) %>
    </div>

    <div class="display-label">id_Responsavel</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.id_Responsavel) %>
    </div>

    <div class="display-label">Titulo</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Titulo) %>
    </div>

    <div class="display-label">Subtitulo</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Subtitulo) %>
    </div>

    <div class="display-label">Data_Criacao</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Data_Criacao) %>
    </div>

    <div class="display-label">Data_fim</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Data_fim) %>
    </div>

    <div class="display-label">flag_ativo</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.flag_ativo) %>
    </div>
</fieldset>
<p>
    <%: Html.ActionLink("Edit", "Edit", new { /* id=Model.PrimaryKey */ }) %> |
    <%: Html.ActionLink("Back to List", "Index") %>
</p>

</asp:Content>
