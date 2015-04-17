<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<Models.Itens_da_QuestaoModel>>" %>
<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/addItem.js") %>" type="text/javascript"></script>



         
 
      <%-- <%: Html.ActionLink("Create New", "CreateItens", new { Value = ViewBag.id_Questao })%>--%>    
     
     <div class="editor-label">
        <a href="javascript: addItem();" > Adicionar item </a>
     </div>
     


<table>
    <tr>
        <th>
            idTB_ITENS_DA_QUESTAO
        </th>
        <th>
            id_Questao
        </th>
        <th>
            Item
        </th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.DisplayFor(modelItem => item.idTB_ITENS_DA_QUESTAO) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.id_Questao) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Item) %>
        </td>
        <td>
            <%: Html.ActionLink("Edit", "Edit", new {  id= item.id_Questao }) %> |
            <%: Html.ActionLink("Details", "Details", new { id = item.id_Questao })%> |
            <%: Html.ActionLink("Delete", "Delete", new { id = item.id_Questao })%>
        </td>
    </tr>
    
<% } %>

</table>

<%--<div class="item">
          
</div>--%>

