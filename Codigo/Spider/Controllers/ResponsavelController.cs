using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Services;
using Models;

namespace Spider.Controllers
{
    public class ResponsavelController : Controller
    {

        private GerenciadorResponsavel gResponsavel;


        public ResponsavelController()
        {
            gResponsavel = new GerenciadorResponsavel();
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
                gResponsavel.Inserir(responsavel);
                return RedirectToAction("Index");
            }
            return View(responsavel);
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
