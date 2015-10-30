<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Models.SurveyModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Responder Survey
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Responder Survey</h2>
    <link href="../../Content/shThemeDefault.css" rel="stylesheet" type="text/css" />
    <link href="../../Content/shCore.css" rel="stylesheet" type="text/css" />
    <script src="../../Scripts/shCore.js" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
    <script src="../../Scripts/jquery2.1.0.js" type="text/javascript"></script>
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
    <script type="text/javascript">
        function myFunction() {


            var checkboxs = document.getElementsByName("meucheck");
            var okay = false;
            for (var i = 0, l = checkboxs.length; i < l; i++) {
                if (checkboxs[i].checked) {
                    okay = true;
                }
            }
            if (okay) alert("Thank you for checking a checkbox");
            else alert("Please check a checkbox");

        }   

    </script>
 <script type="text/javascript">
     function Test() {
         //            var tmpvar = 'meucheckid[' + i + ']';
         var checkboxs = document.getElementsByName('meucheck');
         var okay = false;
         for (var i = 0, l = checkboxs.length; i < l; i++) {
             if (checkboxs[i].checked) {
                 okay = true;
             }
         }
         if (okay) alert("Thank you for checking a checkbox");
         else alert("Please check a checkbox");
     }
</script>
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
                <% int j = 0; %>
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
                       { %>
                    <fieldset>
                    
                        <% foreach (var item in Model.questoes[i].itens)
                           { %>
                        <% if (Questao.Obrigatoria)
                           {  %>
                        <% if (Questao.Escolha)
                           {  %>
                        
                            <div class="display-field " >
                              <input id="meucheckid" name="meucheck" type="checkbox" value="<%= Html.DisplayFor(model => item.idtb_itens_da_questao ) %>" />
                              <%: Html.DisplayFor(model => item.Item)%>
                              <input name="questoes[<%= i %>].Escolha" type="hidden" value="true" />
                             <%j++; %> 
                            </div>
                        
                        
                        <% }
                           else
                           { %>
                        <div class="display-field">
                            <input name="questoes[<%= i %>].respostas.Item" type="radio" value="<%= Html.DisplayFor(model => item.Item)%>"
                                required="required" />
                            <%: Html.DisplayFor(model => item.Item)%>
                        </div>
                        <% } 
                        %>
                        <% }
                           else
                           { %>
                        <% if (Questao.Escolha)
                           {  %>
                        <div class="display-field">
                            <input  id="questoes_<%= i %>__respostas_Item" name="meucheck" type="checkbox" value="<%= Html.DisplayFor(model => item.idtb_itens_da_questao ) %>" />
                            <%: Html.DisplayFor(model => item.Item)%>
                            <input name="questoes[<%= i %>].Escolha" type="hidden" value="true" />
                        </div>
                        <% }
                           else
                           { %>
                        <div class="display-field">
                            <input name="questoes[<%= i %>].respostas.Item" type="radio" value="<%= Html.DisplayFor(model => item.Item)%>" />
                            <%: Html.DisplayFor(model => item.Item)%>
                        </div>
                        <% 
                           } %>
                        <% 
                           } %>
                        <% 
                         } %>
                    </fieldset>
                    <% }
                       else
                       {  %>
                    <fieldset>
                        Resposta:
                        <% if (Questao.Obrigatoria)
                           {  %>
                        <input class="syntaxhighlighter" id="questoes_<%= i %>__respostas__Resposta" name="questoes[<%= i %>].respostas.Resposta"
                            value="" type="text" required="required" />
                        <% }
                           else
                           {  %>
                        <input class="text-box single-line" name="questoes[<%= i %>].respostas.Resposta"
                            value="" type="text" />
                        <% }
                        %>
                    </fieldset>
                    <% } 
                    %>
                    <% if (Questao.TemOutro)
                       {  %>
                    <% if (Questao.Escolha)
                       {  %>
                    <input type="checkbox" />
                    Outro (opcional):
                    <input class="text-box single-line" name="questoes[<%= i %>].respostas.OutroTxt"
                        value="" type="text" />
                    <input name="questoes[<%= i %>].TemOutro" type="hidden" value="true" />
                    <% }
                       else
                       {%>
                    <input name="questoes[<%= i %>].respostas.Item" type="radio" />
                    Outro (opcional):
                    <input name="questoes[<%= i %>].respostas.OutroTxt" type="text" value="" />
                    <input name="questoes[<%= i %>].TemOutro" type="hidden" value="true" />
                    <% }
                    %>
                    <% } 
                    %>
                </fieldset>
                <% i++; 
                   } %>

            </fieldset>
            <p>
                <input type="submit" value="Salvar"  onclick="Test()" />
            </p>
        </fieldset>
    </fieldset>
    <% } %>
    <div>
        <%: Html.ActionLink("Voltar", "EnviarSurvey","Survey", null,new { @class = "button" })%>
    </div>
</asp:Content>