<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Models.QuestaoModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2></h2>     

<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>
<script type="text/javascript">
    SyntaxHighlighter.defaults['toolbar'] = false;
    SyntaxHighlighter.all();
</script>
	<script type="text/javascript" src="<%:Url.Content ("~/Scripts/shBrushCSharp.js")%>"></script>
    <script src="../../Scripts/addItem.js" type="text/javascript"></script>

<% using (Html.BeginForm()) { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend>QuestaoModel</legend>
        <% Html.HiddenFor(model => model.id_Survey, new { Value = ViewBag.id_Survey });%>
        <%--<div class="editor-field">
            <%: Html.HiddenFor(model => model.id_Questao)%>
            <%: Html.ValidationMessageFor(model => model.id_Questao) %>
        </div>--%>
        <%: Html.HiddenFor(model => model.id_Questao)%>
        <%--<div class="editor-label">
            <%: Html.LabelFor(model => model.idTB_ITENS_DA_QUESTAO) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.idTB_ITENS_DA_QUESTAO) %>
            <%: Html.ValidationMessageFor(model => model.idTB_ITENS_DA_QUESTAO) %>
        </div>--%>

        <%--<div class="editor-label">
            <%: Html.LabelFor(model => model.id_Survey) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.id_Survey) %>
            <%: Html.ValidationMessageFor(model => model.id_Survey) %>
        </div>--%>

     <%--   <div class="editor-label">
            <%: Html.LabelFor(model => model.Tipo) %>
        </div>
        <div class="editor-field">
          <%:Html.RadioButtonFor(model => model.Tipo, true, new { id = "SUBJETIVA" }) %> <label for="Ativo">SUBJETIVA</label>
         <%: Html.RadioButtonFor(model => model.Tipo, false, new { id = "OBJETIVA" })%> <label for="Inativo">OBJETIVA</label>
           <!--  Html.RadioButtonFor(model => model.Tipo) 
             Html.ValidationMessageFor(model => model.Tipo) -->
        </div>--%>
       
        <div class="editor-label">
            <%: Html.LabelFor(model => model.Pergunta) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Pergunta) %>
            <%: Html.ValidationMessageFor(model => model.Pergunta) %>
        </div>
        <!--<pre class="brush:csharp">
              
        </pre>-->
        <div class="editor-label">
            Itens Randômicos ?
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Randomica) %>
            <%: Html.ValidationMessageFor(model => model.Randomica) %>
        </div>

        <div class="editor-label">
            Resposta obrigatória ?
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Obrigatoria) %>
            <%: Html.ValidationMessageFor(model => model.Obrigatoria) %>
        </div>

        <div class="editor-label">
            Utilizar código ?
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.EhCodigo) %>
            <%: Html.ValidationMessageFor(model => model.EhCodigo) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Linguagem) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Linguagem) %>
            <%: Html.ValidationMessageFor(model => model.Linguagem) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Codigo) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Codigo)%>
            <%: Html.ValidationMessageFor(model => model.Codigo)%>
        </div>

        <fieldset>
          
        <% Html.RenderPartial("ListaItens",Model.itens); %>

       
           <%--<div class="editor-label">
              <a href="javascript: addItem();" > Adicionar item </a>
          </div>--%>

          <div class="item">
          
          </div>
     </fieldset>
        <p>
            <input type="submit" value="Create" />
        </p>
    </fieldset>
<% } %>

<div>
    <%: Html.ActionLink("Back to List", "Index") %>
</div>

</asp:Content>
