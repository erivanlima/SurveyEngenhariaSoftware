using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Services;
using Models;

namespace Spider.Controllers
{
    public class QuestaoController : Controller
    {
        //
        // GET: /Questao/
        private GerenciadorQuestao gQuestao;
        private GerenciadorSurvey gSurvey;
        private GerenciadorEntrevistado gEntrevistado;
        private GerenciadorResposta gResposta;


        public QuestaoController()
        {
            gQuestao = new GerenciadorQuestao();
            gEntrevistado = new GerenciadorEntrevistado();
            gResposta = new GerenciadorResposta();
            gSurvey = new GerenciadorSurvey();

        }

        public ActionResult Index()
        {
            return View(gQuestao.ObterTodos());
        }

        //
        // GET: /Questao/Details/5

        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /Questao/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /Questao/Create

        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /Resposta/Create

        public ActionResult CreateResposta(int id)
        {
            ViewBag.id_Questao = id;
            return View();
        }

        //
        // POST: /Resposta/Create
        [HttpPost]
        public ActionResult CreateResposta(QuestaoModel questao)
        {
            //RespostaModel resp = new RespostaModel();
            EntrevistadoModel entrevistado = new EntrevistadoModel();
            //entrevistado.idTB_ENTREVISTADO = '0';
            //gEntrevistado.Inserir(entrevistado);
                questao.respostas.id_Questao = questao.id_Questao;
                questao.respostas.idTB_ENTREVISTADO = gEntrevistado.Inserir(entrevistado);
                gResposta.Inserir(questao.respostas);



            return RedirectToAction("Index");
        }

        [HttpGet]
        public ActionResult ListaQuestoes(int id)
        {
            //ViewBag.id_Survey = id;
            return View(gSurvey.Obter(id));
        }

        [HttpPost]
        public ActionResult ListaQuestoes(int idsurvey, SurveyModel survey)
        {
            //int idsurvey = 0;
            //SurveyModel survey = new SurveyModel();
            List<QuestaoModel> SurveyQuestoes = new List<QuestaoModel>();
            //SurveyQuestoes = survey.questoes;

            foreach (QuestaoModel questao in SurveyQuestoes)
            {
                // gQuestao.Obter(questao.id_Survey);
                if (questao.id_Survey == idsurvey)
                {
                    //questao.idTB_ITENS_DA_QUESTAO = gItens.Inserir(questao.itens);
                    SurveyQuestoes.Add(gQuestao.Obter(questao.id_Survey));
                    //gQuestao.Inserir(questao);
                }

            }

            return View(SurveyQuestoes);
        }

        //
        // GET: /Questao/Edit/5

        public ActionResult Edit(int id)
        {
            return View();
        }

        //
        // POST: /Questao/Edit/5

        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /Questao/Delete/5

        public ActionResult Delete(int id)
        {
            return View();
        }

        //
        // POST: /Questao/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
