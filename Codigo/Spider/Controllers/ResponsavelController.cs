using System;
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
        private GerenciadorClasse gClasses;


        public ResponsavelController()
        {
            gResponsavel = new GerenciadorResponsavel();
            gSurvey = new GerenciadorSurvey();
            gQuestao = new GerenciadorQuestao();
            gItens = new GerenciadorItens();
            gResposta = new GerenciadorResposta();
            gEntrevistado = new GerenciadorEntrevistado();
            gClasses = new GerenciadorClasse();
        }
        

        [HttpGet]
        public ActionResult CreateViewTotal(int id)
        {
            SurveyModel survey_2 = new SurveyModel();
            ViewBag.id_Survey = id;
            survey_2 = gSurvey.Obter(id);
            if (survey_2.Data_fim < DateTime.Now)
            {
                TempData["Mensagem"] = "Data limite do Survey expirada, contate o responsável.";
                //ViewBag.Mensagem = "Data limite do Survey expirada, contate o responsável.";
                return RedirectToAction("Inativo/" + survey_2.id_Survey, "Survey");
            }
            else if (survey_2.flag_ativo != true)
            {
                TempData["Mensagem"] = "Survey Inativo, contate o responsável.";
                return RedirectToAction("Inativo/" + survey_2.id_Survey, "Survey");
            }
            else
            {
                return View(ListaQuestoesItens(id));
            }
            
        }

        private List<QuestaoModel> RandomizeListaQuestoes(List<QuestaoModel> inputList)
        {
            List<QuestaoModel> randomList = new List<QuestaoModel>();
            Random r = new Random();
            int randomIndex = 0;
            while (inputList.Count > 0)
            {
                randomIndex = r.Next(0, inputList.Count); //Choose a random object in the list
                randomList.Add(inputList[randomIndex]); //add it to the new, random list
                inputList.RemoveAt(randomIndex); //remove to avoid duplicates
            }
            return randomList; //return the new random list
        }

        public SurveyModel ListaQuestoesItens(int id)
        {
            SurveyModel survey = new SurveyModel();
            survey = gSurvey.Obter(id);
            survey.questoes = gQuestao.ListaQuestaoSurvey(id).ToList();
            if (survey.RandomizeQuetsoes)
            {
                survey.questoes = RandomizeListaQuestoes(gQuestao.ListaQuestaoSurvey(id).ToList());
                
            }
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
                survey.questoes[i].itens= gItens.ObterItens(odin).ToList();

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
                    for(int k=0; k < randomList.Count; k++)
                    {
                        survey.questoes[i].itens[k].Item = randomList[k].ToString();
                        
                    }
                        
                }
                
            }
            return survey;
        }

     
        [HttpPost]
        public ActionResult CreateViewTotal(SurveyModel survey,  List<string> meucheck)
        {
            if (survey.Data_fim < DateTime.Now)
            {
                ViewBag.Mensagem = "Data limite do Survey expirada, contate o responsável.";
                return RedirectToAction("Inativo/" + survey.id_Survey, "Survey");
            }
            else if (survey.flag_ativo != true)
            {
                ViewBag.Mensagem = "Survey inativo, contate o responsável.";
                return RedirectToAction("Inativo/" + survey.id_Survey, "Survey");
            }
            else
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
                int idEnt = 0;

                foreach (EntrevistadoModel entrevistado in entrevistadoE)
                {
                    idEnt = entrevistado.idtb_entrevistado;
                }



                foreach (var iditem in meucheck)
                {
                    i = 0;
                    itensQuestaoRespostaCheck = gItens.ObterIDitem(Convert.ToInt32(iditem));
                    foreach (var item in survey.questoes)
                    {
                        if (itensQuestaoRespostaCheck.id_Questao == item.id_Questao)
                        {
                            respostas.OutroTxt = survey.questoes[i].respostas.OutroTxt;

                        }
                        i++;
                    }

                    respostas.id_Questao = itensQuestaoRespostaCheck.id_Questao;
                    respostas.Item = itensQuestaoRespostaCheck.Item;
                    respostas.idtb_entrevistado = idEnt;
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
                            respostas.idtb_entrevistado = idEnt;
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
                                respostas.idtb_entrevistado = idEnt;
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
                            respostas.idtb_entrevistado = idEnt;
                            respostas.Item = null;
                            respostas.OutroTxt = null;
                            gResposta.Inserir(respostas);
                            i++;

                        }
                        else
                        {
                            if (survey.questoes[i].respostas.OutroTxt != null && survey.questoes[i].Escolha == false)
                            {
                                respostas.id_Questao = survey.questoes[i].id_Questao;
                                respostas.idtb_entrevistado = idEnt;
                                respostas.Item = null;
                                respostas.Resposta = null;
                                respostas.OutroTxt = survey.questoes[i].respostas.OutroTxt;
                                gResposta.Inserir(respostas);
                            }
                            i++;
                        }

                    }

                }

                return RedirectToAction("Index", "Home");
            }
            
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
            //    survey.questoes[i].itens = gItens.Obter(survey.questoes[i].idtb_itens_da_questao);
            //}
            ViewBag.id_Survey = id;
            
                   
            return View(ListaQuestoesItens(id));
            //return View(survey);
        }

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

        public JsonResult GetRespostaData(int id)
        {
            Models.DataSetRespostaQuestaoTableAdapters.V_RespostaPorQuestaoTableAdapter ds =
                new Models.DataSetRespostaQuestaoTableAdapters.V_RespostaPorQuestaoTableAdapter();

            var va = ds.GetData(id).AsEnumerable().ToList();

            Models.DataSetRespostaQuestaoTableAdapters.V_RespostaPorQuestaoOutroTableAdapter dsO =
                new Models.DataSetRespostaQuestaoTableAdapters.V_RespostaPorQuestaoOutroTableAdapter();

            var vaOutro = dsO.GetData(id).AsEnumerable().ToList();


            List<string[]> data = new List<string[]>();
            data.Add(new[] { "Item", "Quantidade" });
            foreach (var itens in va)
            {
                data.Add(new[] { itens.Item, itens.qtdItens.ToString() });

            }

            foreach (var itensOutro in vaOutro)
            {
                data.Add(new[] { itensOutro.OutroTxt, itensOutro.qtdItensOutro.ToString() });
            }

            return Json(data, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetRespostaDataColumn(int id)
        {
            Models.DataSetRespostaQuestaoTableAdapters.V_RespostaPorQuestaoTableAdapter ds =
                new Models.DataSetRespostaQuestaoTableAdapters.V_RespostaPorQuestaoTableAdapter();

            var va = ds.GetData(id).AsEnumerable().ToList();

            Models.DataSetRespostaQuestaoTableAdapters.V_RespostaPorQuestaoOutroTableAdapter dsO =
               new Models.DataSetRespostaQuestaoTableAdapters.V_RespostaPorQuestaoOutroTableAdapter();

            var vaOutro = dsO.GetData(id).AsEnumerable().ToList();


            List<string[]> data = new List<string[]>();
            data.Add(new[] { "Item", "Quantidade" });
            foreach (var itens in va)
            {
                data.Add(new[] { itens.Item, itens.qtdItens.ToString() });

            }

            foreach (var itensOutro in vaOutro)
            {
                data.Add(new[] { itensOutro.OutroTxt, itensOutro.qtdItensOutro.ToString() });
            }

            return Json(data, JsonRequestBehavior.AllowGet);
        }

        public ActionResult AnaliseGrafica()
        {
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

        public ActionResult Graficos(int id)
        {
            ViewBag.id_Questao = id;
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
