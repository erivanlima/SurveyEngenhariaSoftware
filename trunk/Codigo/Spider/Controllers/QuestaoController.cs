using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Services;
using Models;
using System.IO;

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
        [HttpGet]
        public ActionResult Create(int id)
        {
            ViewBag.id_Survey = id;
            //QuestaoModel questao = new QuestaoModel();

            return RedirectToAction("Edit/" + DefaultQuestao(id), "Questao");
           //return View(questao);
        }

        public int DefaultQuestao(int idSurvey)
        {
            QuestaoModel questao = new QuestaoModel();
            questao.Pergunta = "";
            questao.id_Survey = idSurvey;
            //int idQuestaoInserida = gQuestao.Inserir(questao);
            //gQuestao.Obter(idQuestaoInserida);
            //return RedirectToAction("ListaQuestoes/" + questao.id_Survey, "Questao");
            return gQuestao.Inserir(questao);
        }

        //
        // POST: /Questao/Create

        //[HttpPost]
        //public ActionResult Create(QuestaoModel questao)
        //{
        //    int idQuestaoInserida=0;
                          
        //            if (questao.Pergunta != null)
        //            {
        //                //questao.id_Survey = id;
        //                //questao.idTB_ITENS_DA_QUESTAO = gItens.Inserir(questao.itens);

        //               idQuestaoInserida = gQuestao.Inserir(questao);
                        
        //            }

        //            //return RedirectToAction("ListaQuestoes/" + questao.id_Survey, "Questao");
        //            return RedirectToAction("Edit/" + idQuestaoInserida, "Questao");
             
        //}

        //[HttpGet]
        //public PartialViewResult CreateItens(int id)
        //{

        //    ViewBag.id_Questao = id;
        //    return PartialView();

        //}

        //[HttpPost]
        public ActionResult CreateItens(Itens_da_QuestaoModel itensModel)
        {

            gItens.Inserir(itensModel);
            return View(gItens.ObterItens(itensModel.id_Questao));
            //return RedirectToAction("Edit/" + idQuestaoInserida, "Questao");

        }

        public PartialViewResult ListaItens(int idQuest)
        {
            return PartialView(gItens.ObterItens(idQuest));
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

        //Get
        [HttpGet]
        public ActionResult ListaQuestoes(int id)
        {
            ViewBag.id_Survey = id;
            return View(gQuestao.ListaQuestaoSurvey(id));
        }

        //Post
        [HttpPost]
        public ActionResult ListaQuestoes(SurveyModel survey)
        {
            ViewBag.id_Survey = survey.id_Survey;
            ViewBag.Titulo = gSurvey.Obter(survey.id_Survey).Titulo;
            return View(gQuestao.ListaQuestaoSurvey(survey.id_Survey));
        }

        //
        // GET: /Questao/Edit/5

        public ActionResult Edit(int id)
        {
            QuestaoModel questaoModel = gQuestao.Obter(id);
            return View(questaoModel);
        }

        //
        // POST: /Survey/Edit/5

        [HttpPost]
        public ActionResult Edit(int id, QuestaoModel questaoModel)
        {
            if (ModelState.IsValid)
            {
                gQuestao.Editar(questaoModel);
                return RedirectToAction("ListaQuestoes/" + questaoModel.id_Survey, "Questao");
            }

            return View(questaoModel);
        }

        //
        // GET: /Questao/Delete/5

        public ActionResult Delete(int id)
        {
            QuestaoModel questaoModel = gQuestao.Obter(id);
            return View(questaoModel);
        }

        //
        // POST: /Questao/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, QuestaoModel questaoModel)
        {
            questaoModel = gQuestao.Obter(id);
            if (ModelState.IsValid)
            {

                gQuestao.Remover(id);
                return RedirectToAction("ListaQuestoes/" + questaoModel.id_Survey, "Questao");
            }

            return View(questaoModel);
        }



        [HttpGet]
        public ActionResult CreateQuestoes(int id)
        {
            ViewBag.id_Survey = id;
            return View();
        }

        [HttpPost]
        public ActionResult CreateQuestoes(SurveyModel survey, HttpPostedFileBase[] images)
        {
            if (images[0] != null && images[0].ContentLength > 0)
            {
                // extract only the fielname
                var fileName = Path.GetFileName(images[0].FileName);
                // store the file inside ~/App_Data/uploads folder
                var path = Path.Combine(Server.MapPath("~/App_Data/uploads"), fileName);
                images[0].SaveAs(path);
            }

            //List<QuestaoModel> novasquestoes = new List<QuestaoModel>();
            //List<Itens_da_QuestaoModel> itensQuestoes = new List<Itens_da_QuestaoModel>();


            foreach (QuestaoModel questao in survey.questoes)
            {
                if (questao.Pergunta != null)
                {
                    questao.id_Survey = survey.id_Survey;
                    //questao.idTB_ITENS_DA_QUESTAO = gItens.Inserir(questao.itens);

                    questao.Img = new byte[images[0].ContentLength];
                    images[0].InputStream.Read(questao.Img, 0, images[0].ContentLength);

                    gQuestao.Inserir(questao);
                }

            }

            return RedirectToAction("ListaQuestoes/"+survey.id_Survey,"Questao");
        }
    }
}
