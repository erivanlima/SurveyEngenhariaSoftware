<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Modelos.QuestaoModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Edit
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Edit</h2>

<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>

<% using (Html.BeginForm()) { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend>QuestaoModel</legend>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.id_Questao) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.id_Questao) %>
            <%: Html.ValidationMessageFor(model => model.id_Questao) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.idTB_ITENS_DA_QUESTAO) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.idTB_ITENS_DA_QUESTAO) %>
            <%: Html.ValidationMessageFor(model => model.idTB_ITENS_DA_QUESTAO) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.id_Survey) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.id_Survey) %>
            <%: Html.ValidationMessageFor(model => model.id_Survey) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Tipo) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Tipo) %>
            <%: Html.ValidationMessageFor(model => model.Tipo) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Pergunta) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Pergunta) %>
            <%: Html.ValidationMessageFor(model => model.Pergunta) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Randomica) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Randomica) %>
            <%: Html.ValidationMessageFor(model => model.Randomica) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Obrigatoria) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Obrigatoria) %>
            <%: Html.ValidationMessageFor(model => model.Obrigatoria) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Codigo) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Codigo) %>
            <%: Html.ValidationMessageFor(model => model.Codigo) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Linguagem) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Linguagem) %>
            <%: Html.ValidationMessageFor(model => model.Linguagem) %>
        </div>

        <p>
            <input type="submit" value="Save" />
        </p>
    </fieldset>
<% } %>

<div>
    <%: Html.ActionLink("Back to List", "Index") %>
</div>

</asp:Content>
