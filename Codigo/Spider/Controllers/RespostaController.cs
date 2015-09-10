using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Services;
using Models;

namespace Spider.Controllers
{
    public class RespostaController : Controller
    {
        private GerenciadorResposta gResposta;
        private GerenciadorEntrevistado gEntrevistado;

        public RespostaController(){
            gResposta = new GerenciadorResposta();
            gEntrevistado = new GerenciadorEntrevistado();
    }
        //
        // GET: /Resposta/

        public ActionResult Index()
        {
            return View(gResposta.ObterTodos());
        }

        //
        // GET: /Resposta/Details/5

        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /Resposta/Create

        public ActionResult Create(int id)
        {
            ViewBag.id_Questao = id;
            return View();
        } 

        //
        // POST: /Resposta/Create

        [HttpPost]
        public ActionResult Create(QuestaoModel questao)
        {
            EntrevistadoModel entrevistado = new EntrevistadoModel();
            RespostaModel resposta = new RespostaModel();
            resposta = questao.respostas;
            resposta.id_Questao = questao.id_Questao;
            resposta.idtb_entrevistado = gEntrevistado.Inserir(entrevistado);
            gResposta.Inserir(resposta);


            return RedirectToAction("Index");
        }
        
        //
        // GET: /Resposta/Edit/5
 
        public ActionResult Edit(int id)
        {
            return View();
        }

        //
        // POST: /Resposta/Edit/5

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
        // GET: /Resposta/Delete/5
 
        public ActionResult Delete(int id)
        {
            return View();
        }

        //
        // POST: /Resposta/Delete/5

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
