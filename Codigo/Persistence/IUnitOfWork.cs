using System;
using Persistence;
using Models;

namespace Persistence
{
    public interface IUnitOfWork
    {
        void Commit(bool shared);
        IRepositorioGenerico<tb_entrevistado> RepositorioEntrevistado { get; }
        IRepositorioGenerico<tb_itens_da_questao> RepositorioItens { get; }
        IRepositorioGenerico<tb_questao> RepositorioQuestao { get; }
        IRepositorioGenerico<tb_responsavel> RepositorioResponsavel { get; }
        IRepositorioGenerico<tb_resposta> RepositorioResposta { get; }
        IRepositorioGenerico<tb_survey> RepositorioSurvey { get; }
        IRepositorioGenerico<tb_classe> RepositorioClasse { get; }
       

    }
}
