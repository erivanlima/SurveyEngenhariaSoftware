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
<script src="<%: Url.Content("~/Scripts/addItem.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/addObjcomImg.js") %>" type="text/javascript"></script>

<script type="text/javascript">
    /* The uploader form */
    $(function () {
        $(":file").change(function () {
            if (this.files && this.files[0]) {
                var reader = new FileReader();

                reader.onload = imageIsLoaded;
                reader.readAsDataURL(this.files[0]);
            }
        });
    });

    function imageIsLoaded(e) {
        $('#myImg').attr('src', e.target.result);
        $('#yourImage').attr('src', e.target.result);
    };

</script>

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
        <div class="editor-field">
          <%: Html.TextAreaFor(model => model.Codigo, new { htmlAttributes = new { @class = "form-control" } })%>

            <%: Html.EditorFor(model => model.Codigo)%>
            <input type="file" name="file" />
            <%: Html.ValidationMessageFor(model => model.Codigo)%>
        </div>

        <div class="editor-label">
           <a href="javascript: addItem();" > Adicionar Item </a>
         </div>

         <%--<div class="divimagem">
          
         </div>--%>
        <fieldset>
         <div class="editor-label">
         <h3>Itens adicionados </h3>
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

<div>
    <%: Html.ActionLink("Back to List", "Index") %>
</div>

</asp:Content>
