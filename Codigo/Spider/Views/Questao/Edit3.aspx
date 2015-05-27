<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Models.QuestaoModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
    </h2>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>"
        type="text/javascript"></script>
    <script type="text/javascript">
        SyntaxHighlighter.defaults['toolbar'] = false;
        SyntaxHighlighter.all();
    </script>
    <script type="text/javascript" src="<%:Url.Content ("~/Scripts/shBrushCSharp.js")%>"></script>
    <script src="<%: Url.Content("~/Scripts/addItem.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/editObjcomImg.js") %>" type="text/javascript"></script>
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
            <img src="<%: Url.Action("GetImagem", "Questao", new { id = Model.id_Questao }) %>"
                id="imagem" alt="Imagem" height="300" />
            <img id="blah" src="~/App_data/uploads/abc.png" name="Img" height="300" alt="your image" />
            <%--<asp:Image ImageUrl= "~/App_data/uploads/abc.png" runat="server"/>--%>
        </div>
        <fieldset>
            
          
            <% int k = 0; %>
            <% foreach (var item in Model.itens)
               { %>
            <div class="display-field">
                Nome do item: <input id="itens_<%= k %>__Item" name="itens[<%= k %>].Item" type="text" value="<%= Html.DisplayFor(model => item.Item)%>" /> 
                <input value='Remover' class='remover' type='button'/>
            </div>
            <% k++;
               } %>
            <div class="item">
              
            </div>
        </fieldset>
        <p>
            <input class="btn btn-primary" type="submit" value=" Salvar " />
            <%: Html.ActionLink("Voltar", "ListaQuestoes", new { id = Model.id_Survey }, new { @class = "btn btn-default", @style = "text-decoration:none; color:#333" })%>
        </p>
    </fieldset>
    <% } %>
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
    <script>
        $('.remover').click(function () {

            $(this).closest('div').hide();
            $(this).closest('div').find("input[type = text]").val("");

        });
    </script>
</asp:Content>
