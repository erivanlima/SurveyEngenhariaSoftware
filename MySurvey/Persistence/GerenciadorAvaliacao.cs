// -----------------------------------------------------------------------
// <copyright file="GerenciadorAvaliacao.cs" company="">
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

    /// <summary>
    /// TODO: Update summary.
    /// </summary>
    public class GerenciadorAvaliacao
    {
        private IUnitOfWork unitOfWork;
        private bool shared;

        /// <summary>
        /// Construtor pode ser acessado externamente e não compartilha contexto
        /// </summary>
        public GerenciadorAvaliacao()
        {
            this.unitOfWork = new UnitOfWork();
            shared = false;
        }

        /// <summary>
        /// Construtor acessado apenas dentro do componentes service e permite compartilhar
        /// contexto com outras classes de negócio
        /// </summary>
        /// <param name="unitOfWork"></param>
        internal GerenciadorAvaliacao(IUnitOfWork unitOfWork)
        {
            this.unitOfWork = unitOfWork;
            shared = true;
        }

        /// <summary>
        /// Insere um novo na base de dados
        /// </summary>
        /// <param name="avaliacao">Dados do modelo</param>
        /// <returns>Chave identificante na base</returns>
        public int Inserir(AvaliacaoModel avaliacao)
        {
            tb_avaliacao avaliacaoE = new tb_avaliacao();
            Atribuir(avaliacao, avaliacaoE);
            unitOfWork.RepositorioAvaliacao.Inserir(avaliacaoE);
            unitOfWork.Commit(shared);
            return avaliacaoE.id_avaliacao;
        }

        /// <summary>
        /// Altera dados na base de dados
        /// </summary>
        /// <param name="avaliacao"></param>
        public void Editar(AvaliacaoModel avaliacao)
        {
            tb_avaliacao avaliacaoE = new tb_avaliacao();
            Atribuir(avaliacao, avaliacaoE);
            unitOfWork.RepositorioAvaliacao.Editar(avaliacaoE);
            unitOfWork.Commit(shared);
        }

        /// <summary>
        /// Remove da base de dados
        /// </summary>
        /// <param name="IDavaliacao"></param>
        public void Remover(int IDavaliacao)
        {
            unitOfWork.RepositorioAvaliacao.Remover(avaliacaoE => avaliacaoE.id_avaliacao.Equals(IDavaliacao));
            unitOfWork.Commit(shared);
        }


        /// <summary>
        /// Consulta padrão para retornar dados do avaliacao como model
        /// </summary>
        /// <returns></returns>
        private IQueryable<AvaliacaoModel> GetQuery()
        {
            IQueryable<tb_avaliacao> tb_avaliacao = unitOfWork.RepositorioAvaliacao.GetQueryable();
            var query = from avaliacaoE in tb_avaliacao
                        select new AvaliacaoModel
                        {
                            IDavaliacao = avaliacaoE.id_avaliacao,
                            aprestador = avaliacaoE.tb_prestador.id_prestador,
                            asolicitacao = avaliacaoE.tb_solicitacao_servico.id_solicitacao_servico,
                            acomentario = avaliacaoE.avaliacao_comentario,
                            anota = avaliacaoE.avaliacao_nota,
                            adataenvio = avaliacaoE.avaliacao_dt_envio,
                            adataretorno = avaliacaoE.avaliacao_dt_retorno,
                            
                        };
            return query;
        }

        /// <summary>
        /// Obter todas as entidades cadastradas
        /// </summary>
        /// <returns></returns>
        public IEnumerable<AvaliacaoModel> ObterTodos()
        {
            return GetQuery();
        }

        /// <summary>
        /// Obtém uma avaliacao
        /// </summary>
        /// <param name="id_avaliacao">Identificador da avaliacao na base de dados</param>
        /// <returns>PessoaModel</returns>
        public AvaliacaoModel Obter(int IDavaliacao)
        {
            IEnumerable<AvaliacaoModel> avaliacaos = GetQuery().Where(AvaliacaoModel => AvaliacaoModel.IDavaliacao.Equals(IDavaliacao));
            return avaliacaos.ElementAtOrDefault(0);
        }

        /// <summary>
        /// Atribui dados do ClienteModel para o Cliente Entity
        /// </summary>
        /// <param name="avaliacao">Objeto do modelo</param>
        /// <param name="avaliacaoE">Entity mapeada da base de dados</param>
        private void Atribuir(AvaliacaoModel avaliacao, tb_avaliacao avaliacaoE)
        {
             avaliacaoE.id_avaliacao = avaliacao.IDavaliacao; 
             avaliacaoE.tb_prestador.id_prestador = avaliacao.aprestador;
             avaliacaoE.tb_solicitacao_servico.id_solicitacao_servico = avaliacao.asolicitacao;
             avaliacaoE.avaliacao_comentario = avaliacao.acomentario;
             avaliacaoE.avaliacao_nota = avaliacao.anota;
             avaliacaoE.avaliacao_dt_envio = avaliacao.adataenvio;
             avaliacaoE.avaliacao_dt_retorno = avaliacao.adataretorno; 
                            
               
            
        }
    }
}
