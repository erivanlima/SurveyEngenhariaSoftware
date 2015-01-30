<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Models.CodigoModel>" %>

<script src="<%: Url.Content("~/Scripts/jquery-1.5.1.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>

<% using (Html.BeginForm()) { %>
    <%: Html.ValidationSummary(true) %>
    
        <legend>CodigoModel</legend>

              <input type="file" size="40" value="carregar código"/>
     <!--   <div class="editor-label">
            <%: Html.LabelFor(model => model.Pergunta) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Pergunta) %>
            <%: Html.ValidationMessageFor(model => model.Pergunta) %>
        </div>-->

        <p>
            <input type="submit" value="Confirmar" />
        </p>
    
<% } %>


