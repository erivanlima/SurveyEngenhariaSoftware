// -----------------------------------------------------------------------
// <copyright file="GerenciadorItemServico.cs" company="">
// TODO: Update copyright text.
// </copyright>
// -----------------------------------------------------------------------

namespace Service
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using Model;
    using Persistence;

    /// <summary>
    /// TODO: Update summary.
    /// </summary>
    public class GerenciadorItemServico
    {
        private IUnitOfWork unitOfWork;
        private bool shared;

        /// <summary>
        /// Construtor pode ser acessado externamente e não compartilha contexto
        /// </summary>
        public GerenciadorItemServico()
        {
            this.unitOfWork = new UnitOfWork();
            shared = false;
        }

        /// <summary>
        /// Construtor acessado apenas dentro do componentes service e permite compartilhar
        /// contexto com outras classes de negócio
        /// </summary>
        /// <param name="unitOfWork"></param>
        internal GerenciadorItemServico(IUnitOfWork unitOfWork)
        {
            this.unitOfWork = unitOfWork;
            shared = true;
        }

        /// <summary>
        /// Insere um novo na base de dados
        /// </summary>
        /// <param name="servico">Dados do modelo</param>
        /// <returns>Chave identificante na base</returns>
        public int Inserir(ItemServicoModel item)
        {
            tb_item_servico itemE = new tb_item_servico();
            Atribuir(item, itemE);
            unitOfWork.RepositorioItemServico.Inserir(itemE);
            unitOfWork.Commit(shared);
            return itemE.id_item_servico;
        }

        /// <summary>
        /// Altera dados na base de dados
        /// </summary>
        /// <param name="servico"></param>
        public void Editar(ItemServicoModel item)
        {
            tb_item_servico itemE = new tb_item_servico();
            Atribuir(item, itemE);
            unitOfWork.RepositorioItemServico.Editar(itemE);
            unitOfWork.Commit(shared);
        }

        /// <summary>
        /// Remove da base de dados
        /// </summary>
        /// <param name="servico"></param>
        public void Remover(int IDitem)
        {
            unitOfWork.RepositorioItemServico.Remover(itemE => itemE.id_item_servico.Equals(IDitem));
            unitOfWork.Commit(shared);
        }

        


        /// <summary>
        /// Consulta padrão para retornar dados do Serviço como model
        /// </summary>
        /// <returns></returns>
        private IQueryable<ItemServicoModel> GetQuery()
        {
            IQueryable<tb_item_servico> tb_item_servico = unitOfWork.RepositorioItemServico.GetQueryable();
            var query = from itemE in tb_item_servico
                        select new ItemServicoModel
                        {
                            idItem = itemE.id_item_servico,
                            idSolicitacao= itemE.id_solicitacao_servico,
                            idPrestador = itemE.id_prestador,
                            idServico = itemE.id_servico,
                            quantidade = itemE.item_servico_quant,
                            valor = itemE.item_servico_valor,
                            idCarrinho = itemE.tb_solicitacao_servico.id_carrinho,
                            nomeServico = itemE.tb_prestador_servico.tb_servico.servico_nome,
                            valorTotal = (decimal)(itemE.item_servico_quant*itemE.item_servico_valor)

                        };
            return query;
        }

        


        /// <summary>
        /// Obter todos as entidades cadastradas
        /// </summary>
        /// <returns></returns>
        public IEnumerable<ItemServicoModel> ObterTodos()
        {
            return GetQuery();
        }

       
        /// <summary>
        /// Obtém um Serviço
        /// </summary>
        /// <param name="id_servico">Identificador do serviço na base de dados</param>
        /// <returns>CarrinhoModel</returns>
        public ItemServicoModel Obter(int IDitem)
        {
            IEnumerable<ItemServicoModel> item = GetQuery().Where(ItemServicoModel => ItemServicoModel.idItem.Equals(IDitem));
            return item.ElementAtOrDefault(0);
        }

        

      

        /// <summary>
        /// Atribui dados do PrestadorPrestadorServicoModel para o PrestadorPrestadorServico Entity
        /// </summary>
        /// <param name="servico">Objeto do modelo</param>
        /// <param name="serE">Entity mapeada da base de dados</param>
        private void Atribuir(ItemServicoModel item, tb_item_servico itemE)
        {
            itemE.id_item_servico = item.idItem;
            itemE.id_solicitacao_servico = item.idSolicitacao;
            itemE.id_prestador = item.idPrestador;
            itemE.id_servico = item.idServico;
            itemE.item_servico_quant = item.quantidade;
            itemE.item_servico_valor = item.valorTotal;
            
            


        }





         public decimal ObterSomatorio(int IDitem)
        {

            decimal item = GetQuery().Where(carrinho => carrinho.idCarrinho.Equals(IDitem)).Sum(s=>s.valorTotal); 
            return item;
        }

         public int ObterItem()
         {

             int item = GetQuery().Max(carrinho => carrinho.idCarrinho);
             return item;
         }

         public ItemServicoModel ComparaItemCarrinho(int IDitem,int car)
         {

             IEnumerable<ItemServicoModel> itens = GetQuery().Where(carrinho => carrinho.idCarrinho.Equals(car) && carrinho.idItem.Equals(IDitem));
             return itens.ElementAtOrDefault(0);
         }


         public ItemServicoModel obterCarrinhoServico(int car)
         {

             IEnumerable<ItemServicoModel> itens = GetQuery().Where(carrinho => carrinho.idCarrinho.Equals(car));
             return itens.ElementAtOrDefault(0);
         }

    } 
}
