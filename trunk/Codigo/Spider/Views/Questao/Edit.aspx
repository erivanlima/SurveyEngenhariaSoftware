<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Models.QuestaoModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
Questão
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>    </h2>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>"
        type="text/javascript"></script>
    <script type="text/javascript">
        SyntaxHighlighter.defaults['toolbar'] = false;
        SyntaxHighlighter.all();
    </script>
    <script type="text/javascript" src="<%:Url.Content ("~/Scripts/shBrushCSharp.js")%>"></script>
    <script src="../../Scripts/addItem.js" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/addItem.js") %>" type="text/javascript"></script>
    <% using (Html.BeginForm())
       { %>
    <%: Html.ValidationSummary(true) %>
    <div>
    <fieldset>
        <legend>Questão</legend>
        <%: Html.HiddenFor(model => model.id_Survey)%>
        <%: Html.HiddenFor(model => model.id_Questao)%>
        <%: Html.HiddenFor(model => model.Tipo)%>
       
        <div class="editor-label">
            <%: Html.LabelFor(model => model.Pergunta) %>
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.Pergunta, new { @class = "form-control", style = "width:auto", size = 106 })%>
            <%: Html.ValidationMessageFor(model => model.Pergunta) %>
        </div>
       
        <div class="editor-label">
            Resposta obrigatória ?
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Obrigatoria) %>
            <%: Html.ValidationMessageFor(model => model.Obrigatoria) %>
        </div>
       
       
    </fieldset>
    <br />
    <p>
        <input class="btn btn-primary" type="submit" value="Salvar"/>
        <%: Html.ActionLink("Voltar", "ListaQuestoes", new { id = Model.id_Survey }, new { @class = "btn btn-default", @style = "text-decoration:none; color:#333" })%>
    </p>
    <% } %>
    <p>
    </p>
    
    </div>
</asp:Content>
