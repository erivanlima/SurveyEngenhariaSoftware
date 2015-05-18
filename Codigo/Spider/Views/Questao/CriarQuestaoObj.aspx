<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Models.QuestaoModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    CriarQuestaoObj
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>CriarQuestaoObj</h2>

<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>
<script src="../../Scripts/addItem.js" type="text/javascript"></script>

<% using (Html.BeginForm()) { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend>Criar Questão</legend>
        <div class="editor-label">
            <%: Html.HiddenFor(model => model.id_Survey, new { Value = ViewBag.id_Survey })%>
        </div>
        
        <%: Html.HiddenFor(model => model.Tipo)%>

         <div class="editor-label">
            <%: Html.LabelFor(model => model.Pergunta) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Pergunta) %>
            <%: Html.ValidationMessageFor(model => model.Pergunta) %>
        </div>

        <div class="editor-label">
            Itens Randômicos?
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Randomica) %>
            <%: Html.ValidationMessageFor(model => model.Randomica) %>
        </div>
        <div class="editor-label">
            Resposta obrigatória?
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Obrigatoria) %>
            <%: Html.ValidationMessageFor(model => model.Obrigatoria) %>
        </div>
        <div class="editor-label">
            Múltipla escolha?
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Escolha) %>
            <%: Html.ValidationMessageFor(model => model.Escolha) %>
        </div>
       

        <div class="editor-label">
            Adicionar opção "outro" ?
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.TemOutro) %>
            <%: Html.ValidationMessageFor(model => model.TemOutro) %>
        </div>


        <fieldset>
            <div class="editor-label">
                <a href="javascript: addItem();">Adicionar item </a>
            </div>
            
            <div class="item">
            </div>
        </fieldset>
        <p>
            <input type="submit" value="Salvar" />
             <%: Html.ActionLink("Voltar", "ModeloQuestoes", new { id = ViewBag.id_Survey }, new { @class = "btn btn-default", @style = "text-decoration:none; color:#333" })%>
        </p>
    </fieldset>
<% } %>



</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>

