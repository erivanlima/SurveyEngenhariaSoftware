using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Models;
using Persistence;


namespace Services
{
    public class GerenciadorResponsavel
    {
        private IUnitOfWork unitOfWork;
        private bool shared;

        /// <summary>
        /// Construtor pode ser acessado externamente e não compartilha contexto
        /// </summary>
        public GerenciadorResponsavel()
        {
            this.unitOfWork = new UnitOfWork();
            shared = false;
        }

        /// <summary>
        /// Construtor acessado apenas dentro do componentes service e permite compartilhar
        /// contexto com outras classes de negócio
        /// </summary>
        /// <param name="unitOfWork"></param>
        internal GerenciadorResponsavel(IUnitOfWork unitOfWork)
        {
            this.unitOfWork = unitOfWork;
            shared = true;
        }

        /// <summary>
        /// Insere um novo na base de dados
        /// </summary>
        /// <param name="responsavel">Dados do modelo</param>
        /// <returns>Chave identificante na base</returns>
        public int Inserir(ResponsavelModel responsavel)
        {
            TB_RESPONSAVEL responsavelE = new TB_RESPONSAVEL();
            Atribuir(responsavel, responsavelE);
            unitOfWork.RepositorioResponsavel.Inserir(responsavelE);
            unitOfWork.Commit(shared);
            return responsavelE.id_Responsavel;
        }

        /// <summary>
        /// Altera dados na base de dados
        /// </summary>
        /// <param name="responsavel"></param>
        public void Editar(ResponsavelModel responsavel)
        {
            TB_RESPONSAVEL responsavelE = new TB_RESPONSAVEL();
            Atribuir(responsavel, responsavelE);
            unitOfWork.RepositorioResponsavel.Editar(responsavelE);
            unitOfWork.Commit(shared);
        }

        /// <summary>
        /// Remove da base de dados
        /// </summary>
        /// <param name="IDecodigo"></param>
        public void Remover(int IDecodigo)
        {
            unitOfWork.RepositorioResponsavel.Remover(responsavel => responsavel.id_Responsavel.Equals(IDecodigo));
            unitOfWork.Commit(shared);
        }


        /// <summary>
        /// Consulta padrão para retornar dados da responsavel como model
        /// </summary>
        /// <returns></returns>
        private IQueryable<ResponsavelModel> GetQuery()
        {
            IQueryable<TB_RESPONSAVEL> tb_responsavel = unitOfWork.RepositorioResponsavel.GetQueryable();
            var query = from responsavel in tb_responsavel
                        select new ResponsavelModel
                        {
                            id_Responsavel = responsavel.id_Responsavel,
                            nome = responsavel.nome,
                            sobrenome = responsavel.sobrenome,
                            email = responsavel.email,

                        };
            return query;
        }

        /// <summary>
        /// Obter todos as entidades cadastradas
        /// </summary>
        /// <returns></returns>
        public IEnumerable<ResponsavelModel> ObterTodos()
        {
            return GetQuery();
        }

        /// <summary>
        /// Obtém uma responsavel
        /// </summary>
        /// <param name="IDecodigo">Identificador da responsavel na base de dados</param>
        /// <returns> responsavel model</returns>
        public ResponsavelModel Obter(int IDecodigo)
        {
            IEnumerable<ResponsavelModel> responsavels = GetQuery().Where(ResponsavelModel => ResponsavelModel.id_Responsavel.Equals(IDecodigo));
            return responsavels.ElementAtOrDefault(0);
        }

        public IQueryable<ResponsavelModel> obterIdResponsavel(string login)
        {
            IQueryable<TB_RESPONSAVEL> tb_responsavel = unitOfWork.RepositorioResponsavel.GetQueryable();
            var query = from responsavelE in tb_responsavel where responsavelE.email.Equals(login)
                        select new ResponsavelModel
                        {
                            id_Responsavel = responsavelE.id_Responsavel


                        };

            return query;
        }

        /// <summary>
        /// Obtém uma responsavel
        /// </summary>
        /// <param name="User">nome de responsavel na base de dados</param>
        /// <returns> responsavel model</returns>
        public int ObterIdResp(String User)
        {
            IEnumerable<ResponsavelModel> responsavel = GetQuery().Where(ResponsavelModel => ResponsavelModel.nome.Equals(User));
            return responsavel.ElementAtOrDefault(0).id_Responsavel;
        }

        /// <summary>
        /// Atribui dados da responsavel Model para a responsavel Entity
        /// </summary>
        /// <param name="responsavel">Objeto do modelo</param>
        /// <param name="esp">Entity mapeada da base de dados</param>
        private void Atribuir(ResponsavelModel responsavel, TB_RESPONSAVEL responsavelE)
        {
           
            responsavelE.id_Responsavel = responsavel.id_Responsavel;
            responsavelE.nome = responsavel.nome;
            responsavelE.sobrenome = responsavel.sobrenome;
            responsavelE.email = responsavel.email;

        }
    }
}

