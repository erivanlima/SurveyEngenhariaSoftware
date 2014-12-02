using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Models;
using Persistence;

namespace Services
{
    /// <summary>
    /// Gerencia todas as regras de negócio da entidade surveyssoa
    /// </summary>

    public class GerenciadorSurvey
    {
        private IUnitOfWork unitOfWork;
        private bool shared;

        /// <summary>
        /// Construtor pode ser acessado externamente e não compartilha contexto
        /// </summary>
        public GerenciadorSurvey()
        {
            this.unitOfWork = new UnitOfWork();
            shared = false;
        }

        /// <summary>
        /// Construtor acessado asurveynas dentro do componentes service e surveyrmite compartilhar
        /// contexto com outras classes de negócio
        /// </summary>
        /// <param name="unitOfWork"></param>
        internal GerenciadorSurvey(IUnitOfWork unitOfWork)
        {
            this.unitOfWork = unitOfWork;
            shared = true;
        }

        /// <summary>
        /// Insere um novo na base de dados
        /// </summary>
        /// <param name="surveyssoa">Dados do modelo</param>
        /// <returns>Chave identificante na base</returns>
        public int Inserir(SurveyModel survey)
        {
            TB_SURVEY surveyE = new TB_SURVEY();
            Atribuir(survey, surveyE);
            unitOfWork.RepositorioSurvey.Inserir(surveyE);
            unitOfWork.Commit(shared);
            return surveyE.id_Survey;
        }

        /// <summary>
        /// Altera dados na base de dados
        /// </summary>
        /// <param name="surveyssoa"></param>
        public void Editar(SurveyModel survey)
        {
            TB_SURVEY surveyE = new TB_SURVEY();
            Atribuir(survey, surveyE);
            unitOfWork.RepositorioSurvey.Editar(surveyE);
            unitOfWork.Commit(shared);
        }

        /// <summary>
        /// Remove da base de dados
        /// </summary>
        /// <param name="surveyssoa"></param>
        public void Remover(int IDsurvey)
        {
            unitOfWork.RepositorioSurvey.Remover(survey => survey.id_Survey.Equals(IDsurvey));
            unitOfWork.Commit(shared);
        }


        /// <summary>
        /// Consulta padrão para retornar dados do editora como model
        /// </summary>
        /// <returns></returns>
        private IQueryable<SurveyModel> GetQuery()
        {
            IQueryable<TB_SURVEY> tb_survey = unitOfWork.RepositorioSurvey.GetQueryable();
            var query = from surveyE in tb_survey
                        select new SurveyModel
                        {
                            id_Survey = surveyE.id_Survey,
                            id_Responsavel = surveyE.TB_RESPONSAVEL_id_Responsavel,
                            Data_Criacao = surveyE.Data_Criacao,
                            Data_fim = (DateTime)surveyE.Data_fim,
                            flag_ativo = surveyE.flag_ativo,
                            Titulo = surveyE.Titulo,
                            Subtitulo = surveyE.Subtitulo,


                        };
            return query;
        }

        /// <summary>
        /// Obter todos as entidades cadastradas
        /// </summary>
        /// <returns></returns>
        public IEnumerable<SurveyModel> ObterTodos()
        {
            return GetQuery();
        }

        /// <summary>
        /// Obtém um editora
        /// </summary>
        /// <param name="idEditora">Identificador do editora na base de dados</param>
        /// <returns>Editora model</returns>
        public SurveyModel Obter(int IDsurvey)
        {
            IEnumerable<SurveyModel> surveys = GetQuery().Where(SurveyModel => SurveyModel.id_Survey.Equals(IDsurvey));
            return surveys.ElementAtOrDefault(0);
        }

        /// <summary>
        /// Atribui dados do Editora Model para o Editora Entity
        /// </summary>
        /// <param name="surveyssoa">Objeto do modelo</param>
        /// <param name="survey">Entity masurveyada da base de dados</param>
        private void Atribuir(SurveyModel survey, TB_SURVEY surveyE)
        {
            surveyE.id_Survey = survey.id_Survey;
            surveyE.TB_RESPONSAVEL_id_Responsavel = survey.id_Responsavel;
            survey.Data_Criacao = survey.Data_Criacao;
            survey.Data_fim = survey.Data_fim;
            survey.Titulo = survey.Titulo;
            survey.Subtitulo = survey.Subtitulo;
            survey.flag_ativo = survey.flag_ativo;


        }
    }
}
