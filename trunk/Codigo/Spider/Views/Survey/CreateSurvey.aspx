﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Models.SurveyModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    CreateSurvey
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<br />

<h2>CreateSurvey</h2>

<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>

<% using (Html.BeginForm()) { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend>SurveyModel</legend>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.id_Responsavel) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.id_Responsavel) %>
            <%: Html.ValidationMessageFor(model => model.id_Responsavel) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Titulo) %>
        </div>
        <div class="editor-field">
            Titulo
            <%: Html.ValidationMessageFor(model => model.Titulo) %>
        </div>

        <div class="editor-label">
            Subtitulo
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Subtitulo) %>
            <%: Html.ValidationMessageFor(model => model.Subtitulo) %>
        </div>

        <div class="editor-label">
            Data Criado
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Data_Criacao) %>
            <%: Html.ValidationMessageFor(model => model.Data_Criacao) %>
        </div>

        <div class="editor-label">
            Data de Encerramento
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Data_fim) %>
            <%: Html.ValidationMessageFor(model => model.Data_fim) %>
        </div>

        <div class="editor-label">
            Ativo
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.flag_ativo) %>
            <%: Html.ValidationMessageFor(model => model.flag_ativo) %>
        </div>

        <p>
            <input type="submit" value="Create" />
        </p>
    </fieldset>
<% } %>

<div>
    <%: Html.ActionLink("Voltar", "Index", new { @class = "button" },null)%>
</div>

</asp:Content>
