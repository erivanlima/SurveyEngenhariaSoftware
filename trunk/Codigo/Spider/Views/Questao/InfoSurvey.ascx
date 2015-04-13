<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Models.SurveyModel>" %>
<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/addItem.js") %>" type="text/javascript"></script>



         
 
      <%-- <%: Html.ActionLink("Create New", "CreateItens", new { Value = ViewBag.id_Questao })%>--%>    
     
      

     <div class="display-label">Titulo do Survey</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Titulo) %>
    </div>

    <div class="display-label">Subtitulo</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Subtitulo) %>
    </div>