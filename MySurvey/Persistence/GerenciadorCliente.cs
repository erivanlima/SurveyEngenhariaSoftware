using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Model;
using Persistence;

namespace Service
{
    /// <summary>
    /// Gerencia todas as regras de negócio da entidade Cliente
    /// </summary>

    public class GerenciadorCliente
    {
        private IUnitOfWork unitOfWork;
        private bool shared;

        /// <summary>
        /// Construtor pode ser acessado externamente e não compartilha contexto
        /// </summary>
        public GerenciadorCliente()
        {
            this.unitOfWork = new UnitOfWork();
            shared = false;
        }

        /// <summary>
        /// Construtor acessado apenas dentro do componentes service e permite compartilhar
        /// contexto com outras classes de negócio
        /// </summary>
        /// <param name="unitOfWork"></param>
        internal GerenciadorCliente(IUnitOfWork unitOfWork)
        {
            this.unitOfWork = unitOfWork;
            shared = true;
        }

        /// <summary>
        /// Insere um novo na base de dados
        /// </summary>
        /// <param name="cliente">Dados do modelo</param>
        /// <returns>Chave identificante na base</returns>
        public int Inserir(ClienteModel cliente)
        {
            tb_cliente clienteE = new tb_cliente();
            Atribuir(cliente, clienteE);
            unitOfWork.RepositorioCliente.Inserir(clienteE);
            unitOfWork.Commit(shared);
            return clienteE.id_cliente;
        }

        /// <summary>
        /// Altera dados na base de dados
        /// </summary>
        /// <param name="cliente"></param>
        public void Editar(ClienteModel cliente)
        {
            tb_cliente clienteE = new tb_cliente();
            Atribuir(cliente, clienteE);
            unitOfWork.RepositorioCliente.Editar(clienteE);
            unitOfWork.Commit(shared);
        }

        /// <summary>
        /// Remove da base de dados
        /// </summary>
        /// <param name="IDcliente"></param>
        public void Remover(int IDcliente)
        {
            unitOfWork.RepositorioCliente.Remover(clienteE => clienteE.id_cliente.Equals(IDcliente));
            unitOfWork.Commit(shared);
        }


        /// <summary>
        /// Consulta padrão para retornar dados do cliente como model
        /// </summary>
        /// <returns></returns>
        private IQueryable<ClienteModel> GetQuery()
        {
            IQueryable<tb_cliente> tb_cliente = unitOfWork.RepositorioCliente.GetQueryable();
            var query = from clienteE in tb_cliente
                        select new ClienteModel
                        {
                            IDcliente = clienteE.id_cliente,
                            cnome = clienteE.cliente_nome,
                            capelido = clienteE.cliente_apelido,
                            cendereco = clienteE.cliente_endereco,
                            cnumero = clienteE.cliente_numero,
                            cbairro = clienteE.cliente_bairro,
                            ccomplemento = clienteE.cliente_complemento,
                            ccidade = clienteE.cliente_cidade,
                            cestado = clienteE.cliente_estado,
                            ccelular = clienteE.cliente_cel,
                            ccep = clienteE.cliente_cep,
                            cdatanasc = clienteE.cliente_data_nasc,
                            cemail= clienteE.cliente_email,
                            clogin = clienteE.cliente_login,
                            csenha = clienteE.cliente_senha,

                        };
            return query;
        }

        /// <summary>
        /// Obter todas as entidades cadastradas
        /// </summary>
        /// <returns></returns>
        public IEnumerable<ClienteModel> ObterTodos()
        {
            return GetQuery();
        }

        /// <summary>
        /// Obtém uma cliente
        /// </summary>
        /// <param name="id_cliente">Identificador da cliente na base de dados</param>
        /// <returns>PessoaModel</returns>
        public ClienteModel Obter(int IDCliente)
        {
            IEnumerable<ClienteModel> clientes = GetQuery().Where(ClienteModel => ClienteModel.IDcliente.Equals(IDCliente));
            return clientes.ElementAtOrDefault(0);
        }

        public ClienteModel ObterPorCidade(string cidade)
        {
            IEnumerable<ClienteModel> clientes = GetQuery().Where(ClienteModel => ClienteModel.ccidade.Equals(cidade) && ClienteModel.cflag.Equals(true));
            return clientes.ElementAtOrDefault(0);
        }

        public ClienteModel ObterPorEstado(string estado)
        {
            
            IEnumerable<ClienteModel> clientes = GetQuery().Where(ClienteModel => ClienteModel.cestado.Equals(estado) && ClienteModel.cflag.Equals(true));
            return clientes.ElementAtOrDefault(0);
        }

        public ClienteModel ObterPorNomeCliente(string nome)
        {
            IEnumerable<ClienteModel> clientes = GetQuery().Where(ClienteModel => ClienteModel.cnome.Equals(nome) && ClienteModel.cflag.Equals(true));
            return clientes.ElementAtOrDefault(0);
        }

        public ClienteModel ObterPorApelido(string apelido)
        {
            IEnumerable<ClienteModel> clientes = GetQuery().Where(ClienteModel => ClienteModel.capelido.Equals(apelido) && ClienteModel.cflag.Equals(true));
            return clientes.ElementAtOrDefault(0);
        }

        public ClienteModel ObterPorLogin(string login)
        {
            IEnumerable<ClienteModel> clientes = GetQuery().Where(ClienteModel => ClienteModel.clogin.Equals(login));
            return clientes.ElementAtOrDefault(0);
        }


        /// <summary>
        /// Atribui dados do ClienteModel para o Cliente Entity
        /// </summary>
        /// <param name="cliente">Objeto do modelo</param>
        /// <param name="clienteE">Entity mapeada da base de dados</param>
        private void Atribuir(ClienteModel cliente, tb_cliente clienteE)
        {
            clienteE.id_cliente = cliente.IDcliente;
            clienteE.cliente_nome = cliente.cnome;
            clienteE.cliente_apelido = cliente.capelido;
            clienteE.cliente_bairro = cliente.cbairro;
            clienteE.cliente_cel = cliente.ccelular;
            clienteE.cliente_cidade = cliente.ccidade;
            clienteE.cliente_estado = cliente.cestado;
            clienteE.cliente_complemento = cliente.ccomplemento;
            clienteE.cliente_endereco = cliente.cendereco;
            clienteE.cliente_numero = cliente.cnumero;
            clienteE.cliente_cep = cliente.ccep;
            clienteE.cliente_login = cliente.clogin;
            clienteE.cliente_senha = cliente.csenha;
            clienteE.cliente_data_nasc = cliente.cdatanasc;
            clienteE.cliente_email = cliente.cemail;
            clienteE.cliente_flag = 0;
            
            
        }


        public IEnumerable<ClienteModel> ObterPorNome(string nome)
        {
            IEnumerable<ClienteModel> clientes = GetQuery().Where(ClienteModel => ClienteModel.cnome.Contains(nome));
            return clientes;
        }
    
    
    }
}
