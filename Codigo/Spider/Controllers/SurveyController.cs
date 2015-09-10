using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Models;
using Services;
using System.Web.Security;

namespace Spider.Controllers
{
    [Authorize(Roles = "Responsavel")]
    public class SurveyController : Controller
    {
        //
        // GET: /Survey/
        private GerenciadorSurvey gSurvey;
        private GerenciadorQuestao gQuestao;
        private GerenciadorItens gItens;
        private GerenciadorResposta gResposta;
        private GerenciadorResponsavel gResponsavel;
        private GerenciadorClasse gClasses;



        public SurveyController()
        {
            gSurvey = new GerenciadorSurvey();
            gQuestao = new GerenciadorQuestao();
            gItens = new GerenciadorItens();
            gResposta = new GerenciadorResposta();
            gResponsavel = new GerenciadorResponsavel();
            gClasses = new GerenciadorClasse();


        }


        public ActionResult Index()
        {
            MembershipUser usuario = Membership.GetUser();
            int idCodigo = gResponsavel.ObterIdResp(usuario.ToString());
            return View(gSurvey.ListarSurvey(idCodigo));
        }
        public ActionResult Inativo()
        {
            if (TempData["Mensagem"] != null)
            {
                ViewBag.Mensagem  = TempData["Mensagem"];
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
        // GET: /Survey/Details/5

        public ActionResult Details(int id)
        {

            return View(gSurvey.Obter(id));
        }


        [HttpGet]
        public ActionResult CreateQuestoes(int id)
        {
            ViewBag.id_Survey = id;
            return View();
        }

        [HttpPost]
        public ActionResult CreateQuestoes(SurveyModel survey)
        {

            //List<QuestaoModel> novasquestoes = new List<QuestaoModel>();
            //List<Itens_da_QuestaoModel> itensQuestoes = new List<Itens_da_QuestaoModel>();


            foreach (QuestaoModel questao in survey.questoes)
            {
                if (questao.Pergunta != null)
                {
                    questao.id_Survey = survey.id_Survey;
                    //questao.idtb_itens_da_questao = gItens.Inserir(questao.itens);
                    gQuestao.Inserir(questao);
                }

            }

            return RedirectToAction("Index");
        }


        public ActionResult QuestaoPartial()
        {
            //ViewBag.id_Survey = id;
            return PartialView(gQuestao.ObterTodos());
        }

        //
        // GET: /Survey/Create
        [HttpGet]
        public ActionResult CreateSurvey()
        {

            String user =  Membership.GetUser().ToString();
            int id = gResponsavel.ObterIdResp(user);
            ViewBag.id_Responsavel = id;
            return View();
        }



        //
        // POST: /Survey/Create
        [HttpPost]
        public ActionResult CreateSurvey(SurveyModel survey)
        {
            //MembershipUser usuario = Membership.GetUser();
            //int idCodigo = retornarIdResponsavel(usuario.ToString());
            //survey.id_Responsavel = idCodigo;
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
        public ActionResult Delete(int id, SurveyModel survey)
        {
                 int i = 0;
                 survey = gSurvey.Obter(id);
                 survey.questoes = gQuestao.ListaQuestaoSurvey(id).ToList();
                if (ModelState.IsValid)
                 {
                   
                   foreach (QuestaoModel questao in survey.questoes)
                   {
                       gResposta.RemoverRespostaPorQuestao(questao.id_Questao);
                       survey.questoes[i].itens = gItens.ObterItens(survey.questoes[i].id_Questao).ToList();
                       survey.questoes[i].codigos = gClasses.ObterClasses(survey.questoes[i].id_Questao).ToList();
                               foreach (Itens_da_QuestaoModel item in survey.questoes[i].itens)
                               {
                                   gItens.RemoverPorQuestao(questao.id_Questao);
                                   
                               }
                               foreach (ClasseModel item in survey.questoes[i].codigos)
                               {
                                   gClasses.RemoverPorQuestao(questao.id_Questao);

                               }

                           
                          i++;
                   }
                   foreach (QuestaoModel questao in survey.questoes)
                   {
                       gQuestao.RemoverQuestaoPorSurvey(id);
                   }

               }
             gSurvey.Remover(id);
             return RedirectToAction("Index");
           
        }

        //
        public ActionResult EnviarSurvey()
        {

            MembershipUser usuario = Membership.GetUser();
            int idCodigo = gResponsavel.ObterIdResp(usuario.ToString());
            return View(gSurvey.ListarSurvey(idCodigo));
        }

        //
        public ActionResult AnaliseSurvey()
        {

            MembershipUser usuario = Membership.GetUser();
            int idCodigo = gResponsavel.ObterIdResp(usuario.ToString());
            return View(gSurvey.ListarSurvey(idCodigo));
        }

        public ActionResult CalculoAmostral()
        {
            return View();
        }
        [HttpGet]
        public ActionResult VisualizarEnviarSurvey(int id)
        {
            
            ViewBag.id_Survey = id;
            return View(ListaQuestoesItens(id));
         
        }
        public SurveyModel ListaQuestoesItens(int id)
        {
            SurveyModel survey = new SurveyModel();
            survey = gSurvey.Obter(id);
            survey.questoes = gQuestao.ListaQuestaoSurvey(id).ToList();
            for (int j = 0; j < survey.questoes.Count; j++)
            {
                if (survey.questoes[j].EhCodigo)
                {
                    survey.questoes[j].codigos = gClasses.ObterClasses(survey.questoes[j].id_Questao).ToList();
                }
            }

            for (int i = 0; i < survey.questoes.Count; i++)
            {
                int odin = survey.questoes[i].id_Questao;
                survey.questoes[i].itens = gItens.ObterItens(odin).ToList();

                if (survey.questoes[i].Randomica)
                {
                    List<string> auxList = new List<string>();
                    for (int j = 0; j < survey.questoes[i].itens.Count; j++)
                    {
                        auxList.Add(survey.questoes[i].itens[j].Item);

                    }

                    List<string> randomList = new List<string>();
                    Random r = new Random();
                    int randomIndex = 0;

                    while (auxList.Count > 0)
                    {
                        randomIndex = r.Next(0, auxList.Count); //Choose a random object in the list
                        randomList.Add(auxList[randomIndex]); //add it to the new, random list
                        auxList.RemoveAt(randomIndex); //remove to avoid duplicates
                    }
                    for (int k = 0; k < randomList.Count; k++)
                    {
                        survey.questoes[i].itens[k].Item = randomList[k].ToString();

                    }


                }


            }
            return survey;
        }

     


    }


}
