<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Models.QuestaoModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Excluir Questão
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<br />

<h3>Excluir Questão</h3>
  <link href="../../Content/shThemeDefault.css" rel="stylesheet" type="text/css" />
    <link href="../../Content/shCore.css" rel="stylesheet" type="text/css" />
    <script src="../../Scripts/shCore.js" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>"
        type="text/javascript"></script>
    <script src="../../Scripts/shBrushJScript.js" type="text/javascript"></script>
    <script type="text/javascript">
        SyntaxHighlighter.defaults['toolbar'] = false;
        SyntaxHighlighter.all();
    </script>
    <script type="text/javascript" src="<%:Url.Content ("~/Scripts/shBrushCSharp.js")%>"></script>
    <script src="../../Content/syntaxhighlighter_3.0.83/scripts/shBrushJava.js" type="text/javascript"></script>
    <script src="../../Content/syntaxhighlighter_3.0.83/scripts/shBrushPhp.js" type="text/javascript"></script>
   
<h3>Deseja realmente excluir?</h3>
<fieldset>
    <legend></legend>
            <%: Html.HiddenFor(model => model.id_Questao) %>
            <%: Html.HiddenFor(model => model.id_Survey)%>
            <%: Html.HiddenFor(model => model.Tipo)%>

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
    <% int i = 0; %>
    <% foreach (var codigo in Model.codigos )
       { %>
          
                <% if (Model.Linguagem.Equals("Java"))
                  {  %>
                <div class="display-field">
                <pre class="brush:java">
                    <%: Html.DisplayFor(model => codigo.Codigo)%>
                    </pre>
                </div>
                <% } 
                    %>

              
                  <% if (Model.Linguagem.Equals("CSharp"))
                  {  %>   
                <div class="display-field">
                <pre class="brush:csharp">
                    <%: Html.DisplayFor(model => codigo.Codigo)%>
                    </pre>
                </div>
                <% } 
                    %>

                  <% if (Model.Linguagem.Equals("PHP"))
                  {  %>
                <div class="display-field">
                <pre class="brush:php">
                    <%: Html.DisplayFor(model => codigo.Codigo)%>
                    </pre>
                </div>
                <% } 
                    %>
          
            
          <% i++; %>
      <%  }  %>

    <div class="display-label">Linguagem</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Linguagem) %>
    </div>
</fieldset>
<% using (Html.BeginForm()) { %>
    <p>
        <input type="submit" value="Excluir" /> |
      
           <%: Html.ActionLink("Voltar", "ListaQuestoes", new { id = Model.id_Survey }, new { @class = "btn btn-default", @style = "text-decoration:none; color:#333" })%>
    </p>
<% } %>

</asp:Content>
