<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Models.SurveyModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Editar Survey
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<br />

<h2>Editar Survey</h2>

<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>

<% using (Html.BeginForm()) { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend>SurveyModel</legend>

            <%: Html.HiddenFor(model => model.id_Survey)%>
            <%: Html.HiddenFor(model => model.id_Responsavel)%>

       <div class="editor-label">
            <%: Html.LabelFor(model => model.Titulo) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Titulo) %>
            <%: Html.ValidationMessageFor(model => model.Titulo) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Subtitulo) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Subtitulo) %>
            <%: Html.ValidationMessageFor(model => model.Subtitulo) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Data_Criacao) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Data_Criacao) %>
            <%: Html.ValidationMessageFor(model => model.Data_Criacao) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Data_fim) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Data_fim) %>
            <%: Html.ValidationMessageFor(model => model.Data_fim) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.flag_ativo) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.flag_ativo) %>
            <%: Html.ValidationMessageFor(model => model.flag_ativo) %>
        </div>

        <p>
            <input type="submit" value="Salvar" />
        </p>
    </fieldset>
<% } %>

<div>
    <%: Html.ActionLink("Voltar", "Index") %>
</div>

</asp:Content>
