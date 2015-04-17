<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Models.SurveyModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Editar Survey
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jquery-ui-1.8.11.js") %>" type="text/javascript"></script>
    <fieldset>
        <legend>Editar Survey</legend>
        <% using (Html.BeginForm())
           { %>
        <%: Html.ValidationSummary(true) %>
        <%: Html.HiddenFor(model => model.id_Survey)%>
        <%: Html.HiddenFor(model => model.id_Responsavel)%>
        <div class="editor-label">
            Titulo
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.Titulo, new { @class = "form-control", style = "width:auto", size = 106 })%>
            <%: Html.ValidationMessageFor(model => model.Titulo) %>
        </div>
        <div class="editor-label">
            Subtitulo
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.Subtitulo, new { @class = "form-control", style = "width:auto", size = 106 })%>
            <%: Html.ValidationMessageFor(model => model.Subtitulo) %>
        </div>
        <%--<div class="editor-label">
            Data Criado
        </div>--%>
        <div class="editor-field">
            <%: Html.HiddenFor(model => model.Data_Criacao) %>
            <%: Html.ValidationMessageFor(model => model.Data_Criacao) %>
        </div>
        <div class="editor-label">
            Data Fim
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.Data_fim, new { @class = "datepicker" })%>
            <%: Html.ValidationMessageFor(model => model.Data_fim) %>
        </div>
        <div class="editor-label">
            Ativo
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.flag_ativo) %>
            <%: Html.ValidationMessageFor(model => model.flag_ativo) %>
        </div>
        <div class="editor-label">
            Randomize Questões
        </div>
        <div class="editor-field">
            <%: Html.CheckBoxFor(model => model.RandomizeQuetsoes, new { Value = "true" })%>
            <%: Html.ValidationMessageFor(model => model.RandomizeQuetsoes) %>
        </div>
        <div class="editor-label">
            Única Resposta
        </div>
        <div class="editor-field">
            <%: Html.CheckBoxFor(model => model.UnicaResposta, new { Value = "true" })%>
            <%: Html.ValidationMessageFor(model => model.UnicaResposta) %>
        </div>
        <div class="editor-label">
            Senha de Acesso
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.SenhaAcesso)%>
            <%: Html.ValidationMessageFor(model => model.SenhaAcesso) %>
        </div>
        <br />
    <p>
        <input class="btn btn-primary" type="submit" value="Salvar"/>
    </p>
    </fieldset>
    <% } %>
    <div>
        <%: Html.ActionLink("Voltar", "Index") %>
    </div>
</asp:Content>
