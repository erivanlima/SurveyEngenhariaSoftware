<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Models.SurveyModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Criar Novo Survey
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h3></h3>

    <script src="../../Content/jquery-1.10.js" type="text/javascript"></script>
    <script src="../../Content/bootstrap-3.3.4-dist/js/bootstrap.js" type="text/javascript"></script>
    <script src="../../Content/vitalets-bootstrap-datepicker-c7af15b/js/bootstrap-datepicker.js"
        type="text/javascript"></script>
    <script src="../../Content/vitalets-bootstrap-datepicker-c7af15b/js/locales/bootstrap-datepicker.pt-BR.js"
        type="text/javascript"></script>
    <link href="../../Content/bootstrap-3.3.4-dist/css/bootstrap.css" rel="stylesheet"
        type="text/css" />
    <link href="../../Content/vitalets-bootstrap-datepicker-c7af15b/css/datepicker.css"
        rel="stylesheet" type="text/css" />

    <link href="../../Content/Site.css" rel="stylesheet" type="text/css" />
    <link href="../../Content/bootstrap-3.3.4-dist/css/bootstrap.min.css" rel="stylesheet"
        type="text/css" />
    <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>"  type="text/javascript"></script>
    <%--<script src="<%: Url.Content("~/Scripts/jquery-ui-1.8.11.js") %>" type="text/javascript"></script>--%>
   
    <%--<link href="../../Content/jquery-ui.css" rel="stylesheet" type="text/css" />--%>
    
    <%--<script src="../../Scripts/bootstrap-datepicker.js" type="text/javascript"></script>--%>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#datepicker').datepicker({ 
            autoclose: true,
            format: 'dd/mm/yyyy',                
                language: 'pt-BR'
            });
        });
    </script>
    <% using (Html.BeginForm()) { %>
    <fieldset>
                <legend>Novo Survey</legend>
    
    <%: Html.ValidationSummary(true) %>
    <%: Html.HiddenFor(model => model.id_Responsavel, new { Value = ViewBag.id_Responsavel })%>
    
    <div class="editor-label">
        Titulo
    </div>
    <div class="editor-field">
        <%: Html.TextBoxFor(model => model.Titulo, new { @class = "form-control",style="width:auto", size=106 }) %>
        <%: Html.ValidationMessageFor(model => model.Titulo) %>
    </div>
    <div class="editor-label">
        Subtítulo
    </div>
    <div class="editor-field">
        <%: Html.TextBoxFor(model => model.Subtitulo, new { @class = "form-control", style = "width:auto", size = 106 })%>
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
        <%: Html.TextBoxFor(model => model.Data_fim, new { @id = "datepicker", @class = "form-control" })%>
        <%: Html.ValidationMessageFor(model => model.Data_fim) %>
    </div>
    <div class="editor-label">
        <%: Html.CheckBoxFor(model => model.flag_ativo, new { @checked = "checked" })%>
        Ativo
        <%: Html.ValidationMessageFor(model => model.flag_ativo) %>
    </div>
    <div class="editor-label">
        <%: Html.CheckBoxFor(model => model.RandomizeQuetsoes)%>
        Randomize Questões
        <%: Html.ValidationMessageFor(model => model.RandomizeQuetsoes) %>
    </div>
    <div class="editor-label">
        <%: Html.CheckBoxFor(model => model.UnicaResposta, new { Value = "true" })%>
        Única Resposta
        <%: Html.ValidationMessageFor(model => model.UnicaResposta) %>
    </div>
    <div class="editor-label">
        Senha de Acesso
    </div>
    <div class="editor-field">
        <%: Html.TextBoxFor(model => model.SenhaAcesso, new { @class = "form-control"})%>
        <%: Html.ValidationMessageFor(model => model.SenhaAcesso) %>
    </div>
    <br />
    <p>
        <input class="btn btn-primary" type="submit" value="Salvar" /> 
        <input type="button" class="btn btn-default" onclick="location.href='<%: Url.Action("Index", "Survey") %>'" value="Voltar"/>
 
    </p>
    <% } %>
    </fieldset>
</asp:Content>
