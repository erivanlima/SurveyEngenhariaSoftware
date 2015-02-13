<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%
    if (Request.IsAuthenticated) {
%>
         Usuário:<strong><%: Page.User.Identity.Name %></strong>!
         <%: Html.ActionLink("Sair", "LogOff", "Account") %> 
<%
    }
    else {
%> 
         <%: Html.ActionLink("Login", "LogOn", "Account") %> 
<%
    }
%>
