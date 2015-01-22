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
      

        public SurveyController()
        {
            gSurvey = new GerenciadorSurvey();
         
            
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

        public ActionResult Create(SurveyModel survey)
        {
            return View();
        }
        public ActionResult CreateQuestoes()
        {
            return View();
        }
        [HttpPost]
        public ActionResult CreateQuestoes(SurveyModel survey)
        {
            return View();
        }
        //
        // POST: /Survey/Create

       /** [HttpPost]
        public ActionResult Create(SurveyModel survey)
        {
            if (ModelState.IsValid)
            {        
                gSurvey.Inserir(survey);
                return RedirectToAction("Index");
           
            }

            return View(survey);
        }*/
        
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
