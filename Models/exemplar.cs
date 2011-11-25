using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

namespace Biblio.Models
{
    public class Exemplar : BiblioBanco
    {
        //dados do exemplar
        private int codExemplar;
        private int codObra;
        private string status;
        //construção da classe
        public Exemplar() : base()
        {      }
        //vincular codigo da obra ao exemplar
        public void vincularExemplar(int codigo, string status)
        {
            this.codObra = codigo;
            this.status = status;
        }
        //cadastrar novo exemplar
        public void cadastrar()
        {
            this.comando = new SqlCommand("inserir_exemplar", this.conectar);
            this.comando.CommandType = CommandType.StoredProcedure;
            this.comando.Parameters.AddWithValue("@codObra", this.codObra);
            this.comando.Parameters.AddWithValue("@status", this.status);
            this.conectar.Open();
            this.comando.ExecuteNonQuery();
            this.conectar.Close();
        }
        //deletar exemplares das obras pelo codigo do exemplar e codigo de obra
        public void deletar(int codigo) 
        {
            this.comando = new SqlCommand("deletar_exemplares", this.conectar);
            this.comando.CommandType = CommandType.StoredProcedure;
            this.comando.Parameters.AddWithValue("@codExemplar", codigo);
            this.conectar.Open();
            this.comando.ExecuteNonQuery();
            this.conectar.Close();
        }
    }
}