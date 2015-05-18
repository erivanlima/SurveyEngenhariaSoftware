<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Models.QuestaoModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>"
        type="text/javascript"></script>
    <script type="text/javascript" src="<%:Url.Content ("~/Scripts/shBrushCSharp.js")%>"></script>
    <script src="../../Scripts/addItem.js" type="text/javascript"></script>
    <script src="../../Scripts/addItemAux.js" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/addItem.js") %>" type="text/javascript"></script>
    <% using (Html.BeginForm())
       { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend>Nova Questão</legend>
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
            Permitir mais de uma resposta a esta pergunta ?
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Escolha) %>
            <%: Html.ValidationMessageFor(model => model.Escolha) %>
        </div>
        <fieldset>
        
            <div class="editor-label">
                <a href="javascript: addItemAux();">Adicionar item </a>
            </div>
            <div class="AdditemAux">
            </div>
            
            <% int k = 0; %>
            <% foreach (var item in Model.itens)
               { %>
            <div class="display-field">
                Nome do item: <input id="itens_<%= k %>__Item" name="itens[<%= k %>].Item" type="text" value="<%= Html.DisplayFor(model => item.Item)%>" /> 
                <input value='Remover' class='remover' type='button'/>
            </div>
            <% k++;
               } %>
        </fieldset>
        <p>
            <input type="submit" value="Salvar" />
          
            <%: Html.ActionLink("Voltar", "ListaQuestoes", new { id = Model.id_Survey }, new { @class = "btn btn-default", @style = "text-decoration:none; color:#333" })%>
        </p>
    </fieldset>
    <% } %>
    <p>
    </p>
    
    <script>
        $('.remover').click(function () {

            $(this).closest('div').hide();
            $(this).closest('div').find("input[type = text]").val("");

        });
    </script>
</asp:Content>
