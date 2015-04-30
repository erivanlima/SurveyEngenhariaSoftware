using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Services;
using Models;
using System.IO;
using System.Web.UI.WebControls;

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
        private GerenciadorClasse gClasses;


        public QuestaoController()
        {
            gQuestao = new GerenciadorQuestao();
            gEntrevistado = new GerenciadorEntrevistado();
            gResposta = new GerenciadorResposta();
            gSurvey = new GerenciadorSurvey();
            gItens = new GerenciadorItens();
            gClasses = new GerenciadorClasse();

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
        // GET: /Questao/ModeloQuestoes
        [HttpGet]
        public ActionResult ModeloQuestoes(int id)
        {
            ViewBag.id_Survey = id;
            //QuestaoModel questao = new QuestaoModel();

            return View();
            //return View(questao);
        }

        //
        // GET: /Questao/Create
        [HttpGet]
        public ActionResult CriarQuestao(int id)
        {
            ViewBag.id_Survey = id;
            return View();
        }

        [HttpPost]
        public ActionResult CriarQuestao(int id, QuestaoModel questao)
        {
            questao.Tipo = "SUBJETIVA";
            gQuestao.Inserir(questao);

            return RedirectToAction("ListaQuestoes/" + questao.id_Survey, "Questao");

        }

        [HttpGet]
        public ActionResult Create2(int id)
        {
            ViewBag.id_Survey = id;


            return RedirectToAction("Edit2/" + DefaultQuestaoObj(id), "Questao");

        }

        public ActionResult CriarQuestaoObj(int id)
        {
            ViewBag.id_Survey = id;
            return View();
        }


        [HttpPost]
        public ActionResult CriarQuestaoObj(int id, QuestaoModel questaoModel)
        {

            questaoModel.Tipo = "OBJETIVA";
            int idQuestao = gQuestao.Inserir(questaoModel);
            if (ModelState.IsValid)
            {
                foreach (Itens_da_QuestaoModel item in questaoModel.itens)
                {
                    if (item.Item != null)
                    {
                        item.id_Questao = idQuestao;
                        gItens.Inserir(item);
                    }

                }

                return RedirectToAction("ListaQuestoes/" + questaoModel.id_Survey, "Questao");

            }

            return View(questaoModel);
        }

        [HttpGet]
        public ActionResult CriarQuestaoImgObj(int id)
        {
            ViewBag.id_Survey = id;
            //return RedirectToAction("Edit3/" + DefaultQuestaoObjImg(id), "Questao");
            return View();
        }

        [HttpPost]
        public ActionResult CriarQuestaoImgObj(int id, QuestaoModel questaoModel, HttpPostedFileBase[] images)
        {
            questaoModel.Tipo = "OBJETIVA";
            
            if (images[0] != null && images[0].ContentLength > 0)
            {
                // extract only the fielname
                var fileName = Path.GetFileName(images[0].FileName);
                // store the file inside ~/App_Data/uploads folder
                var path = Path.Combine(Server.MapPath("~/App_Data/uploads"), fileName);
                images[0].SaveAs(path);
            }

            if (questaoModel.Pergunta != null)
            {
                
                questaoModel.Img = new byte[images[0].ContentLength];
                images[0].InputStream.Read(questaoModel.Img, 0, images[0].ContentLength);

                int idquest = gQuestao.Inserir(questaoModel);
                //gQuestao.Editar(questaoModel);

                foreach (Itens_da_QuestaoModel item in questaoModel.itens)
                {
                    if (item.Item != null)
                    {
                        item.id_Questao = idquest;
                        gItens.Inserir(item);
                    }

                }

                return RedirectToAction("ListaQuestoes/" + questaoModel.id_Survey, "Questao");
            }

            return View(questaoModel);
        }

        [HttpGet]
        public ActionResult CriarQuestaoCodObj(int id)
        {
            ViewBag.id_Survey = id;
            
            //return RedirectToAction("Edit4/" + DefaultQuestaoObj(id), "Questao");
            return View();
        }

        [HttpPost]
        public ActionResult CriarQuestaoCodObj(int id, QuestaoModel questao, List<HttpPostedFileBase> files)
        {

            questao.Tipo = "OBJETIVA";
            questao.EhCodigo = true;
            int idquest = gQuestao.Inserir(questao);

            foreach (HttpPostedFileBase file in files)
            {
                if (file != null && file.ContentLength > 0)
                {
                    string result;
                    // extract only the fielname
                    var fileName = Path.GetFileName(file.FileName);
                    // store the file inside ~/App_Data/uploads folder
                    var path = Path.Combine(Server.MapPath("~/App_Data/uploads"), fileName);
                    file.SaveAs(path);

                    ClasseModel classe = new ClasseModel();
                    result = new StreamReader(file.InputStream).ReadToEnd();
                    classe.id_Questao = idquest;
                    classe.Codigo = result;
                    gClasses.Inserir(classe);
                }

                if (questao.Pergunta != null)
                {

                    foreach (Itens_da_QuestaoModel item in questao.itens)
                    {
                        if (item.Item != null)
                        {
                            item.id_Questao = idquest;
                            gItens.Inserir(item);
                        }

                    }

                }

                return RedirectToAction("ListaQuestoes/" + questao.id_Survey, "Questao");

            }
            return View();
        }

        [HttpGet]
        public ActionResult Create5(int id)
        {
            ViewBag.id_Survey = id;
            return View();
        }

        [HttpPost]
        public ActionResult Create5(int id, QuestaoModel questao, List<HttpPostedFileBase> files)
        {

            questao.Tipo = "SUBJETIVA";
            int idquest = gQuestao.Inserir(questao);

            foreach (HttpPostedFileBase file in files)
            {
                if (file != null && file.ContentLength > 0)
                {
                    string result;
                    // extract only the fielname
                    var fileName = Path.GetFileName(file.FileName);
                    // store the file inside ~/App_Data/uploads folder
                    var path = Path.Combine(Server.MapPath("~/App_Data/uploads"), fileName);
                    file.SaveAs(path);

                    ClasseModel classe = new ClasseModel();
                    result = new StreamReader(file.InputStream).ReadToEnd();
                    classe.id_Questao = idquest;
                    classe.Codigo = result;
                    gClasses.Inserir(classe);
                }
               
            }

            return RedirectToAction("ListaQuestoes/" + questao.id_Survey, "Questao");

        }

        public int DefaultQuestaoSubjetiva(int idSurvey)
        {
            QuestaoModel questao = new QuestaoModel();
            questao.Pergunta = "";
            questao.id_Survey = idSurvey;
            questao.Tipo = "SUBJETIVA";
            //int idQuestaoInserida = gQuestao.Inserir(questao);
            //gQuestao.Obter(idQuestaoInserida);
            //return RedirectToAction("ListaQuestoes/" + questao.id_Survey, "Questao");
            return gQuestao.Inserir(questao);
        }

        public int DefaultQuestaoObj(int idSurvey)
        {
            QuestaoModel questao = new QuestaoModel();
            questao.Pergunta = "";
            questao.id_Survey = idSurvey;
            questao.Tipo = "OBJETIVA";
            //int idQuestaoInserida = gQuestao.Inserir(questao);
            //gQuestao.Obter(idQuestaoInserida);
            //return RedirectToAction("ListaQuestoes/" + questao.id_Survey, "Questao");
            return gQuestao.Inserir(questao);
        }

        public int DefaultQuestaoObjImg(int idSurvey)
        {
            QuestaoModel questao = new QuestaoModel();
            questao.Pergunta = "";
            questao.id_Survey = idSurvey;
            questao.Tipo = "OBJETIVA";
            //int idQuestaoInserida = gQuestao.Inserir(questao);
            //gQuestao.Obter(idQuestaoInserida);
            //return RedirectToAction("ListaQuestoes/" + questao.id_Survey, "Questao");
            return gQuestao.Inserir(questao);
        }

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


        public PartialViewResult InfoSurvey(int id)
        {
            return PartialView(gSurvey.Obter(id));
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
            if (questaoModel.EhCodigo == false && questaoModel.Img == null && questaoModel.Tipo.Equals("OBJETIVA"))
            {
                return RedirectToAction("Edit2/" + id, "Questao");
            }
            if (questaoModel.Img != null)
            {
                return RedirectToAction("Edit3/" + id, "Questao");
            }
            if (questaoModel.EhCodigo != false)
            {
                return RedirectToAction("Edit4/" + id, "Questao");
            }
            return View(questaoModel);
        }

        //
        // POST: /Survey/Edit/5

        [HttpPost]
        public ActionResult Edit(int id, QuestaoModel questaoModel)
        {


            if (ModelState.IsValid)
            {
                foreach (Itens_da_QuestaoModel item in questaoModel.itens)
                {
                    item.id_Questao = questaoModel.id_Questao;

                    gItens.Inserir(item);



                }
                gQuestao.Editar(questaoModel);
                return RedirectToAction("ListaQuestoes/" + questaoModel.id_Survey, "Questao");

            }

            return View(questaoModel);
        }


        public ActionResult Edit2(int id)
        {
            //List<Itens_da_QuestaoModel> itens = new List<Itens_da_QuestaoModel>();
            QuestaoModel questaoModel = gQuestao.Obter(id);
            questaoModel.itens = gItens.ObterItens(questaoModel.id_Questao).ToList();
            return View(questaoModel);
        }

        //
        // POST: /Survey/Edit/5

        [HttpPost]
        public ActionResult Edit2(int id, QuestaoModel questaoModel)
        {
            gItens.RemoverPorQuestao(questaoModel.id_Questao);

            if (ModelState.IsValid)
            {

                foreach (Itens_da_QuestaoModel item in questaoModel.itens)
                {
                    if (item.Item != null)
                    {

                        item.id_Questao = questaoModel.id_Questao;
                        gItens.Inserir(item);
                    }
                }

                foreach (Itens_da_QuestaoModel item in questaoModel.itensAux)
                {

                    item.id_Questao = questaoModel.id_Questao;
                    gItens.Inserir(item);

                }

                gQuestao.Editar(questaoModel);
                return RedirectToAction("ListaQuestoes/" + questaoModel.id_Survey, "Questao");

            }

            return View(questaoModel);
        }


        public ActionResult Edit3(int id)
        {
            QuestaoModel questaoModel = gQuestao.Obter(id);
            questaoModel.itens = gItens.ObterItens(id).ToList();
            ViewBag.id_Questao = questaoModel.id_Questao;
            return View(questaoModel);
        }

        //
        // POST: /Survey/Edit/5

        [HttpPost]
        public ActionResult Edit3(int id, QuestaoModel questaoModel, HttpPostedFileBase[] images)
        {

            if (images[0] != null && images[0].ContentLength > 0)
            {
                // extract only the fielname
                var fileName = Path.GetFileName(images[0].FileName);
                // store the file inside ~/App_Data/uploads folder
                var path = Path.Combine(Server.MapPath("~/App_Data/uploads"), fileName);
                images[0].SaveAs(path);
            }

            if (questaoModel.Pergunta != null)
            {
                //questaoModel.id_Survey = survey.id_Survey;
                //questao.idTB_ITENS_DA_QUESTAO = gItens.Inserir(questao.itens);

                questaoModel.Img = new byte[images[0].ContentLength];
                images[0].InputStream.Read(questaoModel.Img, 0, images[0].ContentLength);

                //gQuestao.Editar(questaoModel);

                //Itens_da_QuestaoModel item = new Itens_da_QuestaoModel();
                //item.id_Questao = questaoModel.id_Questao;

                foreach (Itens_da_QuestaoModel item in questaoModel.itens)
                {
                    //Itens_da_QuestaoModel item = new Itens_da_QuestaoModel();
                    //survey.questoes[i].itens
                    item.id_Questao = questaoModel.id_Questao;
                    gItens.Inserir(item);
                }
                gQuestao.Editar(questaoModel);
                return RedirectToAction("ListaQuestoes/" + questaoModel.id_Survey, "Questao");
            }

            return View(questaoModel);
        }



        public ActionResult Edit4(int id)
        {
            QuestaoModel questaoModel = gQuestao.Obter(id);
            return View(questaoModel);
        }

        //
        // POST: /Survey/Edit/5

        [HttpPost]
        public ActionResult Edit4(int id, QuestaoModel questaoModel, List<HttpPostedFileBase> files)
        {
            foreach (HttpPostedFileBase file in files)
            {
                if (file != null && file.ContentLength > 0)
                {
                    // extract only the fielname
                    var fileName = Path.GetFileName(file.FileName);
                    // store the file inside ~/App_Data/uploads folder
                    var path = Path.Combine(Server.MapPath("~/App_Data/uploads"), fileName);
                    file.SaveAs(path);
                    string result;

                    ClasseModel classe = new ClasseModel();
                    result = new StreamReader(file.InputStream).ReadToEnd();
                    classe.id_Questao = questaoModel.id_Questao;
                    classe.Codigo = result;
                    gClasses.Inserir(classe);
                }
            }

            if (questaoModel.Pergunta != null)
            {

                foreach (Itens_da_QuestaoModel item in questaoModel.itens)
                {
                    item.id_Questao = questaoModel.id_Questao;
                    gItens.Inserir(item);
                }
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
                List<Itens_da_QuestaoModel> ListaItens = gItens.ObterItens(questaoModel.id_Questao).ToList();
                foreach (Itens_da_QuestaoModel itens in ListaItens)
                {
                    gItens.RemoverPorQuestao(itens.id_Questao);
                }
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

                    int idQuest = gQuestao.Inserir(questao);

                    Itens_da_QuestaoModel item = new Itens_da_QuestaoModel();
                    item.id_Questao = idQuest;

                    foreach (Itens_da_QuestaoModel itens in questao.itens)
                    {

                        //survey.questoes[i].itens
                        //item.id_Questao = questaoModel.id_Questao;

                        gItens.Inserir(item);



                    }
                }

            }

            return RedirectToAction("ListaQuestoes/" + survey.id_Survey, "Questao");
        }

        public FileContentResult GetImagem(int id)
        {
            FileContentResult retorno = null;
            byte[] byteArray = gQuestao.ObterImagem(id);
            if (byteArray != null && byteArray.Length != 0)
            {
                retorno = new FileContentResult(byteArray, "image/*");
            }
            //else
            //{
            //    string imagemPadrao = Server.MapPath("null");
            //    return new FileContentResult(ReadByteArrayFromFile(imagemPadrao), "image/*");
            //}
            return retorno;
        }

        public static byte[] ReadByteArrayFromFile(string fileName)
        {
            byte[] buff = null;
            FileStream fs = new FileStream(fileName, FileMode.Open, FileAccess.Read);
            BinaryReader br = new BinaryReader(fs);
            long numBytes = new FileInfo(fileName).Length;
            buff = br.ReadBytes((int)numBytes);
            return buff;
        }
    }
}
