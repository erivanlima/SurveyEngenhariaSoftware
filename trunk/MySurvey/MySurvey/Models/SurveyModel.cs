using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MySurvey.Models
{
    public class SurveyModel
    {
        public int id_Survey { get; set; }
        public int id_Responsavel { get; set; }
        public String Titulo { get; set; }
        public String Subtitulo { get; set; }
        public DateTime Data_Criacao { get; set; }
        public DateTime Data_fim { get; set; }
        public Boolean flag_ativo { get; set; }

    }
}