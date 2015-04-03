using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace Models
{
    public class SurveyModel
    {
        public int id_Survey { get; set; }
        public int id_Responsavel { get; set; }
        public List<QuestaoModel> questoes  {get; set;}
        public String Titulo { get; set; }
        public String Subtitulo { get; set; }

        [DataType(DataType.Date)]
        public DateTime Data_Criacao { get; set; }

        [DataType(DataType.Date)]
        public DateTime Data_fim { get; set; }
        public Boolean flag_ativo { get; set; }

        public Boolean RandomizeQuetsoes { get; set; }
        public Boolean UnicaResposta { get; set; }
        public String SenhaAcesso { get; set; }

        public SurveyModel()
        {
            questoes = new List<QuestaoModel> { };
        
        }

    }
}