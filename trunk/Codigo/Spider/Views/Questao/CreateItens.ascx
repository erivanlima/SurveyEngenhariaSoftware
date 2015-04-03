<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Models.Itens_da_QuestaoModel>" %>

<script src="<%: Url.Content("~/Scripts/jquery-1.5.1.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>

<% using (Html.BeginForm()) { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend>Itens_da_QuestaoModel</legend>

        <%--<div class="editor-label">
            <%: Html.LabelFor(model => model.idTB_ITENS_DA_QUESTAO) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.idTB_ITENS_DA_QUESTAO) %>
            <%: Html.ValidationMessageFor(model => model.idTB_ITENS_DA_QUESTAO) %>
        </div>--%>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.id_Questao) %>
            
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.id_Questao) %>
            <%--<% Html.DisplayFor(model => model.id_Questao, new { Value = ViewBag.id_Questao });%>--%>
        </div>

        <div class="editor-label" style="width: 316px">
            <%: Html.LabelFor(model => model.Item) %>
        </div>
        <div class="editor-field" style="width: 816px">
            <%: Html.EditorFor(model => model.Item) %>
            <%: Html.ValidationMessageFor(model => model.Item) %>
        </div>

        <p>
            &nbsp;<input type="submit" value="Create" style="width: 129px; height: 29px" /></p>
    </fieldset>
<% } %>

<div>
    <%: Html.ActionLink("Back to List", "Index") %>
</div>
