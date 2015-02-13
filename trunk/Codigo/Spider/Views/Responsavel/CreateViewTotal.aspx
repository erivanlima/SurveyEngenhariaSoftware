<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Models.SurveyModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    CreateViewTotal
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>CreateViewTotal</h2>

<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>

<% using (Html.BeginForm()) { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend>SuperModel</legend>

       
    
        <td>
            <%: Html.LabelFor(model => Model.Titulo) %>
        </td>
        <div class="editor-field">
            <%: Html.EditorFor(model => Model.Titulo) %>
        </div>
        <td>
            <%: Html.LabelFor(model => Model.Subtitulo) %>
        </td>
        <div class="editor-field">
            <%: Html.EditorFor(model => Model.Subtitulo)%>
        </div>
        
       
         <% foreach (var itemQuestao in Model.questoes) { %>
        
          <td>
              <%: Html.LabelFor(model => itemQuestao.Pergunta) %>
          </td>
          <div class="editor-field">
            <%: Html.EditorFor(model => itemQuestao.Pergunta)%>
          </div>
        
              <% if (itemQuestao.Tipo.Equals("OBJETIVA"))
                 {  %> 
                 
                    
                <td>
                    <%: Html.LabelFor(model => itemQuestao.itens.ItemA)%>
                </td>
                <div class="editor-field">
                <%: Html.EditorFor(model => itemQuestao.itens.ItemA)%>
                </div>

                <td>
                    <%: Html.LabelFor(model => itemQuestao.itens.ItemB)%>
                </td>
                <div class="editor-field">
                <%: Html.EditorFor(model => itemQuestao.itens.ItemB)%>
                </div>
                <td>
                    <%: Html.LabelFor(model => itemQuestao.itens.ItemC)%>
                </td>
                <div class="editor-field">
                <%: Html.EditorFor(model => itemQuestao.itens.ItemC)%>
                </div>
                <td>
                    <%: Html.LabelFor(model => itemQuestao.itens.ItemD)%>
                </td>
                <div class="editor-field">
                <%: Html.EditorFor(model => itemQuestao.itens.ItemD)%>
                </div>

                <td>
                    <%: Html.LabelFor(model => itemQuestao.itens.ItemE)%>
                </td>

                <div class="editor-field">
                <%: Html.EditorFor(model => itemQuestao.itens.ItemE)%>
                </div>
                 
                <% }
                  else{  %>  
                             Resposta:
                            <%: Html.EditorFor(model => itemQuestao.respostas.Resposta)%>
                 
                   <% } %>         
            
       <% } %>
    

      <p>

            <input type="submit" value="Save" />
        </p>
    </fieldset>
<% } %>

<div>
    <%: Html.ActionLink("Voltar", "Index", new { @class = "button" })%>
</div>

</asp:Content>
