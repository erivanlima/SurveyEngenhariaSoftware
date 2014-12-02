using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Models
{
    public class RespostaModel
    {
        public int id_Resposta { get; set; }
        public int idTB_ENTREVISTADO { get; set; }
        public int id_Questao { get; set; }
        public String Resposta { get; set; }
        public String Item { get; set; }
    }
}