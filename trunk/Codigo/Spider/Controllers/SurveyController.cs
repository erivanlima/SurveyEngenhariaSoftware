﻿using System;
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



        public SurveyController()
        {
            gSurvey = new GerenciadorSurvey();
            gQuestao = new GerenciadorQuestao();
            gItens = new GerenciadorItens();
            gResposta = new GerenciadorResposta();
            gResponsavel = new GerenciadorResponsavel();


        }

        public ActionResult Index()
        {
            MembershipUser usuario = Membership.GetUser();
            int idCodigo = gResponsavel.ObterIdResp(usuario.ToString());
            return View(gSurvey.ListarSurvey(idCodigo));
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
                    //questao.idTB_ITENS_DA_QUESTAO = gItens.Inserir(questao.itens);
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

        //[HttpGet]
        //public ActionResult ListaQuestoes(int idsurvey)
        //{

        //    //ViewBag.id_Questao = gQuestao.Obter(id).id_Questao;
        //    //ViewBag.Pergunta = gQuestao.Obter(id).Pergunta;
        //    ViewBag.id_Survey = idsurvey;

        //    return View();
        //}

        //[HttpPost]
        //public ActionResult ListaQuestoes(SurveyModel survey)
        //{
        //    //int idsurvey = 0;
        //    //SurveyModel survey = new SurveyModel();
        //    List<QuestaoModel> SurveyQuestoes = new List<QuestaoModel>();

        //    SurveyQuestoes = survey.questoes;
        //    foreach (QuestaoModel questao in SurveyQuestoes)
        //    {
        //        SurveyQuestoes.Add(gQuestao.Obter(survey.id_Survey));
        //        //if (questao.id_Survey == idsurvey)
        //        //{
        //        //questao.idTB_ITENS_DA_QUESTAO = gItens.Inserir(questao.itens);
        //        SurveyQuestoes.Add(gQuestao.Obter(questao.id_Survey));
        //        //gQuestao.Inserir(questao);
        //        //}

        //    }

        //    return View(SurveyQuestoes);
        //}

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
        public ActionResult Delete(int id,int o=0)
        {
            if (ModelState.IsValid)
               {
                   SurveyModel survey = new SurveyModel();
                   survey = gSurvey.Obter(id);
                   survey.questoes = gQuestao.ListaQuestaoSurvey(id).ToList();
                   for (int i = 0; i < survey.questoes.Count; i++)
                   {
                       //survey.questoes[i].itens = gItens.Obter(survey.questoes[i].idTB_ITENS_DA_QUESTAO);
                   }
                   foreach (QuestaoModel questao in survey.questoes)
                   {
                       gResposta.Remover(questao.respostas.id_Resposta);
                       if (questao.Tipo.Equals("OBJETIVA"))
                       {
                           gQuestao.Remover(questao.id_Questao);
                           //gItens.Remover(questao.idTB_ITENS_DA_QUESTAO);
                       }
                       else
                       {
                           gQuestao.Remover(questao.id_Questao);
                       }
                   }

               }
             gSurvey.Remover(id);
             return RedirectToAction("Index");
           // return View();
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


    }


}
