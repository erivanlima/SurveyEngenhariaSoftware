// -----------------------------------------------------------------------
// <copyright file="Gerenciadoritens.cs" company="">
// TODO: Update copyright text.
// </copyright>
// -----------------------------------------------------------------------

namespace Services
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using Persistence;
    using Models;

    /// <summary>
    /// TODO: Update summary.
    /// </summary>
    public class GerenciadorItens
    {
        private IUnitOfWork unitOfWork;
        private bool shared;

        /// <summary>
        /// Construtor pode ser acessado externamente e não compartilha contexto
        /// </summary>
        public GerenciadorItens()
        {
            this.unitOfWork = new UnitOfWork();
            shared = false;
        }

        /// <summary>
        /// Construtor acessado apenas dentro do componentes service e permite compartilhar
        /// contexto com outras classes de negócio
        /// </summary>
        /// <param name="unitOfWork"></param>
        internal GerenciadorItens(IUnitOfWork unitOfWork)
        {
            this.unitOfWork = unitOfWork;
            shared = true;
        }

        /// <summary>
        /// Insere um novo na base de dados
        /// </summary>
        /// <param name="servico">Dados do modelo</param>
        /// <returns>Chave identificante na base</returns>
        public int Inserir(Itens_da_QuestaoModel itens)
        {
            TB_ITENS_DA_QUESTAO itensE = new TB_ITENS_DA_QUESTAO();
            Atribuir(itens, itensE);
            unitOfWork.RepositorioItens.Inserir(itensE);
            unitOfWork.Commit(shared);
            return itensE.idTB_ITENS_DA_QUESTAO;
        }

        /// <summary>
        /// Altera dados na base de dados
        /// </summary>
        /// <param name="servico"></param>
        public void Editar(Itens_da_QuestaoModel itens)
        {
            TB_ITENS_DA_QUESTAO itensE = new TB_ITENS_DA_QUESTAO();
            Atribuir(itens, itensE);
            unitOfWork.RepositorioItens.Editar(itensE);
            unitOfWork.Commit(shared);
        }

        /// <summary>
        /// Remove da base de dados
        /// </summary>
        /// <param name="servico"></param>
        public void Remover(int IDitens)
        {
            unitOfWork.RepositorioItens.Remover(itensE => itensE.idTB_ITENS_DA_QUESTAO.Equals(IDitens));
            unitOfWork.Commit(shared);
        }

        


        /// <summary>
        /// Consulta padrão para retornar dados do Serviço como model
        /// </summary>
        /// <returns></returns>
        private IQueryable<Itens_da_QuestaoModel> GetQuery()
        {
            IQueryable<TB_ITENS_DA_QUESTAO> tb_itens = unitOfWork.RepositorioItens.GetQueryable();
            var query = from itensE in tb_itens
                        select new Itens_da_QuestaoModel
                        {
                            idTB_ITENS_DA_QUESTAO = itensE.idTB_ITENS_DA_QUESTAO,
                            Item = itensE.Item,
                            //ItemB = itensE.ItemB,
                            //ItemC = itensE.ItemC,
                            //ItemD = itensE.ItemD,
                            //ItemE = itensE.ItemE,
                        };
            return query;
        }

        /// <summary>
        /// Obter todos as entidades cadastradas
        /// </summary>
        /// <returns></returns>
        public IEnumerable<Itens_da_QuestaoModel> ObterTodos()
        {
            return GetQuery();
        }

       
        /// <summary>
        /// Obtém um Item
        /// </summary>
        /// <param name="id_servico">Identificador do Item na base de dados</param>
        /// <returns>Itens_da_QuestaoModel</returns>
        public Itens_da_QuestaoModel Obter(int IDitens)
        {
            IEnumerable<Itens_da_QuestaoModel> itens = GetQuery().Where(Itens_da_QuestaoModel => Itens_da_QuestaoModel.idTB_ITENS_DA_QUESTAO.Equals(IDitens));
            return itens.ElementAtOrDefault(0);
        }

        public IEnumerable<Itens_da_QuestaoModel> ObterItens(int idQuest)
        {
            IEnumerable<Itens_da_QuestaoModel> itens = GetQuery().Where(Itens_da_QuestaoModel => Itens_da_QuestaoModel.id_Questao.Equals(idQuest));
            return itens;
        }

      

        /// <summary>
        /// Atribui dados do PrestadorPrestadorServicoModel para o PrestadorPrestadorServico Entity
        /// </summary>
        /// <param name="servico">Objeto do modelo</param>
        /// <param name="serE">Entity mapeada da base de dados</param>
        private void Atribuir(Itens_da_QuestaoModel itens, TB_ITENS_DA_QUESTAO itensE)
        {
            itensE.idTB_ITENS_DA_QUESTAO = itens.idTB_ITENS_DA_QUESTAO;
            itensE.Item = itens.Item;
            //itensE.ItemB = itens.ItemB;
            //itensE.ItemC = itens.ItemC;
            //itensE.ItemD = itens.ItemD;
            //itensE.ItemE = itens.ItemE;
            


        }
    }
}
