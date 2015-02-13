<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Main.Master" Inherits="System.Web.Mvc.ViewPage<Models.LogOnModel>" %>

<asp:Content ID="loginTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Autenticação
</asp:Content>

<asp:Content ID="loginContent" ContentPlaceHolderID="MainContent" runat="server">
    <div><h7> Autenticação </h7></div>
    

    <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>

    <% using (Html.BeginForm()) { %>
        <%: Html.ValidationSummary(true, "Usuário e/ou Senha inválido.") %>
        <div class="page">
            <div class="header">
                <p>
                Por favor entre com o seu nome de usuário e senha.
                </p>
                
                <div class="editor-label">
                    Nome de usuário
                </div>
                <div class="editor-field">
                    <%: Html.TextBoxFor(m => m.UserName) %>
                    <%: Html.ValidationMessageFor(m => m.UserName) %>
                </div>
                
                <div class="editor-label">
                    Senha
                </div>
                <div class="editor-field">
                    <%: Html.PasswordFor(m => m.Password) %>
                    <%: Html.ValidationMessageFor(m => m.Password) %>
                </div>
                
                <div class="editor-label">
                    <%: Html.CheckBoxFor(m => m.RememberMe) %>
                    Lembrar?
                </div>
                
                <p>
                    <input type="submit" value="Login" />
                </p>
                <p>
                Se você não tem uma conta, <%: Html.ActionLink("Registre-se", "Register") %> 
                </p>
            </div>
        </div>
    <% } %>
    <div>
    <%: Html.ActionLink("Voltar", "Index", "Home", new { @class = "button" })%>
</div>
</asp:Content>
