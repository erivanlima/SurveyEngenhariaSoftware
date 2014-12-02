using System;
using Persistence;
using Models;

namespace Persistence
{
    public interface IUnitOfWork
    {
        void Commit(bool shared);
        IRepositorioGenerico<TB_ENTREVISTADO> RepositorioEntrevistado { get; }
        IRepositorioGenerico<TB_ITENS_DA_QUESTAO> RepositorioItens { get; }
        IRepositorioGenerico<TB_QUESTAO> RepositorioQuestao { get; }
        IRepositorioGenerico<TB_RESPONSAVEL> RepositorioResponsavel { get; }
        IRepositorioGenerico<TB_RESPOSTA> RepositorioResposta { get; }
        IRepositorioGenerico<TB_SURVEY> RepositorioSurvey { get; }
       

    }
}
