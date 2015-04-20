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
        private IRepositorioGenerico<TB_ENTREVISTADO> _repEntrevistado;
        private IRepositorioGenerico<TB_ITENS_DA_QUESTAO> _repItens;
        private IRepositorioGenerico<TB_QUESTAO> _repQuestao;
        private IRepositorioGenerico<TB_RESPONSAVEL> _repResponsavel;
        private IRepositorioGenerico<TB_RESPOSTA> _repResposta;
        private IRepositorioGenerico<TB_SURVEY> _repSurvey;
        private IRepositorioGenerico<TB_CLASSE> _repClasse;
        

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
        public IRepositorioGenerico<TB_ENTREVISTADO> RepositorioEntrevistado
        {
            get
            {
                if (_repEntrevistado == null)
                {
                    _repEntrevistado = new RepositorioGenerico<TB_ENTREVISTADO>(_context);
                }

                return _repEntrevistado;
            }
        }

        /// <summary>
        /// Repositório para manipular dados persistidos de pessoa_serviço
        /// </summary>
        public IRepositorioGenerico<TB_ITENS_DA_QUESTAO> RepositorioItens
        {
            get
            {
                if (_repItens == null)
                {
                    _repItens = new RepositorioGenerico<TB_ITENS_DA_QUESTAO>(_context);
                }
                return _repItens;
            }
        }

        /// <summary>
        /// Repositório para manipular dados persistidos de Serviços
        /// </summary>
        public IRepositorioGenerico<TB_QUESTAO> RepositorioQuestao
        {
            get
            {
                if (_repQuestao == null)
                {
                    _repQuestao = new RepositorioGenerico<TB_QUESTAO>(_context);
                }
                return _repQuestao;
            }
        }

        public IRepositorioGenerico<TB_RESPONSAVEL> RepositorioResponsavel
        {
            get
            {
                if (_repResponsavel == null)
                {
                    _repResponsavel = new RepositorioGenerico<TB_RESPONSAVEL>(_context);
                }
                return _repResponsavel;
            }
        }

        public IRepositorioGenerico<TB_RESPOSTA> RepositorioResposta
        {
            get
            {
                if (_repResposta == null)
                {
                    _repResposta = new RepositorioGenerico<TB_RESPOSTA>(_context);
                }
                return _repResposta;
            }
        }

        public IRepositorioGenerico<TB_SURVEY> RepositorioSurvey
        {
            get
            {
                if (_repSurvey == null)
                {
                    _repSurvey = new RepositorioGenerico<TB_SURVEY>(_context);
                }
                return _repSurvey;
            }
        }
        public IRepositorioGenerico<TB_CLASSE> RepositorioClasse
        {
            get
            {
                if (_repClasse == null)
                {
                    _repClasse = new RepositorioGenerico<TB_CLASSE>(_context);
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
