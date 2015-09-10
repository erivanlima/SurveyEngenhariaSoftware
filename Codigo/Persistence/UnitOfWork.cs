using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Persistence;
using Models;

namespace Persistence
{
    /// <summary>
    /// UnitWork é um padrão de projeto que permite trabalhar 
    /// com vários repositórios compartilhando um mesmo contexto
    /// transacional
    /// </summary>
    public class UnitOfWork : IDisposable, IUnitOfWork
    {
        private mysurveyEntities _context;
        private IRepositorioGenerico<tb_entrevistado> _repEntrevistado;
        private IRepositorioGenerico<tb_itens_da_questao> _repItens;
        private IRepositorioGenerico<tb_questao> _repQuestao;
        private IRepositorioGenerico<tb_responsavel> _repResponsavel;
        private IRepositorioGenerico<tb_resposta> _repResposta;
        private IRepositorioGenerico<tb_survey> _repSurvey;
        private IRepositorioGenerico<tb_classe> _repClasse;
        

        /// <summary>
        /// Construtor cria contexto transacional
        /// </summary>
        public UnitOfWork()
        {
            _context = new  mysurveyEntities();
        }

        #region IUnitOfWork Members

        /// <summary>
        /// Repositório para manipular dados persistidos de Pessoas
        /// </summary>
        public IRepositorioGenerico<tb_entrevistado> RepositorioEntrevistado
        {
            get
            {
                if (_repEntrevistado == null)
                {
                    _repEntrevistado = new RepositorioGenerico<tb_entrevistado>(_context);
                }

                return _repEntrevistado;
            }
        }

        /// <summary>
        /// Repositório para manipular dados persistidos de pessoa_serviço
        /// </summary>
        public IRepositorioGenerico<tb_itens_da_questao> RepositorioItens
        {
            get
            {
                if (_repItens == null)
                {
                    _repItens = new RepositorioGenerico<tb_itens_da_questao>(_context);
                }
                return _repItens;
            }
        }

        /// <summary>
        /// Repositório para manipular dados persistidos de Serviços
        /// </summary>
        public IRepositorioGenerico<tb_questao> RepositorioQuestao
        {
            get
            {
                if (_repQuestao == null)
                {
                    _repQuestao = new RepositorioGenerico<tb_questao>(_context);
                }
                return _repQuestao;
            }
        }

        public IRepositorioGenerico<tb_responsavel> RepositorioResponsavel
        {
            get
            {
                if (_repResponsavel == null)
                {
                    _repResponsavel = new RepositorioGenerico<tb_responsavel>(_context);
                }
                return _repResponsavel;
            }
        }

        public IRepositorioGenerico<tb_resposta> RepositorioResposta
        {
            get
            {
                if (_repResposta == null)
                {
                    _repResposta = new RepositorioGenerico<tb_resposta>(_context);
                }
                return _repResposta;
            }
        }

        public IRepositorioGenerico<tb_survey> RepositorioSurvey
        {
            get
            {
                if (_repSurvey == null)
                {
                    _repSurvey = new RepositorioGenerico<tb_survey>(_context);
                }
                return _repSurvey;
            }
        }
        public IRepositorioGenerico<tb_classe> RepositorioClasse
        {
            get
            {
                if (_repClasse == null)
                {
                    _repClasse = new RepositorioGenerico<tb_classe>(_context);
                }
                return _repClasse;
            }
        }

        /// <summary>
        /// Salva todas as mudanças realizadas no contexto
        /// quando o contexto não for compartilhado
        /// </summary>
        public void Commit(bool shared)
        {
            if (!shared)
                _context.SaveChanges();
        }

        #endregion

        private bool disposed = false;
        /// <summary>
        /// Retira da memória um determinado contexto
        /// </summary>
        /// <param name="disposing"></param>
        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposed)
            {
                if (disposing)
                {
                    _context.Dispose();
                }
            }
            this.disposed = true;
        }

        /// <summary>
        /// Limpa contexto da memória
        /// </summary>
        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }
    }
}
