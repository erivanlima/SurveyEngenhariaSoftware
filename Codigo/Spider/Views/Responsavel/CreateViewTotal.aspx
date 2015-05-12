<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Models.SurveyModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Visualizar Survey
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Visualizar Survey</h2>
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
    <% using (Html.BeginForm())
       { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <fieldset>
            <%: Html.HiddenFor(model => model.id_Survey, new { Value = ViewBag.id_Survey })%>
            <td>
                <%: Html.LabelFor(model => Model.Titulo) %>
            </td>
            <div class="display-field">
                <%: Html.DisplayFor(model => Model.Titulo) %>
            </div>
            <td>
                <%: Html.LabelFor(model => Model.Subtitulo) %>
            </td>
            <div class="display-field">
                <%: Html.DisplayFor(model => Model.Subtitulo)%>
            </div>
            <fieldset>
                <% int i = 0; %>
                <% foreach (var Questao in Model.questoes)
                   { %>
                <fieldset>
                    <input class="valid" value="<%= Questao.id_Questao %>" id="questoes_<%= i %>__id_Questao"
                        name="questoes[<%= i %>].id_Questao" type="hidden" />
                    <input class="valid" value="<%= Questao.Tipo %>" id="questoes_<%= i %>__Tipo" name="questoes[<%= i %>].Tipo"
                        type="hidden" />
                    <%: Html.HiddenFor(model => Questao.id_Questao)%>
                    <div class="display-field">
                        <%: Html.DisplayFor(model => Questao.Pergunta)%>
                    </div>
                    <% if (Questao.EhCodigo)
                       {  %>
                    <% foreach (var codigo in Model.questoes[i].codigos)
                       { %>
                    <% if (Questao.Linguagem.Equals("CSharp"))
                       {  %>
                    <pre class="brush:csharp">
                                <%: Html.DisplayFor(model => codigo.Codigo)%>
                            </pre>
                    <% }  
                    %>
                    <% if (Questao.Linguagem.Equals("Java"))
                       {  %>
                    <pre class="brush:java">
                            <%: Html.DisplayFor(model => codigo.Codigo)%>
                            </pre>
                    <% } 
                    %>
                    <% if (Questao.Linguagem.Equals("PHP"))
                       {  %>
                    <pre class="brush:php">
                            <%: Html.DisplayFor(model => codigo.Codigo)%>
                            </pre>
                    <% 
                       }  %>
                    <% 
                       }  %>
                    <% 
                       }  %>
                    <% if (Questao.Img != null)
                       {  %>
                    <div class="imagem">
                        <img src="<%: Url.Action("GetImagem", "Questao", new { id = Model.questoes[i].id_Questao }) %>"
                            id="imagem" alt="Imagem" height="300" />
                    </div>
                    <% } %>
                    <% if (Questao.Tipo.Equals("OBJETIVA"))
                       {  %>
                    <fieldset>
                        <% foreach (var item in Model.questoes[i].itens)
                           { %>
                        <% if (Questao.Escolha)
                           {  %>
                        <div class="display-field">
                            <input id="questoes_<%= i %>__respostas_Item" name="meucheck" type="checkbox" value="<%= Html.DisplayFor(model => item.idTB_ITENS_DA_QUESTAO ) %>" />
                            <%: Html.DisplayFor(model => item.Item)%>
                            <%--id="questoes_<%= i %>__respostas_Item"--%>
                        </div>
                        <% }
                           else
                           { %>
                        <div class="display-field">
                            <input name="questoes[<%= i %>].respostas.Item" type="radio" value="<%= Html.DisplayFor(model => item.Item)%>" />
                            <%: Html.DisplayFor(model => item.Item)%>
                        </div>
                        <% } %>
                        <% 
                           } %>
                    </fieldset>
                    <% }
                       else
                       {  %>
                    <fieldset>
                        Resposta:
                        <input class="text-box single-line" id="questoes_<%= i %>__respostas__Resposta" name="questoes[<%= i %>].respostas.Resposta"
                            value="" type="text" />
                    </fieldset>
                    <% } %>
               <% if (Questao.TemOutro)
                       {  %>
                    <% if (Questao.Escolha)
                       {  %>
                        <input type="checkbox" />
                            Outro (opcional):
                            <input class="text-box single-line" name="questoes[<%= i %>].respostas.OutroTxt"
                            value="" type="text" />
                    <% }
                       else
                       {%>
                        <input name="questoes[<%= i %>].respostas.Item" " type="radio"  />
                        Outro (opcional):
                        <input name="questoes[<%= i %>].respostas.OutroTxt" type="text" value="" />
                        <% }
                             %>
                  <% } 
                       %>
                </fieldset>
                <% i++;
                   } %>
            </fieldset>
            <p>
                <input type="submit" value="Salvar" />
            </p>
        </fieldset>
    </fieldset>
    <% } %>
    <div>
        <%: Html.ActionLink("Voltar", "Index", null,new { @class = "button" })%>
    </div>
</asp:Content>
