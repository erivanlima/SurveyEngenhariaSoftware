<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Models.SurveyModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Excluir
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<br />

<h2>Excluir</h2>

<h3>Deseja realmente remover?</h3>
<fieldset>
    <legend>SurveyModel</legend>

    <div class="display-label">Titulo do Survey</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Titulo) %>
    </div>

    <div class="display-label">Subtitulo</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Subtitulo) %>
    </div>

    <div class="display-label">Data de Criação</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Data_Criacao) %>
    </div>

    <div class="display-label">Data de Encerramento</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Data_fim) %>
    </div>

    <div class="display-label">Ativo</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.flag_ativo) %>
    </div>
</fieldset>
<% using (Html.BeginForm()) { %>
    <p>
        <input type="submit" value="Excluir" /> |
        <%: Html.ActionLink("Voltar", "Index","Survey") %>
    </p>
<% } %>

</asp:Content>
