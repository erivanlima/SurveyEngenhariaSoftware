<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Models.QuestaoModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2></h2>
    
    
    <script src="../../Content/jquery-2.1.3.min.js" type="text/javascript"></script>
    <script src="../../Content/kartik-v-bootstrap-fileinput/js/fileinput.js" type="text/javascript"></script>
    <script src="../../Content/bootstrap-3.3.4-dist/js/bootstrap.min.js" type="text/javascript"></script>

    <script type="text/javascript">
        SyntaxHighlighter.defaults['toolbar'] = false;
        SyntaxHighlighter.all();
    </script>
    <script type="text/javascript" src="<%:Url.Content ("~/Scripts/shBrushCSharp.js")%>"></script>
    <script src="<%: Url.Content("~/Scripts/addItem.js") %>" type="text/javascript"></script>
    
    <% using (Html.BeginForm("Edit4", "Questao", FormMethod.Post, new { enctype = "multipart/form-data" }))
       { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend>QuestaoModel</legend>
        <%: Html.HiddenFor(model => model.id_Survey)%>
        <%: Html.HiddenFor(model => model.id_Questao)%>
        <%: Html.HiddenFor(model => model.Tipo)%>
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
        
        <div class="page-header">
		<input id="input-23" type="file" multiple="true"/>
		</div>
			
        <%--<div class="editor-field">
          <%--<%: Html.TextAreaFor(model => model.Codigo, new { htmlAttributes = new { @class = "form-control" } })%>
          <%: Html.EditorFor(model => model.Codigo)%>
        --%>
        <%: Html.ValidationMessageFor(model => model.Codigo)%>
        <div class="editor-label">
            <a href="javascript: addItem();">Adicionar Item </a>
        </div>
        <%--<div class="divimagem">
          
         </div>--%>
        <fieldset>
            <div class="editor-label">
                <h3>
                    Itens adicionados
                </h3>
                <%--<a href="javascript: addItem();" >  </a>--%>
            </div>
            <div class="item">
            </div>
        </fieldset>
        <p>
            <input type="submit" value="Salvar" />
        </p>
    </fieldset>
    <% } %>
    <p>
    </p>
    <div>
        <%: Html.ActionLink("Voltar", "ListaQuestoes", new { id = Model.id_Survey }, new { @class = "button" })%>
    </div>


    <script type="text/javascript">
        $("#input-23").fileinput({
            allowedFileExtensions: ["txt", "aspx", "java", "cs", "text"],
            showUpload: false,
            layoutTemplates: {
                main1: "{preview}\n" +
                "<div class=\'input-group {class}\'>\n" +
                "   <div class=\'input-group-btn\'>\n" +
                "       {browse}\n" +
                "       {remove}\n" +
                "   </div>\n" +
                "   {caption}\n" +
                "</div>"
            }
        });
    </script>
</asp:Content>
