<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Models.SurveyModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Criar Novo Survey
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<br />

<h2>Criar Novo Survey</h2>

<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>

<link href="../Content/jquery-ui.css" rel="stylesheet" type="text/css" />
  <script src="<%: Url.Content("~/Scripts/jquery-ui-1.8.11.js") %>" type="text/javascript"></script>
  <link rel="stylesheet" href="/resources/demos/style.css" />

<script type="text/javascript">
     $(document).ready(function () {
         $('.datepicker').datepicker({ dateFormat: "dd/mm/yy",});
     });
    </script>

<div id="formulario">
<% using (Html.BeginForm()) { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend></legend>
        
        <%: Html.HiddenFor(model => model.id_Responsavel, new { Value = ViewBag.id_Responsavel })%>
        <%--<div class="editor-label">
            <%: Html.LabelFor(model => model.id_Responsavel) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.id_Responsavel) %>
            <%: Html.ValidationMessageFor(model => model.id_Responsavel) %>
        </div>--%>

        <div class="editor-label">
            Titulo
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Titulo) %>
            <%: Html.ValidationMessageFor(model => model.Titulo) %>
        </div>

        <div class="editor-label">
            Subtitulo
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Subtitulo) %>
            <%: Html.ValidationMessageFor(model => model.Subtitulo) %>
        </div>

        <%--<div class="editor-label">
            Data Criado
        </div>--%>
        <div class="editor-field">
            <%: Html.HiddenFor(model => model.Data_Criacao, new { Value = DateTime.Now.ToShortDateString() })%>
            <%: Html.ValidationMessageFor(model => model.Data_Criacao) %>
        </div>

        <div class="editor-label">
            Data de Encerramento
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.Data_fim, new { @class = "datepicker" }) %>
            <%: Html.ValidationMessageFor(model => model.Data_fim) %>
        </div>

        <div class="editor-label">
            Ativo
        </div>
        <div class="editor-field">
            <%: Html.CheckBoxFor(model => model.flag_ativo, new { Value = "true" })%>
            <%: Html.ValidationMessageFor(model => model.flag_ativo) %>
        </div>

        <p>
            <input type="submit" value="Salvar" />
        </p>
    </fieldset>
<% } %>

<div>
    <%: Html.ActionLink("Voltar", "Index", "Survey")%>
</div>
</div>
</asp:Content>
