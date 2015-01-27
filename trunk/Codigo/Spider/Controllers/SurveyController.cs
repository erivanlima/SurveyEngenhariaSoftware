using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Models;
using Services;

namespace Spider.Controllers
{
    public class SurveyController : Controller
    {
        //
        // GET: /Survey/
         private GerenciadorSurvey gSurvey;
         private GerenciadorQuestao gQuestao;
         private GerenciadorItens gItens;
         private GerenciadorResposta gResposta;
      
      

        public SurveyController()
        {
            gSurvey = new GerenciadorSurvey();
            gQuestao = new GerenciadorQuestao();
            gItens = new GerenciadorItens();
            gResposta = new GerenciadorResposta();
         
            
        }

        public ActionResult Index()
        {
            
            return View(gSurvey.ObterTodos());
        }

        //
        // GET: /Survey/Details/5

        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /Survey/Create
        [HttpGet]
        public ActionResult CreateSurvey()
        {
            return View();
        }
     
        [HttpPost]
        public ActionResult CreateQuestoes(SurveyModel survey)
        {

            //List<QuestaoModel> novasquestoes = new List<QuestaoModel>();
            //List<Itens_da_QuestaoModel> itensQuestoes = new List<Itens_da_QuestaoModel>();
            
                foreach (QuestaoModel questao in survey.questoes)
                {
                    questao.id_Survey = survey.id_Survey;

                    questao.idTB_ITENS_DA_QUESTAO = gItens.Inserir(questao.itens);
                    
                    gQuestao.Inserir(questao);
                    
                }

                return RedirectToAction("Index");
        }
        [HttpGet]
        public ActionResult CreateQuestoes(int id)
        {
            ViewBag.id_Survey = id;
            return View();
        }
        //
        // POST: /Survey/Create

        [HttpPost]
        public ActionResult CreateSurvey(SurveyModel survey)
        {
            if (ModelState.IsValid)
            {        
                gSurvey.Inserir(survey);
                return RedirectToAction("Index");
           
            }

            return View(survey);
        }
        
        //
        // GET: /Survey/Edit/5
 
        public ActionResult Edit(int id)
        {
            SurveyModel surveyModel = gSurvey.Obter(id);
            return View(surveyModel);
        }

        //
        // POST: /Survey/Edit/5

        [HttpPost]
        public ActionResult Edit(int id, SurveyModel surveyModel)
        {
            if (ModelState.IsValid)
            {

                gSurvey.Editar(surveyModel);
                return RedirectToAction("Index");
            }

            return View(surveyModel);
        }

        //
        // GET: /Survey/Delete/5
 
        public ActionResult Delete(int id)
        {
            SurveyModel surveyModel = gSurvey.Obter(id);
            return View(surveyModel);
        }

        //
        // POST: /Survey/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, SurveyModel surveyModel)
        {
            if (ModelState.IsValid)
            {

                gSurvey.Remover(id);
                return RedirectToAction("Index");
            }

            return View(surveyModel);
        }
    }
}
