using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Services;
using Models;

namespace Spider.Controllers
{
    [Authorize(Roles = "Responsavel")]
    public class QuestaoController : Controller
    {
        //
        // GET: /Questao/
        private GerenciadorQuestao gQuestao;
        private GerenciadorSurvey gSurvey;
        private GerenciadorEntrevistado gEntrevistado;
        private GerenciadorResposta gResposta;
        private GerenciadorItens gItens;


        public QuestaoController()
        {
            gQuestao = new GerenciadorQuestao();
            gEntrevistado = new GerenciadorEntrevistado();
            gResposta = new GerenciadorResposta();
            gSurvey = new GerenciadorSurvey();
            gItens = new GerenciadorItens();

        }

        public ActionResult Index()
        {
            return View(gQuestao.ObterTodos());
        }

        //
        // GET: /Questao/Details/5

        public ActionResult Details(int id)
        {
            return View(gQuestao.Obter(id));
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
        [HttpGet]
        public ActionResult CreateResposta(int id)
        {
            ViewBag.id_Questao = id;
            return View();
        }

        //
        // POST: /Resposta/Create
        [HttpPost]
        public ActionResult CreateResposta(RespostaModel resp)
        {
            
            EntrevistadoModel entrevistado = new EntrevistadoModel();
            resp.idTB_ENTREVISTADO = gEntrevistado.Inserir(entrevistado);
            gResposta.Inserir(resp);
            return RedirectToAction("Index");
        }

        [HttpPost]
        public ActionResult ListaQuestoes(int id)
        {
            ViewBag.id_Survey = id;
            ViewBag.Titulo = gSurvey.Obter(id).Titulo;
            return View(gQuestao.ListaQuestaoSurvey(id));
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
            SurveyModel questaoModel = gSurvey.Obter(id);
            return View(questaoModel);
        }

        //
        // POST: /Questao/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, QuestaoModel questaoModel)
        {
            if (ModelState.IsValid)
            {

                gQuestao.Remover(id);
                return RedirectToAction("Index");
            }

            return View(questaoModel);
        }
    }
}
