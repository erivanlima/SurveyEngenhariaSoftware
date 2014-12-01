<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Modelos.Itens_da_QuestaoModel>" %>

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
        <legend>Itens_da_QuestaoModel</legend>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.idTB_ITENS_DA_QUESTAO) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.idTB_ITENS_DA_QUESTAO) %>
            <%: Html.ValidationMessageFor(model => model.idTB_ITENS_DA_QUESTAO) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.ItemA) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.ItemA) %>
            <%: Html.ValidationMessageFor(model => model.ItemA) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.ItemB) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.ItemB) %>
            <%: Html.ValidationMessageFor(model => model.ItemB) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.ItemC) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.ItemC) %>
            <%: Html.ValidationMessageFor(model => model.ItemC) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.ItemD) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.ItemD) %>
            <%: Html.ValidationMessageFor(model => model.ItemD) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.ItemE) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.ItemE) %>
            <%: Html.ValidationMessageFor(model => model.ItemE) %>
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
