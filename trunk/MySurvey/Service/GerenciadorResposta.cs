﻿// -----------------------------------------------------------------------
// <copyright file="GerenciadorrespostaServico.cs" company="">
// TODO: Update copyright text.
// </copyright>
// -----------------------------------------------------------------------

namespace Service
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using Modelos;
    using Persistence;
    using teste;

    /// <summary>
    /// TODO: Update summary.
    /// </summary>
    public class GerenciadorResposta
    {
        private IUnitOfWork unitOfWork;
        private bool shared;

        /// <summary>
        /// Construtor pode ser acessado externamente e não compartilha contexto
        /// </summary>
        public GerenciadorResposta()
        {
            this.unitOfWork = new UnitOfWork();
            shared = false;
        }

        /// <summary>
        /// Construtor acessado apenas dentro do componentes service e permite compartilhar
        /// contexto com outras classes de negócio
        /// </summary>
        /// <param name="unitOfWork"></param>
        internal GerenciadorResposta(IUnitOfWork unitOfWork)
        {
            this.unitOfWork = unitOfWork;
            shared = true;
        }

        /// <summary>
        /// Insere um novo na base de dados
        /// </summary>
        /// <param name="servico">Dados do modelo</param>
        /// <returns>Chave identificante na base</returns>
        public int Inserir(RespostaModel resposta)
        {
            TB_RESPOSTA respostaE = new TB_RESPOSTA();
            Atribuir(resposta, respostaE);
            unitOfWork.RepositorioResposta.Inserir(respostaE);
            unitOfWork.Commit(shared);
            return respostaE.id_Resposta;
        }

        /// <summary>
        /// Altera dados na base de dados
        /// </summary>
        /// <param name="servico"></param>
        public void Editar(RespostaModel resposta)
        {
            TB_RESPOSTA respostaE = new TB_RESPOSTA();
            Atribuir(resposta, respostaE);
            unitOfWork.RepositorioResposta.Editar(respostaE);
            unitOfWork.Commit(shared);
        }

        /// <summary>
        /// Remove da base de dados
        /// </summary>
        /// <param name="servico"></param>
        public void Remover(int IDresposta)
        {
            unitOfWork.RepositorioResposta.Remover(respostaE => respostaE.id_Resposta.Equals(IDresposta));
            unitOfWork.Commit(shared);
        }

        


        /// <summary>
        /// Consulta padrão para retornar dados do Serviço como model
        /// </summary>
        /// <returns></returns>
        private IQueryable<RespostaModel> GetQuery()
        {
            IQueryable<TB_RESPOSTA> tb_resposta = unitOfWork.RepositorioResposta.GetQueryable();
            var query = from respostaE in tb_resposta
                        select new RespostaModel
                        {
                            id_Resposta = respostaE.id_Resposta,
                            idTB_ENTREVISTADO= respostaE.TB_ENTREVISTADO_idTB_ENTREVISTADO,
                            id_Questao = respostaE.TB_QUESTAO_id_Questao,
                            Resposta = respostaE.Resposta,
                            Item = respostaE.Item,

                        };
            return query;
        }

        


        /// <summary>
        /// Obter todos as entidades cadastradas
        /// </summary>
        /// <returns></returns>
        public IEnumerable<RespostaModel> ObterTodos()
        {
            return GetQuery();
        }

       
        /// <summary>
        /// Obtém um Serviço
        /// </summary>
        /// <param name="id_servico">Identificador do serviço na base de dados</param>
        /// <returns>CarrinhoModel</returns>
        public RespostaModel Obter(int IDresposta)
        {
            IEnumerable<RespostaModel> resposta = GetQuery().Where(RespostaModel => RespostaModel.id_Resposta.Equals(IDresposta));
            return resposta.ElementAtOrDefault(0);
        }

           

        /// <summary>
        /// Atribui dados do PrestadorPrestadorServicoModel para o PrestadorPrestadorServico Entity
        /// </summary>
        /// <param name="servico">Objeto do modelo</param>
        /// <param name="serE">Entity mapeada da base de dados</param>
        private void Atribuir(RespostaModel resposta, TB_RESPOSTA respostaE)
        {
            respostaE.id_Resposta = resposta.id_Resposta;
            respostaE.TB_ENTREVISTADO_idTB_ENTREVISTADO = resposta.idTB_ENTREVISTADO;
            respostaE.TB_QUESTAO_id_Questao = resposta.id_Questao;
            respostaE.Resposta = resposta.Resposta;
            respostaE.Item = resposta.Item;
           }

                

    } 
}