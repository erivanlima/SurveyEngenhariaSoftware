<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Main.Master" Inherits="System.Web.Mvc.ViewPage<Models.LogOnModel>" %>

<asp:Content ID="loginTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Autenticação
</asp:Content>

<asp:Content ID="loginContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>


    <% using (Html.BeginForm()) { %>
        <%: Html.ValidationSummary(true, "Usuário e/ou Senha, inválido.") %>
        
        <div id="loginModal" class="modal show" tabindex="-1" role="dialog" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                 <h1 class="text-center">Autenticação</h1>

            </div>
             <div class="modal-header">
                 <h5 class="text-center">Por favor, entre com o seu nome de usuário e senha.</h5>
            </div>
        <%: Html.ValidationSummary(true, "Usuário e/ou Senha, inválido.") %>
            <div class="modal-body">
                <div class="form-group">
                    <input type="text" class="form-control input-lg" placeholder="Usuário">
                </div>
                <div class="form-group">
                    <input type="password" class="form-control input-lg" placeholder="Senha">
                    
                </div>
                <div class="editor-label">
                    <%: Html.CheckBoxFor(m => m.RememberMe) %>
                    Lembrar?
                </div>
                <br>
                <div class="form-group">
                    <button class="btn btn-primary btn-lg btn-block">Entrar</button> 
                 <br>  
                <span class="pull-right">
                     <p>
                    Se você não tem uma conta, <%: Html.ActionLink("Cadastre-se", "Register") %> .
                    </p></span>
                <span class="pull-left">
                     <p>
                     <%: Html.ActionLink("Esqueceu a senha", "ChangePassword")%> .
                    </p></span>

                </div>
            </div>
            <div class="modal-footer">
                <div class="col-md-12">
                    
                </div>
            </div>
        </div>
    </div>
</div>


    <% } %>
    <div>
</div>
</asp:Content>

