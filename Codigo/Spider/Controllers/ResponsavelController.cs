﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Services;
using Models;
using System.Web.Security;
using Microsoft.Reporting.WebForms;
using System.Web.UI.DataVisualization.Charting;
using System.Data;
using System.Web.UI.WebControls;
using System.Data.SqlClient;



namespace Spider.Controllers
{
    public class ResponsavelController : Controller
    {

        private GerenciadorResponsavel gResponsavel;
        private GerenciadorSurvey gSurvey;
        private GerenciadorQuestao gQuestao;
        private GerenciadorItens gItens;
        private GerenciadorResposta gResposta;
        private GerenciadorEntrevistado gEntrevistado;


        public ResponsavelController()
        {
            gResponsavel = new GerenciadorResponsavel();
            gSurvey = new GerenciadorSurvey();
            gQuestao = new GerenciadorQuestao();
            gItens = new GerenciadorItens();
            gResposta = new GerenciadorResposta();
            gEntrevistado = new GerenciadorEntrevistado();
        }

        [HttpGet]
        public ActionResult CreateViewTotal(int id)
        {
            ViewBag.id_Survey = id;
            return View(ListaQuestoesItens(id));
            
        }

        public SurveyModel ListaQuestoesItens(int id)
        {
            SurveyModel survey = new SurveyModel();
            Random random = new Random();
            survey = gSurvey.Obter(id);
            List<Itens_da_QuestaoModel> Listaux = new List<Itens_da_QuestaoModel>();
            int index=0;
            survey.questoes = gQuestao.ListaQuestaoSurvey(id).ToList();

            for (int i = 0; i < survey.questoes.Count; i++)
            {
                int odin = survey.questoes[i].id_Questao;
                survey.questoes[i].itens= gItens.ObterItens(odin).ToList();

                if (survey.questoes[i].Randomica)
                {
                    List<string> Lisstr = new List<string>();
                    for (int j = 0; j < survey.questoes[i].itens.Count; j++)
                    {
                        int cont = 1;
                        
                        do
                        {
                            index = random.Next(survey.questoes[i].itens.Count);
                            if (Lisstr.Count == 0)
                            {
                                
                                Lisstr.Add(survey.questoes[i].itens[index].Item);
                                cont--;
                            }
                            if (!Lisstr.Contains(survey.questoes[i].itens[index].Item))
                            {
                                
                                Lisstr.Add(survey.questoes[i].itens[index].Item);
                                cont--;
                            }
                             
                        } while (cont != 0);
                    }
                    
                    
                    for (int k = 0; k < Lisstr.Count; k++ )
                    {
                        survey.questoes[i].itens[k].Item = Lisstr[k].ToString();
                        
                    }
                }

                
            }
            return survey;
        }

        
        [HttpPost]
        public ActionResult CreateViewTotal(SurveyModel survey,  List<string> meucheck)
        {
            int i = 0;
            Itens_da_QuestaoModel itensQuestaoRespostaCheck = new Itens_da_QuestaoModel();
            RespostaModel respostas = new RespostaModel();
            string ip = Request.UserHostAddress;
            EntrevistadoModel entrevistados = new EntrevistadoModel();
            //Posteriormente colocar um if aqui comparando com o IP para evitar que o mesmo entrevistado responda mais de 
            //mais de uma vez.
            entrevistados.nome = ip;
            entrevistados.sobrenome = ip;
            entrevistados.email = ip;
            int id = gEntrevistado.Inserir(entrevistados);
            IQueryable<EntrevistadoModel> entrevistadoE = gEntrevistado.obterIdEntrevistadoUltimo();
            int idEnt =0;
           
            foreach (EntrevistadoModel entrevistado in entrevistadoE)
            {
              idEnt = entrevistado.idTB_ENTREVISTADO;
            }

        
            
            foreach( var  iditem in meucheck)
            {
              i = 0;
              itensQuestaoRespostaCheck = gItens.ObterIDitem(Convert.ToInt32(iditem));
              foreach (var item in survey.questoes)
              {
                  if (itensQuestaoRespostaCheck.id_Questao == item.id_Questao )
                  {
                      respostas.OutroTxt = survey.questoes[i].respostas.OutroTxt;
                      
                  }
                  i++;
              }
               
                respostas.id_Questao = itensQuestaoRespostaCheck.id_Questao;
                respostas.Item = itensQuestaoRespostaCheck.Item;
                respostas.idTB_ENTREVISTADO = idEnt;
                respostas.Resposta = null;
                gResposta.Inserir(respostas);
                
            }

            i = 0;
            foreach (QuestaoModel questoes in survey.questoes)
            {

                if (survey.questoes[i].respostas.OutroTxt == null && survey.questoes[i].respostas.Item != null)
                {

                    if (survey.questoes[i].Tipo.Equals("OBJETIVA") && survey.questoes[i].respostas.Item != null)
                    {

                    
                        respostas.id_Questao = survey.questoes[i].id_Questao;
                        respostas.Item = survey.questoes[i].respostas.Item;
                        respostas.idTB_ENTREVISTADO = idEnt;
                        respostas.Resposta = null;
                        respostas.OutroTxt = null;
                        gResposta.Inserir(respostas);
                        i++;

                    }
                    else
                    {
                        if (survey.questoes[i].Tipo.Equals("SUBJETIVA"))
                        {
                            respostas.Resposta = survey.questoes[i].respostas.Resposta;
                            respostas.id_Questao = survey.questoes[i].id_Questao;
                            respostas.idTB_ENTREVISTADO = idEnt;
                            respostas.Item = null;
                            respostas.OutroTxt = null;
                            gResposta.Inserir(respostas);

                        }
                        i++;
                    }
                }
                else 
                {
                    if (survey.questoes[i].Tipo.Equals("SUBJETIVA"))
                    {
                        respostas.Resposta = survey.questoes[i].respostas.Resposta;
                        respostas.id_Questao = survey.questoes[i].id_Questao;
                        respostas.idTB_ENTREVISTADO = idEnt;
                        respostas.Item = null;
                        respostas.OutroTxt = null;
                        gResposta.Inserir(respostas);
                        i++;

                    }
                    else 
                    {
                        if (survey.questoes[i].respostas.OutroTxt != null && survey.questoes[i].Escolha==false)
                        { 
                            respostas.id_Questao = survey.questoes[i].id_Questao;
                            respostas.idTB_ENTREVISTADO = idEnt;
                            respostas.Item = null;
                            respostas.Resposta = null;
                            respostas.OutroTxt = survey.questoes[i].respostas.OutroTxt;
                            gResposta.Inserir(respostas);
                        }
                        i++;
                    }
                
                }
                
            }


            return RedirectToAction("Index","Home");
        }



        [HttpGet]
        public ActionResult Resp(int id)
        {
            
            return View();
        }



        [HttpGet]
        public ActionResult VisualizarSurvey(int id)
        {
            //ViewBag.id_Survey = id;
            //SurveyModel survey = new SurveyModel();
            //survey = gSurvey.Obter(id);
            //survey.questoes = gQuestao.ListaQuestaoSurvey(id).ToList();
            //for (int i = 0; i < survey.questoes.Count; i++)
            //{
            //    survey.questoes[i].itens = gItens.Obter(survey.questoes[i].idTB_ITENS_DA_QUESTAO);
            //}
            ViewBag.id_Survey = id;
            
                   
            return View(ListaQuestoesItens(id));
            //return View(survey);
        }

        //[HttpPost]
        //public ActionResult VisualizarSurvey(SurveyModel survey)
        //{
        //    int i = 0;
        //    string ip = Request.UserHostAddress;

        //    RespostaModel respostas = new RespostaModel();
        //    EntrevistadoModel entrevistados = new EntrevistadoModel();
        //    //Posteriormente colocar um if aqui comparando com o IP para evitar que o mesmo entrevistado responda mais de 
        //    //mais de uma vez.
        //    entrevistados.nome = ip;
        //    entrevistados.sobrenome = ip;
        //    entrevistados.email = ip;
        //    gEntrevistado.Inserir(entrevistados);
        //    //EntrevistadoModel entrevistados_2 = new EntrevistadoModel();
        //    entrevistados = gEntrevistado.Obter(entrevistados.idTB_ENTREVISTADO);
        //    foreach (QuestaoModel questoes in survey.questoes)
        //    {

        //        if (survey.questoes[i].Tipo.Equals("OBJETIVA"))
        //        {
        //            respostas.Item = survey.questoes[i].respostas.Item;
        //            respostas.id_Questao = survey.questoes[i].id_Questao;
        //            respostas.idTB_ENTREVISTADO = entrevistados.idTB_ENTREVISTADO;
        //            respostas.Resposta = null;
        //            gResposta.Inserir(respostas);
        //            i++;

        //        }
        //        else
        //        {
        //            respostas.Resposta = survey.questoes[i].respostas.Resposta;
        //            respostas.id_Questao = survey.questoes[i].id_Questao;
        //            respostas.idTB_ENTREVISTADO = entrevistados.idTB_ENTREVISTADO;
        //            respostas.Item = null;
        //            gResposta.Inserir(respostas);
        //            i++;

        //        }

        //    }


        //    return View(survey);
        //}

        [HttpGet]
        public ActionResult ListarRespostas(int id)
        {
            ViewBag.id_Survey = id;
            SurveyModel survey = new SurveyModel();
            survey = gSurvey.Obter(id);
            survey.questoes = gQuestao.ListaQuestaoSurvey(id).ToList();
            ViewBag.Titulo = survey.Titulo;
            List<RespostaModel> resp = new List<RespostaModel>();
            List<RespostaModel> resp2 = new List<RespostaModel>();
            for (int i = 0; i < survey.questoes.Count; i++)
            {
                //resp.Add(resp);
                resp = gResposta.ListaRespostaPorQuestao(survey.questoes[i].id_Questao).ToList();
                resp2.AddRange(resp);


            }


            return View(resp2);
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
                MembershipUser usuario = Membership.GetUser();
                int idCodigo = retornarIdResponsavel(usuario.ToString());
                if (idCodigo != -1)
                {
                    Roles.AddUserToRole(usuario.ToString(), "Responsavel");
                    responsavel.id_Responsavel = idCodigo;
                    gResponsavel.Inserir(responsavel);
                    return RedirectToAction("Index");
                }

                return RedirectToAction("Index");
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
            if (ModelState.IsValid)
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

        public ActionResult GerarLinkSurvey(int id)
        {

            return View(gSurvey.Obter(id));
        }

        public ActionResult GetRespostaData()
        {
            Models.DataSetRespostaQuestaoTableAdapters.V_RespostaPorQuestaoTableAdapter ds = 
                new Models.DataSetRespostaQuestaoTableAdapters.V_RespostaPorQuestaoTableAdapter();
          

           var va = ds.GetData(1).AsEnumerable().ToList();
          

            List<string[]> data = new List<string[]>();
            data.Add(new[] { "Item", "Quantidade" });

            foreach (var itens in va)
            {
                data.Add(new[] { itens.Item, itens.qtdItens.ToString() });
            }
            //var data = ds.GetData(41).ToList();
            //list = results2.ToList();
            
            //int count = va.Count();
            //for (int i = 0; i <= count; i++)
            //{
            //    list[i].id_Resposta = va[i].qtdItens;
            //    list[i].Item = va[i].Item ;
            //    list[i].id_Questao = va[i].TB_QUESTAO_id_Questao;
            //    list[i].idTB_ENTREVISTADO = 0;
                
                
            //}


            return Json(data, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetRespostaDataColumn()
        {
            Models.DataSetRespostaQuestaoTableAdapters.V_RespostaPorQuestaoTableAdapter ds =
                new Models.DataSetRespostaQuestaoTableAdapters.V_RespostaPorQuestaoTableAdapter();
         
            var va = ds.GetData(42).AsEnumerable().ToList();

            List<string[]> data = new List<string[]>();
            data.Add(new[] { "Item", "Quantidade" });

            foreach (var itens in va)
            {
                data.Add(new[] { itens.Item, itens.qtdItens.ToString() });
            }

            return Json(data, JsonRequestBehavior.AllowGet);
        }

        public ActionResult AnaliseGrafica()
        {
            return View();
        }

        public ViewResult Respostas()
        {

           
            // Models.DataSetRespostaQuestao.V_RespostaPorQuestaoDataTable;
           // QuestaoModel questao = new QuestaoModel();
           // questao = gQuestao.Obter(41);
           // List<RespostaModel> resp = new List<RespostaModel>();
           // resp = RespostasPorQuestao(41);
           // //resp = dsR();
           // List<string> respString = new List<string>();
            

           // var myChart = new System.Web.Helpers.Chart(width: 600, height: 400)
           //.AddTitle("Resposta por Questão")
           //.AddSeries("Default", chartType: "Pie",
           // xValue: resp, xField: "Item",
           // yValues: resp, yFields: "Item")
           //     //.DataBindTable(resp, xField: "Item")
           //.Write();
           // return null;
            return View();
        }


        public JsonResult RespostasQuestao()
        {
            IEnumerable<RespostaModel> respostas;
            respostas = gResposta.ObterTodos();
            // = (IEnumerable<RespostaModel>)TempData["Resposta"];
            IEnumerable<IGrouping<string, RespostaModel>> grupoResp = respostas.GroupBy(resp => resp.Item);

            List<string[]> data = new List<string[]>();
            data.Add(new[] { "Item", "id_Questao" });

            foreach (var itensGrupo in grupoResp)
            {
                data.Add(new[] { itensGrupo.ElementAtOrDefault(0).Item, itensGrupo.ElementAtOrDefault(0).id_Questao.ToString() });
            }
            return Json(data,JsonRequestBehavior.AllowGet);
        }

        public List<RespostaModel> RespostasPorQuestao(int id)
        {
           
            //ViewBag.id_Survey = id;
            //SurveyModel survey = new SurveyModel();
            //survey = gSurvey.Obter(id);
            //survey.questoes = gQuestao.ListaQuestaoSurvey(id).ToList();
            //ViewBag.Titulo = survey.Titulo;
            QuestaoModel questao = new QuestaoModel();
            questao = gQuestao.Obter(id);
            List<RespostaModel> resp = new List<RespostaModel>();
            List<RespostaModel> resp2 = new List<RespostaModel>();
            //for (int i = 0; i < survey.questoes.Count; i++)
            //{
                //resp.Add(resp);
                resp = gResposta.ListaRespostaPorQuestao(questao.id_Questao).ToList();
                //resp2.AddRange(resp);
                //TempData["Resposta"] = resp;
            //}
            return resp;
        }

        public ActionResult RespostaPorQuestao()
        {
            return View();
        }

        public ActionResult GraficoRespostas()
        {
            int id = 41;
            QuestaoModel questao = new QuestaoModel();
            //questao = gQuestao.Obter(id);
            IEnumerable<RespostaModel> respostas;
            respostas = gResposta.ListaRespostaPorQuestao(id).ToList();
            if (TempData["Respostas"] == null)
            {
             
                respostas = (IEnumerable<RespostaModel>)TempData["Respostas"];
            }

            
            List<string[]> data = new List<string[]>();
            data.Add(new[] { "Questao", "Resposta" });

            foreach (var itensGrupo in respostas)
            {
                data.Add(new[] { itensGrupo.Item, itensGrupo.id_Questao.ToString()});
            }
            return Json(data);
        }

        public ActionResult FormGraficoResposta()
        {
            return View();
        }

        public ActionResult Graficos()
        {
            return View();
        }

        public ActionResult ViewGraficos()
        {
            return View();
        }

       

        //public ActionResult RelatorioRespostasPorQuestao(int idQuest)
        //{
        //    LocalReport relatorio = new LocalReport();

        //    //Caminho onde o arquivo do Report Viewer está localizado
        //    relatorio.ReportPath = Server.MapPath("~/Reports/RelatorioRespostasPorQuestao.rdlc");
        //    //Define o nome do nosso DataSource e qual rotina irá preenche-lo, no caso, nosso método criado anteriormente
        //    relatorio.DataSources.Add(new ReportDataSource("DataSetRespostas", gResposta.ListaRespostaPorQuestao(idQuest)));

        //    string reportType = "PDF";
        //    string mimeType;
        //    string encoding;
        //    string fileNameExtension;

        //    string deviceInfo =
        //     "<DeviceInfo>" +
        //     " <OutputFormat>PDF</OutputFormat>" +
        //     " <PageWidth>9in</PageWidth>" +
        //     " <PageHeight>11in</PageHeight>" +
        //     " <MarginTop>0.7in</MarginTop>" +
        //     " <MarginLeft>2in</MarginLeft>" +
        //     " <MarginRight>2in</MarginRight>" +
        //     " <MarginBottom>0.7in</MarginBottom>" +
        //     "</DeviceInfo>";

        //    Warning[] warnings;
        //    string[] streams;
        //    byte[] bytes;

        //    //Renderiza o relatório em bytes
        //    bytes = relatorio.Render(
        //    reportType,
        //    deviceInfo,
        //    out mimeType,
        //    out encoding,
        //    out fileNameExtension,
        //    out streams,
        //    out warnings);

        //    return File(bytes, mimeType);
        //}

    }
}
