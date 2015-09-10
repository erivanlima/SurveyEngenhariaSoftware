<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Models.Itens_da_QuestaoModel>" %>

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
        <legend>Itens_da_QuestaoModel</legend>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.idtb_itens_da_questao) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.idtb_itens_da_questao) %>
            <%: Html.ValidationMessageFor(model => model.idtb_itens_da_questao) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.id_Questao) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.id_Questao) %>
            <%: Html.ValidationMessageFor(model => model.id_Questao) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Item) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Item) %>
            <%: Html.ValidationMessageFor(model => model.Item) %>
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

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>

