using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Model;
using Persistence;

namespace Service
{
    /// <summary>
    /// Gerencia todas as regras de negócio da entidade Pessoa
    /// </summary>

    public class GerenciadorPessoa
    {
        private IUnitOfWork unitOfWork;
        private bool shared;

        /// <summary>
        /// Construtor pode ser acessado externamente e não compartilha contexto
        /// </summary>
        public GerenciadorPessoa()
        {
            this.unitOfWork = new UnitOfWork();
            shared = false;
        }

        /// <summary>
        /// Construtor acessado apenas dentro do componentes service e permite compartilhar
        /// contexto com outras classes de negócio
        /// </summary>
        /// <param name="unitOfWork"></param>
        internal GerenciadorPessoa(IUnitOfWork unitOfWork)
        {
            this.unitOfWork = unitOfWork;
            shared = true;
        }

        /// <summary>
        /// Insere um novo na base de dados
        /// </summary>
        /// <param name="pessoa">Dados do modelo</param>
        /// <returns>Chave identificante na base</returns>
        public int Inserir(PessoaModel pessoa)
        {
            tb_pessoa pe = new tb_pessoa();
            Atribuir(pessoa, pe);
            unitOfWork.RepositorioPessoa.Inserir(pe);
            unitOfWork.Commit(shared);
            return pessoa.IDpessoa;
        }

        /// <summary>
        /// Altera dados na base de dados
        /// </summary>
        /// <param name="pessoa"></param>
        public void Editar(PessoaModel pessoa)
        {
            tb_pessoa pe = new tb_pessoa();
            Atribuir(pessoa, pe);
            unitOfWork.RepositorioPessoa.Editar(pe);
            unitOfWork.Commit(shared);
        }

        /// <summary>
        /// Remove da base de dados
        /// </summary>
        /// <param name="pessoa"></param>
        public void Remover(int IDpessoa)
        {
            unitOfWork.RepositorioPessoa.Remover(pessoa => pessoa.id_pessoa.Equals(IDpessoa));
            unitOfWork.Commit(shared);
        }


        /// <summary>
        /// Consulta padrão para retornar dados do editora como model
        /// </summary>
        /// <returns></returns>
        private IQueryable<PessoaModel> GetQuery()
        {
            IQueryable<tb_pessoa> tb_pessoa = unitOfWork.RepositorioPessoa.GetQueryable();
            var query = from pessoa in tb_pessoa
                        select new PessoaModel
                        {
                            IDpessoa = pessoa.id_pessoa,
                            pnome = pessoa.pessoa_nome,
                            papelido = pessoa.pessoa_apelido,
                            pendereco = pessoa.pessoa_endereco,
                            pbairro = pessoa.pessoa_bairro,
                            pcomplemento = pessoa.pessoa_complemento,
                            pcidade = pessoa.pessoa_cidade,
                            pestado = pessoa.pessoa_estado,
                            pcelular = pessoa.pessoa_cel,
                            pcep = pessoa.pessoa_cep,
                            pcnpj = pessoa.pessoa_cnpj,
                            pcpf = pessoa.pessoa_cpf,
                            pdatanasc = pessoa.pessoa_data_nasc,
                            pemail= pessoa.pessoa_email,
                            pflag = pessoa.pessoa_flag

                        };
            return query;
        }

        /// <summary>
        /// Obter todos as entidades cadastradas
        /// </summary>
        /// <returns></returns>
        public IEnumerable<PessoaModel> ObterTodos()
        {
            return GetQuery();
        }

        /// <summary>
        /// Obtém um editora
        /// </summary>
        /// <param name="idEditora">Identificador do editora na base de dados</param>
        /// <returns>Editora model</returns>
        public PessoaModel Obter(int IDPessoa)
        {
            IEnumerable<PessoaModel> pessoas = GetQuery().Where(PessoaModel => PessoaModel.IDpessoa.Equals(IDPessoa));
            return pessoas.ElementAtOrDefault(0);
        }

        /// <summary>
        /// Atribui dados do Editora Model para o Editora Entity
        /// </summary>
        /// <param name="pessoa">Objeto do modelo</param>
        /// <param name="pe">Entity mapeada da base de dados</param>
        private void Atribuir(PessoaModel pessoa, tb_pessoa pe)
        {
            pe.id_pessoa = pessoa.IDpessoa;
            pe.pessoa_nome = pessoa.pnome;
            pe.pessoa_apelido = pessoa.papelido;
            pe.pessoa_bairro = pessoa.pbairro;
            pe.pessoa_cel = pessoa.pcelular;
            pe.pessoa_cidade = pessoa.pcidade;
            pe.pessoa_estado = pessoa.pestado;
            pe.pessoa_complemento = pessoa.pcomplemento;
            pe.pessoa_endereco = pessoa.pendereco;
            pe.pessoa_cep = pessoa.pcep;
            pe.pessoa_cnpj = pessoa.pcnpj;
            pe.pessoa_cpf = pessoa.pcpf;
            pe.pessoa_data_nasc = pessoa.pdatanasc;
            pe.pessoa_email = pessoa.pemail;
            pe.pessoa_flag = pessoa.pflag;
            
            
        }
    }
}
