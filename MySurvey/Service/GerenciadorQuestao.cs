using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Modelos;
using Persistence;
using teste;

namespace Service
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
        public void Remover(int IDquestao)
        {
            unitOfWork.RepositorioQuestao.Remover(questaoE => questaoE.id_Questao.Equals(IDquestao));
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
                            Codigo = questaoE.Codigo,
                            Img = questaoE.Img,
                            Linguagem = questaoE.Linguagem,
                            Obrigatoria = (Boolean)questaoE.Obrigatoria,
                            Pergunta = questaoE.Pergunta,
                            Randomica = (Boolean)questaoE.Randomica,
                            idTB_ITENS_DA_QUESTAO = (int) questaoE.TB_ITENS_DA_QUESTAO_idTB_ITENS_DA_QUESTAO,
                            id_Survey = questaoE.TB_SURVEY_id_Survey,
                            Tipo = questaoE.Tipo,

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
            IEnumerable<QuestaoModel> questaos = GetQuery().Where(QuestaoModel => QuestaoModel.id_Questao.Equals(IDquestao));
            return questaos.ElementAtOrDefault(0);
        }

       
        
        /// <summary>
        /// Atribui dados do QuestaoModel para o questao Entity
        /// </summary>
        /// <param name="questao">Objeto do modelo</param>
        /// <param name="questaoE">Entity mapeada da base de dados</param>
        private void Atribuir(QuestaoModel questao, TB_QUESTAO questaoE)
        {
            questaoE.id_Questao = questao.id_Questao;
            questaoE.Codigo = questao.Codigo;
            questaoE.TB_SURVEY_id_Survey = questao.id_Survey;
            questaoE.TB_ITENS_DA_QUESTAO_idTB_ITENS_DA_QUESTAO = questao.idTB_ITENS_DA_QUESTAO;
            questaoE.Img = questao.Img;
            questaoE.Obrigatoria = questao.Obrigatoria;
            questaoE.Pergunta = questao.Pergunta;
            questaoE.Randomica = questao.Randomica;
            questaoE.Tipo = questao.Tipo;
            questaoE.Linguagem = questao.Linguagem;
            
            
        }


        
    
    
    }
}
