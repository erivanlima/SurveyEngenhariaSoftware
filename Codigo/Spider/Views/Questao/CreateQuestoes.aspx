<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Models.SurveyModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Criar Questão
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<br />

<h2>Criar Questão</h2>

<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/addQuestao.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/addSubjcomImg.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/addQuestaoobj.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/addObjcomCod.js") %>" type="text/javascript"></script>

<% using (Html.BeginForm()) { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend>SurveyModel</legend>
        
      
      <fieldset>
       <%: Html.HiddenFor(model => model.id_Survey, new { Value = ViewBag.id_Survey })%>
 
        <img src="psubjetiva.png" width="300" height="200"alt="pergunta subjetiva" />    
        
           
           <div class="editor-label">
              <a href="javascript: perguntasubjetiva();" > Adicionar Questão</a>
          </div>
           
          <div class="divperguntasubjetiva">
          
          </div>
           
         
     </fieldset>
      
    <fieldset>
        <img src="" alt="pergunta objetiva" />
         <div class="editor-label">
           <a href="javascript: perguntaobjetiva();" > Adicionar questão </a>
         </div>
         <div class="divperguntaobjetiva">
         </div>

        
   </fieldset>    
   
   <fieldset>
        <img src="" alt="pergunta objetiva com imagem" />
         <div class="editor-label">
           <a href="javascript: perguntasubjcomimg();" > Adicionar questão </a>
         </div>
         <div class="divperguntasubjetivacomimagem">
          
         </div>
   </fieldset>  

    <fieldset>
        <img src="" alt="pergunta objetiva com código" />
         <div class="editor-label">
           <a href="javascript: perguntaobjcomcod();" > Adicionar questão </a>
         </div>
         <div class="divperguntaobjetivacomcodigo">
          
         </div>
   </fieldset>  
       
        <p>
            <input type="submit" value="Salvar" />
        </p>
    </fieldset>
<% } %>

<div>
    <%: Html.ActionLink("Voltar", "Index", new { @class = "button" })%>
</div>

</asp:Content>
