<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Modelos.RespostaModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Create
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Create</h2>

<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>

<% using (Html.BeginForm()) { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend>RespostaModel</legend>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.id_Resposta) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.id_Resposta) %>
            <%: Html.ValidationMessageFor(model => model.id_Resposta) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.idTB_ENTREVISTADO) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.idTB_ENTREVISTADO) %>
            <%: Html.ValidationMessageFor(model => model.idTB_ENTREVISTADO) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.id_Questao) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.id_Questao) %>
            <%: Html.ValidationMessageFor(model => model.id_Questao) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Resposta) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Resposta) %>
            <%: Html.ValidationMessageFor(model => model.Resposta) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Item) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Item) %>
            <%: Html.ValidationMessageFor(model => model.Item) %>
        </div>

        <p>
            <input type="submit" value="Create" />
        </p>
    </fieldset>
<% } %>

<div>
    <%: Html.ActionLink("Back to List", "Index") %>
</div>

</asp:Content>
