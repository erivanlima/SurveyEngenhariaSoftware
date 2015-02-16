<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%
    if (Request.IsAuthenticated) {
%>
         Usuário:<strong><%: Page.User.Identity.Name %></strong>!
         <%: Html.ActionLink("Sair", "LogOff", "Account", null, new { @class = "button-l" })%> 
<%
    }
    else {
%> 
         <%: Html.ActionLink("Login", "LogOn", "Account", null, new { @class = "button-l" })%> 
<%
    }
%>
