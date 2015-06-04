<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Models.QuestaoModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Criar Questão
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<br />

<script src="../../Scripts/jquery-2.1.3.min.js" type="text/javascript"></script>
    <script src="../../Content/kartik-v-bootstrap-fileinput/js/fileinput.js" type="text/javascript"></script>
    <script src="../../Content/bootstrap-3.3.4-dist/js/bootstrap.min.js" type="text/javascript"></script>


<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/addItem.js") %>" type="text/javascript"></script>
    
    <% using (Html.BeginForm("CriarQuestaoCodObj", "Questao", FormMethod.Post, new { enctype = "multipart/form-data" }))
       { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend>Criar Questão</legend>
        <%: Html.HiddenFor(model => model.id_Survey, new { Value = ViewBag.id_Survey})%>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.Pergunta) %>
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.Pergunta, new { @class = "form-control", style = "width:auto", size = 106 })%>
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


        <div class="editor-label">
            <%: Html.LabelFor(model => model.Linguagem) %>
        </div>

        <%List<SelectListItem> items = new List<SelectListItem>();
          items.Add(new SelectListItem
          {
              Text = "Java",
              Value = "Java"
          });
          items.Add(new SelectListItem
          {
              Text = "CSharp",
              Value = "CSharp",
              Selected = true
          });
          items.Add(new SelectListItem
          {
              Text = "PHP",
              Value = "PHP"
          }); %>

        <div class="editor-field">
            <%: Html.DropDownListFor((model => model.Linguagem), new SelectList(items, "Value", "Text"))%>
            <%: Html.ValidationMessageFor(model => model.Linguagem) %>
        </div>
        
        <div class="editor-label">
            Código
        </div>
        
        <div class="page-header">
		<input id="input-23" type="file" name="files" multiple="true"/>
		</div>
        <%: Html.ValidationMessageFor(model => model.codigos)%>
        <div class="editor-label">
            <a href="javascript: addItem();">Adicionar Item </a>
        </div>
        <fieldset>
            <div class="editor-label">
                <h3>
                    Itens adicionados
                </h3>
                <%--<a href="javascript: addItem();" >  </a>--%>
            </div>
            <div class="item">
            </div>
            <br />
        </fieldset>
        <p>
            <input class="btn btn-primary" type="submit" value="Salvar" />
            <%: Html.ActionLink("Voltar", "ModeloQuestoes", new { id = ViewBag.id_Survey }, new { @class = "btn btn-default", @style = "text-decoration:none; color:#333" })%>
        </p>
    </fieldset>
    <% } %>


    <script type="text/javascript">
        $("#input-23").fileinput({
            allowedFileExtensions: ["txt", "aspx", "java", "cs", "text", "js", "php"],
            showUpload: false,
            browseLabel: "Selecionar Código",
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
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>

