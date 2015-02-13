using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Services;
using Models;
using System.Web.Security;


namespace Spider.Controllers
{
    public class ResponsavelController : Controller
    {

        private GerenciadorResponsavel gResponsavel;
        private GerenciadorSurvey gSurvey;
        private GerenciadorQuestao gQuestao;
        private GerenciadorItens gItens;
        private GerenciadorResposta gResposta;


        public ResponsavelController()
        {
            gResponsavel = new GerenciadorResponsavel();
            gSurvey = new GerenciadorSurvey();
            gQuestao = new GerenciadorQuestao();
            gItens = new GerenciadorItens();
            gResposta = new GerenciadorResposta();
        }
       
        [HttpGet]
        public ActionResult CreateViewTotal(int id)
        {
             ViewBag.id_Survey = id;
             SurveyModel survey = new SurveyModel();
             survey = gSurvey.Obter(id);
             survey.questoes =  gQuestao.ListaQuestaoSurvey(id).ToList();
             for (int i = 0; i < survey.questoes.Count; i++)
             {
                 survey.questoes[i].itens = gItens.Obter(survey.questoes[i].idTB_ITENS_DA_QUESTAO);
             }

             return View(survey);
        }

        [HttpPost]
        public ActionResult CreateViewTotal(SurveyModel survey)
        {
            survey = gSurvey.Obter(survey.id_Survey);
            survey.questoes = gQuestao.ListaQuestaoSurvey(survey.id_Survey).ToList();   
            RespostaModel resposta = new RespostaModel();
            for (int i = 0; i < survey.questoes.Count; i++)
            { 
                resposta.id_Questao = survey.questoes[i].id_Questao;
                if (survey.questoes[i].Tipo.Equals("OBJETIVA"))
                {
                    resposta.Item = survey.questoes[i].respostas.Item;
                    gResposta.Inserir(resposta);
                }
                else {
                    resposta.Resposta = survey.questoes[i].respostas.Resposta;
                    gResposta.Inserir(resposta);
                }
            }

            return View();
        }
        //
        // GET: /Responsavel/

        public ActionResult Index()
        {
            return View(gResponsavel.ObterTodos());
        }

        //
        // GET: /Responsavel/
        public ActionResult Listar()
        {
            return View(gResponsavel.ObterTodos());
        }

        //
        // GET: /Responsavel/Details/5

        public ActionResult Details(int id)
        {
            return View(gResponsavel.Obter(id));
        }

        //
        // GET: /Responsavel/Create
        public ActionResult Create()
        {
           return View();
        }

        //
        // POST: /Responsavel/Create
        [HttpPost]
        public ActionResult Create(ResponsavelModel responsavel)
        {
            if (ModelState.IsValid)
            {
                MembershipUser usuario = Membership.GetUser();
                int idCodigo = retornarIdResponsavel(usuario.ToString());
                if (idCodigo != -1)
                {
                    Roles.AddUserToRole(usuario.ToString(), "Responsavel");
                    responsavel.id_Responsavel = idCodigo;
                    gResponsavel.Inserir(responsavel);
                    return RedirectToAction("Index");
                }
                
                return RedirectToAction("Index");
            }

            return View();
        }


        public int retornarIdResponsavel(string usuario)
        {
            try
            {
                IQueryable<ResponsavelModel> responsavelE = gResponsavel.obterIdResponsavel(usuario.ToString());
                int idCodigo = -1;
                foreach (ResponsavelModel responsavel in responsavelE)
                {
                    idCodigo = responsavel.id_Responsavel;
                }

                if (idCodigo != -1)
                    return idCodigo;
            }
            catch
            {
                return -1;

            }

            return -1;

        }

        //
        // GET: /Responsavel/Edit/5
        public ActionResult Edit(int id)
        {
            ResponsavelModel responsavelModel = gResponsavel.Obter(id);
            return View(responsavelModel);
        }

        //
        // POST: /Responsavel/Edit/
        [HttpPost]
        public ActionResult Edit(int id, ResponsavelModel responsavelModel)
        {
            // TODO: Add update logic here
            if(ModelState.IsValid)
            {

                gResponsavel.Editar(responsavelModel);
                return RedirectToAction("Index");
            }

            return View(responsavelModel);
        }

        //
        // GET: /Responsavel/Delete/5

        public ActionResult Delete(int id)
        {
            ResponsavelModel responsavelModel = gResponsavel.Obter(id);
            return View(responsavelModel);
        }

        //
        // POST: /Responsavel/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, ResponsavelModel responsavelModel)
        {
            if (ModelState.IsValid)
            {

                gResponsavel.Remover(id);
                return RedirectToAction("Index");
            }

            return View(responsavelModel);
        }
    }
}
