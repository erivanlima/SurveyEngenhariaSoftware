using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Model;
using Persistence;


namespace Service
{
    public class GerenciadorEspecialidade
    {
        private IUnitOfWork unitOfWork;
        private bool shared;

        /// <summary>
        /// Construtor pode ser acessado externamente e não compartilha contexto
        /// </summary>
        public GerenciadorEspecialidade()
        {
            this.unitOfWork = new UnitOfWork();
            shared = false;
        }

        /// <summary>
        /// Construtor acessado apenas dentro do componentes service e permite compartilhar
        /// contexto com outras classes de negócio
        /// </summary>
        /// <param name="unitOfWork"></param>
        internal GerenciadorEspecialidade(IUnitOfWork unitOfWork)
        {
            this.unitOfWork = unitOfWork;
            shared = true;
        }

        /// <summary>
        /// Insere um novo na base de dados
        /// </summary>
        /// <param name="especialidade">Dados do modelo</param>
        /// <returns>Chave identificante na base</returns>
        public int Inserir(EspecialidadeModel especialidade)
        {
            tb_especialidade espE = new tb_especialidade();
            Atribuir(especialidade, espE);
            unitOfWork.RepositorioEspecialidade.Inserir(espE);
            unitOfWork.Commit(shared);
            return especialidade.IDecodigo;
        }

        /// <summary>
        /// Altera dados na base de dados
        /// </summary>
        /// <param name="especialidade"></param>
        public void Editar(EspecialidadeModel especialidade)
        {
            tb_especialidade espE = new tb_especialidade();
            Atribuir(especialidade, espE);
            unitOfWork.RepositorioEspecialidade.Editar(espE);
            unitOfWork.Commit(shared);
        }

        /// <summary>
        /// Remove da base de dados
        /// </summary>
        /// <param name="IDecodigo"></param>
        public void Remover(int IDecodigo)
        {
            unitOfWork.RepositorioEspecialidade.Remover(especialidade => especialidade.id_especialidade.Equals(IDecodigo));
            unitOfWork.Commit(shared);
        }


        /// <summary>
        /// Consulta padrão para retornar dados da especialidade como model
        /// </summary>
        /// <returns></returns>
        private IQueryable<EspecialidadeModel> GetQuery()
        {
            IQueryable<tb_especialidade> tb_especialidade = unitOfWork.RepositorioEspecialidade.GetQueryable();
            var query = from especialidade in tb_especialidade
                        select new EspecialidadeModel
                        {
                            IDecodigo = especialidade.id_especialidade,
                            enome = especialidade.especialidade_nome,

                        };
            return query;
        }

        /// <summary>
        /// Obter todos as entidades cadastradas
        /// </summary>
        /// <returns></returns>
        public IEnumerable<EspecialidadeModel> ObterTodos()
        {
            return GetQuery();
        }

        /// <summary>
        /// Obtém uma especialidade
        /// </summary>
        /// <param name="IDecodigo">Identificador da especialidade na base de dados</param>
        /// <returns> Especialidade model</returns>
        public EspecialidadeModel Obter(int IDecodigo)
        {
            IEnumerable<EspecialidadeModel> especialidades = GetQuery().Where(EspecialidadeModel => EspecialidadeModel.IDecodigo.Equals(IDecodigo));
            return especialidades.ElementAtOrDefault(0);
        }

        public EspecialidadeModel ObterPorNomeEspecialidade(string nome)
        {
            IEnumerable<EspecialidadeModel> especialidades = GetQuery().Where(EspecialidadeModel => EspecialidadeModel.enome.Equals(nome));
            return especialidades.ElementAtOrDefault(0);
        }

        /// <summary>
        /// Atribui dados da Especialidade Model para a Especialidade Entity
        /// </summary>
        /// <param name="especialidade">Objeto do modelo</param>
        /// <param name="esp">Entity mapeada da base de dados</param>
        private void Atribuir(EspecialidadeModel especialidade, tb_especialidade espE)
        {
           // espE.id_especialidade = especialidade.IDecodigo;
            espE.especialidade_nome = especialidade.enome;

        }
    }
}

