// -----------------------------------------------------------------------
// <copyright file="GerenciadorCarrinho.cs" company="">
// TODO: Update copyright text.
// </copyright>
// -----------------------------------------------------------------------

namespace Service
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using Persistence;
    using Model;
    using System.Data.Objects;

    /// <summary>
    /// TODO: Update summary.
    /// </summary>
    public class GerenciadorCarrinho
    {
        private IUnitOfWork unitOfWork;
        private bool shared;

        /// <summary>
        /// Construtor pode ser acessado externamente e não compartilha contexto
        /// </summary>
        public GerenciadorCarrinho()
        {
            this.unitOfWork = new UnitOfWork();
            shared = false;
        }

        /// <summary>
        /// Construtor acessado apenas dentro do componentes service e permite compartilhar
        /// contexto com outras classes de negócio
        /// </summary>
        /// <param name="unitOfWork"></param>
        internal GerenciadorCarrinho(IUnitOfWork unitOfWork)
        {
            this.unitOfWork = unitOfWork;
            shared = true;
        }

        /// <summary>
        /// Insere um novo na base de dados
        /// </summary>
        /// <param name="servico">Dados do modelo</param>
        /// <returns>Chave identificante na base</returns>
        public int Inserir(CarrinhoModel carrinho)
        {
            tb_carrinho carrinhoE = new tb_carrinho();
            Atribuir(carrinho, carrinhoE);
            unitOfWork.RepositorioCarrinho.Inserir(carrinhoE);
            unitOfWork.Commit(shared);
            return carrinhoE.id_carrinho;
        }

        /// <summary>
        /// Altera dados na base de dados
        /// </summary>
        /// <param name="servico"></param>
        public void Editar(CarrinhoModel carrinho)
        {
            tb_carrinho carrinhoE = new tb_carrinho();
            Atribuir(carrinho, carrinhoE);
            unitOfWork.RepositorioCarrinho.Editar(carrinhoE);
            unitOfWork.Commit(shared);
        }

        /// <summary>
        /// Remove da base de dados
        /// </summary>
        /// <param name="servico"></param>
        public void Remover(int IDcarrinho)
        {
            unitOfWork.RepositorioCarrinho.Remover(carrinhoE => carrinhoE.id_carrinho.Equals(IDcarrinho));
            unitOfWork.Commit(shared);
        }

        


        /// <summary>
        /// Consulta padrão para retornar dados do Serviço como model
        /// </summary>
        /// <returns></returns>
        private IQueryable<CarrinhoModel> GetQuery()
        {
            IQueryable<tb_carrinho> tb_carrinho = unitOfWork.RepositorioCarrinho.GetQueryable();
            var query = from carrinhoE in tb_carrinho
                        select new CarrinhoModel
                        {
                            idCarrinho = carrinhoE.id_carrinho,
                            data= carrinhoE.Data,
                            check = carrinhoE.Check,
                        };
            return query;
        }

        /// <summary>
        /// Obter todos as entidades cadastradas
        /// </summary>
        /// <returns></returns>
        public IEnumerable<CarrinhoModel> ObterTodos()
        {
            return GetQuery();
        }

       
        /// <summary>
        /// Obtém um Serviço
        /// </summary>
        /// <param name="id_servico">Identificador do serviço na base de dados</param>
        /// <returns>CarrinhoModel</returns>
        public CarrinhoModel Obter(int IDcarrinho)
        {
            IEnumerable<CarrinhoModel> carrinho = GetQuery().Where(CarrinhoModel => CarrinhoModel.idCarrinho.Equals(IDcarrinho));
            return carrinho.ElementAtOrDefault(0);
        }

        

      

        /// <summary>
        /// Atribui dados do PrestadorPrestadorServicoModel para o PrestadorPrestadorServico Entity
        /// </summary>
        /// <param name="servico">Objeto do modelo</param>
        /// <param name="serE">Entity mapeada da base de dados</param>
        private void Atribuir(CarrinhoModel carrinho, tb_carrinho carrinhoE)
        {
            carrinhoE.id_carrinho = carrinho.idCarrinho;
            carrinhoE.Data = carrinho.data;
            carrinhoE.Check = carrinho.check;
            


        }
    }
}
