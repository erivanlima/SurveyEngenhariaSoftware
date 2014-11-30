using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Modelos
{
    public class QuestaoModel
    {
        //enum Tipo
        //{
        //    Objetiva,
        //    Subjetiva
        //};

        //enum Linguagem
        //{
        //    CSharp,Java,PHP
        //};

        public int id_Questao { get; set; }
        public int idTB_ITENS_DA_QUESTAO { get; set; }
        public int id_Survey { get; set; }
        public string Tipo { get; set; }
        public String Pergunta { get; set; }
        public byte[] Img { get; set; }
        public Boolean Randomica { get; set; }
        public Boolean Obrigatoria { get; set; }
        public Boolean Codigo { get; set; }
        public string Linguagem { get; set; }
     
    }
    public enum Tipo {  Objetiva,Subjetiva };
    public enum Linguagem { CSharp, Java, PHP };

}