<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Models.SurveyModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Criar Questões
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<br />

<h2>Modelo de Questão</h2>

<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/addQuestao.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/addSubjcomImg.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/addQuestaoobj.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/addObjcomCod.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/addItem.js") %>" type="text/javascript"></script>

<script>
    function readURL(input) {

        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#blah').attr('src', e.target.result);
            }

            reader.readAsDataURL(input.files[0]);
        }
    }
    
</script>

<%--<script src="<%: Url.Content("~/Scripts/fileinput.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/bootstrap.min.js") %>" type="text/javascript"></script>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" rel="stylesheet">--%>
 
 
<%--<script runat="server" type="text/C#">
    
    protected void btnUpload_Click(object sender, EventArgs e)
    {
        for (int i = 0; i < Request.Files.Count; i++)
        {
            HttpPostedFile PostedFile = Request.Files[i];
            if (PostedFile.ContentLength > 0)
            {
                string FileName = System.IO.Path.GetFileName(PostedFile.FileName);
                PostedFile.SaveAs(Server.MapPath("Files\\") + FileName);
            }
        }
    }
 </script>--%>

<% using (Html.BeginForm("CreateQuestoes", "Questao", FormMethod.Post, new { enctype = "multipart/form-data" })) { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend></legend>

        
     <%: Html.HiddenFor(model => model.id_Survey, new { Value = ViewBag.id_Survey })%>
     

      <fieldset>
       
          <img src="../../Content/imagem/subjetiva.jpg"/>
        <%--<img src="psubjetiva.png" width="300" height="200"alt="pergunta subjetiva" />  --%>  
           <div class="editor-label">
              <a href="javascript: perguntasubjetiva();" > Adicionar questão </a>
          </div>
          <div class="divperguntasubjetiva">
          
          </div>
     </fieldset>
      
    <fieldset>
        <%--<img src="" alt="pergunta objetiva" />--%>
        <img src="../../Content/imagem/objetiva.jpg" />
         <div class="editor-label">
           <a href="javascript: perguntaobjetiva();" > Adicionar questão </a>
         </div>
         <div class="divperguntaobjetiva">
         </div>

         <div class="editor-label">
        <a href="javascript: addItem();" > Adicionar item </a>
     </div>

     <div class="item">
          
          </div>

   </fieldset>    
   
   <fieldset>
        <%--<img src="" alt="pergunta objetiva com imagem" />--%>
       <img src="../../Content/imagem/objetivaimagem.jpg" />
         <div class="editor-label">
           <a href="javascript: perguntasubjcomimg();" > Adicionar questão </a>
         </div>
         <div class="divperguntasubjetivacomimagem">
          
         </div>
         <img id="blah" src="#" alt="your image" />

         <div class="editor-label">
        <a href="javascript: addItem2();" > Adicionar item </a>
     </div>

     <div class="item_2">
          
          </div>
   </fieldset>  

    <fieldset>
       <%-- <img src="" alt="pergunta objetiva com código" />--%>
        <img src="../../Content/imagem/objetivacodigo.jpg" />
         <div class="editor-label">
           <a href="javascript: perguntaobjcomcod();" > Adicionar questão </a>
         </div>
         <div class="divperguntaobjetivacomcodigo">
          
         </div>

         <div class="editor-label">
        <a href="javascript: addItem3();" > Adicionar item </a>
     </div>

     <div class="item_3">
          
          </div>
   </fieldset>  
         
        <p>
            <input type="submit" value="Salvar" />
        </p>
    </fieldset>

<% } %>

<div>
    <%: Html.ActionLink("Voltar", "Index", new { @class = "button" },null)%>
</div>

</asp:Content>
