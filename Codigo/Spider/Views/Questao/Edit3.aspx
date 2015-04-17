<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Models.QuestaoModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
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
    <script src="<%: Url.Content("~/Scripts/addItem.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/editItem.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/addObjcomImg.js") %>" type="text/javascript"></script>
    
    <% using (Html.BeginForm("Edit3", "Questao", FormMethod.Post, new { enctype = "multipart/form-data" }))
       { %>
    <%: Html.ValidationSummary(true) %>
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
            Imagem
        </div>
        
        <div class="divimagem">
        <img src="<%: Url.Action("GetImagem", "Questao", new { id = Model.id_Questao }) %>" id="imagem" alt="Imagem" height="300"/>
        <img id="blah" src="~/App_data/uploads/abc.png" name ="Img" height="300" alt="your image" />
        <%--<asp:Image ImageUrl= "~/App_data/uploads/abc.png" runat="server"/>--%>
        </div>
        <fieldset>
            <div class="editor-label">
                <h3>
                    Itens adicionados
                </h3>
                
                <a href="javascript: addItem();" >  </a>
            </div>
            <div class="item">
            <%: Html.ActionLink("Editar Itens", "ListaItens", "Itens", new { id=Model.id_Questao },null)%>
            </div>

        </fieldset>
        <p>
            <input class="btn btn-primary" type="submit" value="Salvar"/>
        </p>
    </fieldset>
    <% } %>
    <p>
    </p>
    <div>
        <%: Html.ActionLink("Voltar", "ListaQuestoes", new { id = Model.id_Survey }, new { @class = "button" })%>
    </div>

    <script type="text/javascript">
    function readURL(input) {

        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#blah').attr('src', e.target.result);
            }

            reader.readAsDataURL(input.files[0]);
        }
    }
    </script>
  
</asp:Content>
