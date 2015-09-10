using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Persistence;
using Models;

namespace Services
{
    public class GerenciadorClasse
    {
        private IUnitOfWork unitOfWork;
        private bool shared;

        /// <summary>
        /// Construtor pode ser acessado externamente e não compartilha contexto
        /// </summary>
        public GerenciadorClasse()
        {
            this.unitOfWork = new UnitOfWork();
            shared = false;
        }

        /// <summary>
        /// Construtor acessado apenas dentro do componentes service e permite compartilhar
        /// contexto com outras classes de negócio
        /// </summary>
        /// <param name="unitOfWork"></param>
        internal GerenciadorClasse(IUnitOfWork unitOfWork)
        {
            this.unitOfWork = unitOfWork;
            shared = true;
        }

        /// <summary>
        /// Insere um novo na base de dados
        /// </summary>
        /// <param name="Classe">Dados do modelo</param>
        /// <returns>Chave identificante na base</returns>
        public int Inserir(ClasseModel Classe)
        {
            tb_classe ClasseE = new tb_classe();
            Atribuir(Classe, ClasseE);
            unitOfWork.RepositorioClasse.Inserir(ClasseE);
            unitOfWork.Commit(shared);
            return ClasseE.id_Classe;
        }

        /// <summary>
        /// Altera dados na base de dados
        /// </summary>
        /// <param name="Classe"></param>
        public void Editar(ClasseModel Classe)
        {
            tb_classe ClasseE = new tb_classe();
            Atribuir(Classe, ClasseE);
            unitOfWork.RepositorioClasse.Editar(ClasseE);
            unitOfWork.Commit(shared);
        }

        /// <summary>
        /// Remove da base de dados
        /// </summary>
        /// <param name="IDClasse"></param>
        public void Remover(int IDClasse)
        {
            unitOfWork.RepositorioClasse.Remover(ClasseE => ClasseE.id_Classe.Equals(IDClasse));
            unitOfWork.Commit(shared);
        }


        /// <summary>
        /// Consulta padrão para retornar dados do Classe como model
        /// </summary>
        /// <returns></returns>
        private IQueryable<ClasseModel> GetQuery()
        {
            IQueryable<tb_classe> tb_Classe = unitOfWork.RepositorioClasse.GetQueryable();
            var query = from ClasseE in tb_Classe
                        select new ClasseModel
                        {
                            id_Classe = ClasseE.id_Classe,
                            id_Questao = ClasseE.TB_QUESTAO_id_Questao,
                            Codigo = ClasseE.Codigo,
                            
                            
                        };
            return query;
        }

        /// <summary>
        /// Obter todas as entidades cadastradas
        /// </summary>
        /// <returns></returns>
        public IEnumerable<ClasseModel> ObterTodos()
        {
            return GetQuery();
        }

        /// <summary>
        /// Obtém uma Classe
        /// </summary>
        /// <param name="id_Classe">Identificador da Classe na base de dados</param>
        /// <returns>PessoaModel</returns>
        public ClasseModel Obter(int IDClasse)
        {
            IEnumerable<ClasseModel> Classes = GetQuery().Where(ClasseModel => ClasseModel.id_Classe.Equals(IDClasse));
            return Classes.ElementAtOrDefault(0);
        }

        public IEnumerable<ClasseModel> ObterClasses(int IDquest)
        {
            IEnumerable<ClasseModel> classes = GetQuery().Where(ClasseModel => ClasseModel.id_Questao.Equals(IDquest));
            return classes;
        }
        public void RemoverPorQuestao(int IDquest)
        {
            unitOfWork.RepositorioClasse.Remover(ClasseE => ClasseE.TB_QUESTAO_id_Questao.Equals(IDquest));
            unitOfWork.Commit(shared);
        }
        public void RemoverPorIdQuestao(int IdQuestao)
        {
            unitOfWork.RepositorioClasse.Remover(ClasseE => ClasseE.TB_QUESTAO_id_Questao.Equals(IdQuestao));
            unitOfWork.Commit(shared);
        }

        /// <summary>
        /// Atribui dados do ClienteModel para o Cliente Entity
        /// </summary>
        /// <param name="Classe">Objeto do modelo</param>
        /// <param name="ClasseE">Entity mapeada da base de dados</param>
        private void Atribuir(ClasseModel Classe, tb_classe ClasseE)
        {
             ClasseE.id_Classe = Classe.id_Classe; 
             ClasseE.TB_QUESTAO_id_Questao = Classe.id_Questao;
             ClasseE.Codigo = Classe.Codigo;
             
               
            
        }

     
   
    }
}
