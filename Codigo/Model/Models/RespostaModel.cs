using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Models
{
    public class RespostaModel
    {
        public int id_Resposta { get; set; }
        public int idtb_entrevistado { get; set; }
        public int id_Questao { get; set; }
        public String Resposta { get; set; }
        public String Item { get; set; }
        public string OutroTxt { get; set; }
      
    }
}