// -----------------------------------------------------------------------
// <copyright file="Gerenciadorentrevistado.cs" company="">
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
    public class GerenciadorEntrevistado
    {
        private IUnitOfWork unitOfWork;
        private bool shared;

        /// <summary>
        /// Construtor pode ser acessado externamente e não compartilha contexto
        /// </summary>
        public GerenciadorEntrevistado()
        {
            this.unitOfWork = new UnitOfWork();
            shared = false;
        }

        /// <summary>
        /// Construtor acessado apenas dentro do componentes service e permite compartilhar
        /// contexto com outras classes de negócio
        /// </summary>
        /// <param name="unitOfWork"></param>
        internal GerenciadorEntrevistado(IUnitOfWork unitOfWork)
        {
            this.unitOfWork = unitOfWork;
            shared = true;
        }

        /// <summary>
        /// Insere um novo na base de dados
        /// </summary>
        /// <param name="entrevistado">Dados do modelo</param>
        /// <returns>Chave identificante na base</returns>
        public int Inserir(EntrevistadoModel entrevistado)
        {
            TB_ENTREVISTADO entrevistadoE = new TB_ENTREVISTADO();
            Atribuir(entrevistado, entrevistadoE);
            unitOfWork.RepositorioEntrevistado.Inserir(entrevistadoE);
            unitOfWork.Commit(shared);
            return entrevistadoE.idTB_ENTREVISTADO;
        }

        /// <summary>
        /// Altera dados na base de dados
        /// </summary>
        /// <param name="entrevistado"></param>
        public void Editar(EntrevistadoModel entrevistado)
        {
            TB_ENTREVISTADO entrevistadoE = new TB_ENTREVISTADO();
            Atribuir(entrevistado, entrevistadoE);
            unitOfWork.RepositorioEntrevistado.Editar(entrevistadoE);
            unitOfWork.Commit(shared);
        }

        /// <summary>
        /// Remove da base de dados
        /// </summary>
        /// <param name="IDentrevistado"></param>
        public void Remover(int IDentrevistado)
        {
            unitOfWork.RepositorioEntrevistado.Remover(entrevistadoE => entrevistadoE.idTB_ENTREVISTADO.Equals(IDentrevistado));
            unitOfWork.Commit(shared);
        }


        /// <summary>
        /// Consulta padrão para retornar dados do entrevistado como model
        /// </summary>
        /// <returns></returns>
        private IQueryable<EntrevistadoModel> GetQuery()
        {
            IQueryable<TB_ENTREVISTADO> tb_entrevistado = unitOfWork.RepositorioEntrevistado.GetQueryable();
            var query = from entrevistadoE in tb_entrevistado
                        select new EntrevistadoModel
                        {
                            idTB_ENTREVISTADO = entrevistadoE.idTB_ENTREVISTADO,
                            nome = entrevistadoE.NOME,
                            sobrenome = entrevistadoE.SOBRENOME,
                            email = entrevistadoE.EMAIL,
                            
                        };
            return query;
        }

        public IQueryable<EntrevistadoModel> obterIdEntrevistadoUltimo()
        {
            IQueryable<TB_ENTREVISTADO> tb_entrevistado = unitOfWork.RepositorioEntrevistado.GetQueryable();
            var query = (from entrevistadoE in tb_entrevistado  orderby entrevistadoE.idTB_ENTREVISTADO descending
                        
                        
                        select new EntrevistadoModel
                        {
                            idTB_ENTREVISTADO = entrevistadoE.idTB_ENTREVISTADO


                        }).Take(1);

            return query;
        }

        /// <summary>
        /// Obter todas as entidades cadastradas
        /// </summary>
        /// <returns></returns>
        public IEnumerable<EntrevistadoModel> ObterTodos()
        {
            return GetQuery();
        }

        /// <summary>
        /// Obtém uma entrevistado
        /// </summary>
        /// <param name="id_entrevistado">Identificador da entrevistado na base de dados</param>
        /// <returns>PessoaModel</returns>
        public EntrevistadoModel Obter(int IDentrevistado)
        {
            IEnumerable<EntrevistadoModel> entrevistados = GetQuery().Where(entrevistadoModel => entrevistadoModel.idTB_ENTREVISTADO.Equals(IDentrevistado));
            return entrevistados.ElementAtOrDefault(0);
        }
        public EntrevistadoModel ObterPorIP(string ip)
        {
            IEnumerable<EntrevistadoModel> entrevistados = GetQuery().Where(entrevistadoModel => entrevistadoModel.nome.Equals(ip));
            return entrevistados.ElementAtOrDefault(0);
        }
      
        /// <summary>
        /// Atribui dados do ClienteModel para o Cliente Entity
        /// </summary>
        /// <param name="entrevistado">Objeto do modelo</param>
        /// <param name="entrevistadoE">Entity mapeada da base de dados</param>
        private void Atribuir(EntrevistadoModel entrevistado, TB_ENTREVISTADO entrevistadoE)
        {
             entrevistadoE.idTB_ENTREVISTADO = entrevistado.idTB_ENTREVISTADO; 
             entrevistadoE.NOME = entrevistado.nome;
             entrevistadoE.SOBRENOME = entrevistado.sobrenome;
             entrevistadoE.EMAIL = entrevistado.email;
               
            
        }

        /// <summary>
        /// Obtém uma entrevistado
        /// </summary>
        /// <param name="User">nome de entrevistado na base de dados</param>
        /// <returns> responsavel model</returns>
        public int ObterIdResp(String User)
        {
            IEnumerable<EntrevistadoModel> entrevistado = GetQuery().
                Where(EntrevistadoModel => EntrevistadoModel.sobrenome.Equals(User));
            return entrevistado.ElementAtOrDefault(0).idTB_ENTREVISTADO;
        }
    }
}
