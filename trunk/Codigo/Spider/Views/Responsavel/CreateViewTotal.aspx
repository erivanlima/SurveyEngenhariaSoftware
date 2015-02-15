<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Models.SurveyModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Visualizar Survey
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Visualizar Survey</h2>

<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>

<% using (Html.BeginForm()) { %>
    <%: Html.ValidationSummary(true) %>
<fieldset>
        <legend>Visualizar Survey</legend>
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
         <% foreach (var Questao in Model.questoes) { %>
        <fieldset> 

        <input class="valid" value="<%= Questao.id_Questao %>" id="questoes_<%= i %>__id_Questao" name="questoes[<%= i %>].id_Questao" type="hidden">
        <input class="valid" value="<%= Questao.Tipo %>" id="questoes_<%= i %>__Tipo" name="questoes[<%= i %>].Tipo" type="hidden">
          <td>
              <%: Html.LabelFor(model => Questao.Pergunta) %>
          </td>
       
          <div class="display-field">
            <%: Html.DisplayFor(model => Questao.Pergunta)%>
          </div>
        
              <% if (Questao.Tipo.Equals("OBJETIVA"))
                 {  %> 
                 <fieldset>
                        
                <td>
                    <%: Html.LabelFor(model => Questao.itens.ItemA)%>
                </td>
                <div class="display-field">
                <%: Html.DisplayFor(model => Questao.itens.ItemA)%>
                </div>
                <td>
                    <%: Html.LabelFor(model =>Questao.itens.ItemB)%>
                </td>
                <div class="display-field">
                <%: Html.DisplayFor(model => Questao.itens.ItemB)%>
                </div>
                <td>
                    <%: Html.LabelFor(model => Questao.itens.ItemC)%>
                </td>
                <div class="display-field">
                <%: Html.DisplayFor(model => Questao.itens.ItemC)%>
                </div>
                <td>
                    <%: Html.LabelFor(model => Questao.itens.ItemD)%>
                </td>
                <div class="display-field">
                <%: Html.DisplayFor(model => Questao.itens.ItemD)%>
                </div>
                <td>
                    <%: Html.LabelFor(model => Questao.itens.ItemE)%>
                </td>
                <div class="display-field">
                <%: Html.DisplayFor(model => Questao.itens.ItemE)%>
                </div>
                 Resposta:
                 
                 <input class="text-box single-line" id="questoes_<%= i %>__respostas__Item" name="questoes[<%= i %>].respostas.Item" value="" type="text">
                            
               </fieldset>
                <% }
                 
                  else{  %>   
                  <fieldset>
                             Resposta:
                              <input class="text-box single-line" id="questoes_<%= i %>__respostas__Resposta" name="questoes[<%= i %>].respostas.Resposta" value="" type="text">
                
                 </fieldset>
                   <% } %>  
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
    <%: Html.ActionLink("Voltar", "Index", new { @class = "button" },null)%>
</div>

</asp:Content>
