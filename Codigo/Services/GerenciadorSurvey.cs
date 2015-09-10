using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Models;
using Persistence;

namespace Services
{
    /// <summary>
    /// Gerencia todas as regras de negócio da entidade survey
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
            tb_survey surveyE = new tb_survey();
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
            tb_survey surveyE = new tb_survey();
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
        /// Consulta padrão para retornar dados do Survey como model
        /// </summary>
        /// <returns></returns>
        private IQueryable<SurveyModel> GetQuery()
        {
            IQueryable<tb_survey> tb_survey = unitOfWork.RepositorioSurvey.GetQueryable();
            var query = from surveyE in tb_survey
                        select new SurveyModel
                        {
                            id_Survey = surveyE.id_Survey,
                            id_Responsavel = surveyE.TB_RESPONSAVEL_id_Responsavel,
                            Titulo = surveyE.Titulo,
                            Subtitulo = surveyE.Subtitulo,
                            Data_Criacao = surveyE.Data_Criacao,
                            Data_fim = (DateTime)surveyE.Data_fim,
                            flag_ativo = surveyE.flag_ativo,
                            RandomizeQuetsoes = surveyE.RandomizeQuestoes,
                            UnicaResposta = surveyE.UnicaResposta,
                            SenhaAcesso = surveyE.SenhaAcesso,
                            
    

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
        /// Obtém lista de survey
        /// </summary>
        /// <param name="idEditora">Identificador do Survey na base de dados</param>
        /// <returns>Survey model</returns>
        public IEnumerable<SurveyModel> ListarSurvey(int idResponsavel)
        {
            IEnumerable<SurveyModel> Surveys = GetQuery().Where(SurveyModel => SurveyModel.id_Responsavel.Equals(idResponsavel));
            return Surveys;
        }

        /// <summary>
        /// Obtém um survey
        /// </summary>
        /// <param name="idEditora">Identificador do editora na base de dados</param>
        /// <returns>Survey model</returns>
        public SurveyModel Obter(int IDsurvey)
        {
            IEnumerable<SurveyModel> surveys = GetQuery().Where(SurveyModel => SurveyModel.id_Survey.Equals(IDsurvey));
            return surveys.ElementAtOrDefault(0);
        }

        /// <summary>
        /// Atribui dados do Survey Model para o Survey Entity
        /// </summary>
        /// <param name="surveyssoa">Objeto do modelo</param>
        /// <param name="survey">Entity survey da base de dados</param>
        private void Atribuir(SurveyModel survey, tb_survey surveyE)
        {
            surveyE.id_Survey = survey.id_Survey;
            surveyE.TB_RESPONSAVEL_id_Responsavel = survey.id_Responsavel;
            surveyE.Data_Criacao = survey.Data_Criacao;
            surveyE.Data_fim = survey.Data_fim;
            surveyE.Titulo = survey.Titulo;
            surveyE.Subtitulo = survey.Subtitulo;
            surveyE.flag_ativo = survey.flag_ativo;
            surveyE.RandomizeQuestoes = survey.RandomizeQuetsoes;
            surveyE.UnicaResposta = survey.UnicaResposta;
            surveyE.SenhaAcesso = survey.SenhaAcesso;


        }
    }
}
