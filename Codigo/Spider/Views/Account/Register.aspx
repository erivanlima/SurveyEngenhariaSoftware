<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Models.RegisterModel>" %>

<asp:Content ID="registerTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Register
</asp:Content>

<asp:Content ID="registerContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Criar uma nova conta</h2>
    <p>
        Use o formulário abaixo para criar uma nova conta. 
    </p>
    <%--<p>
        Passwords are required to be a minimum of <%: Membership.MinRequiredPasswordLength %> characters in length.
    </p>--%>

    <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>

    <% using (Html.BeginForm("Register", "Account", FormMethod.Post)) { %>
        <%: Html.ValidationSummary(true, "Account creation was unsuccessful. Please correct the errors and try again.") %>
        <div>
            <fieldset>
                <legend>Dados da conta</legend>
                
                <div class="editor-field">
                <div class="editor-label">
                    Nome
                </div>
                    <%: Html.TextBoxFor(m => m.UserName) %>
                    <%: Html.ValidationMessageFor(m => m.UserName) %>
                </div>
                
                <div class="editor-field">
                <div class="editor-label">
                    Email
                </div>
                    <%: Html.TextBoxFor(m => m.Email) %>
                    <%: Html.ValidationMessageFor(m => m.Email) %>
                </div>
                
                <div class="editor-field">
                <div class="editor-label">
                    Senha 
                </div>
                    <%: Html.PasswordFor(m => m.Password) %>
                    <%: Html.ValidationMessageFor(m => m.Password) %>
                </div>
               
                <div class="editor-field">
                <div class="editor-label">
                    Confirme a Senha
                </div>
                    <%: Html.PasswordFor(m => m.ConfirmPassword) %>
                    <%: Html.ValidationMessageFor(m => m.ConfirmPassword) %>
                </div>
                 <br />
                <p>
                    <input class="btn btn-primary" type="submit" value="Salvar" />
                </p>
            </fieldset>
        </div>
    <% } %>
</asp:Content>
