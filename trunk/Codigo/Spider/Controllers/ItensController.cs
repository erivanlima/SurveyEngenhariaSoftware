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
    public class ItensController : Controller
    {
        //
        // GET: /Itens/
        private GerenciadorItens gItens;
         public ItensController()
        {
            gItens = new GerenciadorItens();
         
         }
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult DetalhesItens(int id)
        {
            return View(gItens.Obter(id));
        }

        public ActionResult ListaItens(int idQuest)
        {
            return View(gItens.ObterItens(idQuest));
        }
        //
        // GET: /Itens/Details/5

        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /Itens/Create

        public ActionResult Create(int id)
        {
            ViewBag.id_Questao = id;
            return View();
        } 

        //
        // POST: /Itens/Create

        [HttpPost]
        public ActionResult Create(Itens_da_QuestaoModel itensModel)
        {
           
                // TODO: Add insert logic here
                gItens.Inserir(itensModel);
                return PartialView(ListaItens(itensModel.id_Questao));
           
        }
        
        //
        // GET: /Itens/Edit/5
 
        public ActionResult Edit(int id)
        {
            return View();
        }

        //
        // POST: /Itens/Edit/5

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
        // GET: /Itens/Delete/5
 
        public ActionResult Delete(int id)
        {
            return View();
        }

        //
        // POST: /Itens/Delete/5

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
