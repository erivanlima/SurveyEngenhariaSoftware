using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Models
{
    public class QuestaoModel
    {      
        public int id_Questao { get; set; }
        public int id_Survey { get; set; }
        public RespostaModel respostas { get; set; }
        public List<Itens_da_QuestaoModel> itens { get; set; }
        public string Tipo { get; set; }
        public String Pergunta { get; set; }
        public byte[] Img { get; set; }
        public Boolean Randomica { get; set; }
        public Boolean Obrigatoria { get; set; }
        public Boolean EhCodigo { get; set; }
        public string Linguagem { get; set; }
        public string Codigo { get; set; }

         public QuestaoModel()
        {
            //itens = new Itens_da_QuestaoModel { };
            itens = new List<Itens_da_QuestaoModel> { };
            respostas = new RespostaModel();
        
        }

      



    }
    public enum Tipo { Objetiva, Subjetiva };
    

}