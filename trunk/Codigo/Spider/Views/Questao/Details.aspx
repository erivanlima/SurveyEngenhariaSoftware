<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Models.QuestaoModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Detalhes
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<br />

<h2>Detalhes Questão</h2>

<fieldset>
    <legend>QuestaoModel</legend>

    <div class="display-label">id_Questao</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.id_Questao) %>
    </div>

    <div class="display-label">idTB_ITENS_DA_QUESTAO</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.idTB_ITENS_DA_QUESTAO) %>
       
        <div class="display-label">item</div>
        <div class="display-field">
            <%: Html.DisplayFor(model => model.itens) %>
        </div>
    </div>
        
    <div class="display-label">id_Survey</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.id_Survey) %>
    </div>

    <div class="display-label">Tipo</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Tipo) %>
    </div>

    <div class="display-label">Pergunta</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Pergunta) %>
    </div>

    <div class="display-label">Randomica</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Randomica) %>
    </div>

    <div class="display-label">Obrigatoria</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Obrigatoria) %>
    </div>

    <div class="display-label">Codigo</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Codigo) %>
    </div>

    <div class="display-label">Linguagem</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Linguagem) %>
    </div>
    
</fieldset>
<p>
    <%: Html.ActionLink("Editar", "Edit", new { id = Model.id_Questao }, new { @class = "button" })%> |
    <%: Html.ActionLink("Voltar", "Index") %>
</p>

</asp:Content>
