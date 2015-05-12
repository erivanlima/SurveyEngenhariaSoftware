using System;
using System.Collections.Generic;
using System.Linq;
using Models;
using Persistence;

namespace Services
{
    /// <summary>
    /// Gerencia todas as regras de negócio da entidade questao
    /// </summary>

    public class GerenciadorQuestao
    {
        private IUnitOfWork unitOfWork;
        private bool shared;

        /// <summary>
        /// Construtor pode ser acessado externamente e não compartilha contexto
        /// </summary>
        public GerenciadorQuestao()
        {
            this.unitOfWork = new UnitOfWork();
            shared = false;
        }

        /// <summary>
        /// Construtor acessado apenas dentro do componentes service e permite compartilhar
        /// contexto com outras classes de negócio
        /// </summary>
        /// <param name="unitOfWork"></param>
        internal GerenciadorQuestao(IUnitOfWork unitOfWork)
        {
            this.unitOfWork = unitOfWork;
            shared = true;
        }

        /// <summary>
        /// Insere um novo na base de dados
        /// </summary>
        /// <param name="questao">Dados do modelo</param>
        /// <returns>Chave identificante na base</returns>
        public int Inserir(QuestaoModel questao)
        {
            TB_QUESTAO questaoE = new TB_QUESTAO();
            Atribuir(questao, questaoE);
            unitOfWork.RepositorioQuestao.Inserir(questaoE);
            unitOfWork.Commit(shared);
            return questaoE.id_Questao;
        }

        /// <summary>
        /// Altera dados na base de dados
        /// </summary>
        /// <param name="questao"></param>
        public void Editar(QuestaoModel questao)
        {
            TB_QUESTAO questaoE = new TB_QUESTAO();
            Atribuir(questao, questaoE);
            unitOfWork.RepositorioQuestao.Editar(questaoE);
            unitOfWork.Commit(shared);
        }

        /// <summary>
        /// Remove da base de dados
        /// </summary>
        /// <param name="IDquestao"></param>
        public void Remover(int IDquest)
        {
            unitOfWork.RepositorioQuestao.Remover(questaoE => questaoE.id_Questao.Equals(IDquest));
            unitOfWork.Commit(shared);
        }
        public void RemoverQuestaoPorSurvey(int IDsurvey)
        {
            unitOfWork.RepositorioQuestao.Remover(questaoE => questaoE.TB_SURVEY_id_Survey.Equals(IDsurvey));
            unitOfWork.Commit(shared);
        }

        /// <summary>
        /// Consulta padrão para retornar dados do questao como model
        /// </summary>
        /// <returns></returns>
        private IQueryable<QuestaoModel> GetQuery()
        {
            IQueryable<TB_QUESTAO> tb_questao = unitOfWork.RepositorioQuestao.GetQueryable();
            var query = from questaoE in tb_questao
                        select new QuestaoModel
                        {
                            id_Questao = questaoE.id_Questao,
                            EhCodigo = (Boolean)questaoE.EhCodigo,
                            Img = questaoE.Img,
                            Linguagem = questaoE.Linguagem,
                            Obrigatoria = (Boolean)questaoE.Obrigatoria,
                            Pergunta = questaoE.Pergunta,
                            Randomica = (Boolean)questaoE.Randomica,
                            id_Survey = questaoE.TB_SURVEY_id_Survey,
                            Tipo = questaoE.Tipo,
                            Escolha = questaoE.Escolha,   
                            TemOutro = questaoE.TemOutro,
                            

                        };
            return query;
        }

        /// <summary>
        /// Obter todas as entidades cadastradas
        /// </summary>
        /// <returns></returns>
        public IEnumerable<QuestaoModel> ObterTodos()
        {
            return GetQuery();
        }

        /// <summary>
        /// Obtém uma questao
        /// </summary>
        /// <param name="id_questao">Identificador da questao na base de dados</param>
        /// <returns>PessoaModel</returns>
        public QuestaoModel Obter(int IDquestao)
        {
            IEnumerable<QuestaoModel> questoes = GetQuery().Where(QuestaoModel => QuestaoModel.id_Questao.Equals(IDquestao));
            return questoes.ElementAtOrDefault(0);
        }

       
        
        /// <summary>
        /// Atribui dados do QuestaoModel para o questao Entity
        /// </summary>
        /// <param name="questao">Objeto do modelo</param>
        /// <param name="questaoE">Entity mapeada da base de dados</param>
        private void Atribuir(QuestaoModel questao, TB_QUESTAO questaoE)
        {
            questaoE.id_Questao = questao.id_Questao;
            questaoE.Escolha = questao.Escolha;
            questaoE.TB_SURVEY_id_Survey = questao.id_Survey;
            questaoE.Img = questao.Img;
            questaoE.Obrigatoria = questao.Obrigatoria;
            questaoE.Pergunta = questao.Pergunta;
            questaoE.Randomica = questao.Randomica;
            questaoE.Tipo = questao.Tipo;
            questaoE.Linguagem = questao.Linguagem;
            questaoE.EhCodigo = questao.EhCodigo;
            questaoE.TemOutro = questao.TemOutro;
            
            
            
        }

        /// <summary>
        /// Obtém lista de questões de um Survey
        /// </summary>
        /// <param name="idEditora">Identificador do Survey na base de dados</param>
        /// <returns>Survey model</returns>
        public IEnumerable<QuestaoModel> ListaQuestaoSurvey(int IDsurvey)
        {
            IEnumerable<QuestaoModel> questoesSurveys = GetQuery().Where(QuestaoModel => QuestaoModel.id_Survey.Equals(IDsurvey));
            return questoesSurveys;
        }

        //public IEnumerable<Itens_da_QuestaoModel> ListarItensPorQuestao(int IDquestao)
        //{
        //    IEnumerable<Itens_da_QuestaoModel> questoesitens = GetQuery().Where(Itens_da_QuestaoModel => Itens_da_QuestaoModel.id_Questao.Equals(IDquestao));
        //    return questoesitens;
        //}


        public byte[] ObterImagem(int id)
        {
            //int id = EncriptUtils.Descriptografar(idVenda);
            IQueryable<TB_QUESTAO> TB_QUESTAO = unitOfWork.RepositorioQuestao.GetQueryable();
            var query = from questaoE in TB_QUESTAO
                        where  questaoE.id_Questao == id
                        select questaoE.Img;
            return query.FirstOrDefault();
        }
       
    }
}
