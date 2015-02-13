<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Models.QuestaoModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Excluir Questão
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<br />

<h3>Excluir Questão</h3>

<h3>Deseja realmente excluir?</h3>
<fieldset>
    <legend></legend>
            <%: Html.HiddenFor(model => model.id_Questao) %>
            <%: Html.HiddenFor(model => model.id_Survey)%>
            <%: Html.HiddenFor(model => model.idTB_ITENS_DA_QUESTAO)%>
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
<% using (Html.BeginForm()) { %>
    <p>
        <input type="submit" value="Excluir" /> |
        <%: Html.ActionLink("Voltar", "Index", new { @class = "button" })%>
    </p>
<% } %>

</asp:Content>
