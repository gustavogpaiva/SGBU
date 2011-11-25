using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.SqlClient;
using System.Data;

namespace Biblio.Models
{
    public class Reservas : BiblioBanco
    {
        private int codExemplar;
        private int codUsuario;
        private string status;
        private DateTime dataReserva;
        public Reservas() : base()
        {
            //seleciona reservas
            this.selecionarReservas();
        } 
        //seleciona ultimas reservas 
        public void selecionarReservas() 
        {
            this.comando = new SqlCommand("getReservasUsuario", this.conectar);
            this.comando.CommandType = CommandType.StoredProcedure;
            this.adapter = new SqlDataAdapter(this.comando);
            this.adapter.MissingSchemaAction = MissingSchemaAction.AddWithKey;
            this.dset = new DataSet();
            this.adapter.Fill(dset, "reserva");
            this.conectar.Open();
            this.comando.ExecuteNonQuery();
            this.conectar.Close();
        }
        //cria a reserva para um exemplar que está emprestado
        public void registrarReserva() 
        {
            this.comando = new SqlCommand("inserir_reservas",this.conectar);
            this.comando.CommandType = CommandType.StoredProcedure;
            this.comando.Parameters.AddWithValue("@codUsuario", this.codUsuario);
            this.comando.Parameters.AddWithValue("@codExemplar", this.codExemplar);
            this.comando.Parameters.AddWithValue("@dataReserva", this.dataReserva);
            this.comando.Parameters.AddWithValue("@status", this.status);
            this.conectar.Open();
            this.comando.ExecuteNonQuery();
            this.conectar.Close();
        }
        //remove reserva de um livro 
        public void removerReserva() 
        {
            this.comando = new SqlCommand("deletar_reservas", this.conectar);
            this.comando.CommandType = CommandType.StoredProcedure;
            this.comando.Parameters.AddWithValue("@codUsuario", this.codUsuario);
            this.comando.Parameters.AddWithValue("@codExemplar", this.codExemplar);
            this.comando.Parameters.AddWithValue("@status", this.status);
            this.conectar.Open();
            this.comando.ExecuteNonQuery();
            this.conectar.Close();
        }
        //verifica se existe reserva feito do usuário para este exemplar
        public bool existeReserva() 
        {
            bool existe = false;
            int linha = 0;
            while(linha < this.dset.Tables["reserva"].Rows.Count && !existe)
            {
                if (this.codExemplar == int.Parse(this.dset.Tables["reserva"].Rows[linha]["numExemplar"].ToString()))
                { existe = true; }
                linha++;
            }
            return existe;
        }
        //vincula os dados do exemplar
        public void vincularExemplar(int codigo) 
        {
            this.codExemplar = codigo;
        }
        //vincula os dados do usuario
        public void vincularUsuario(int codigo) 
        {
            this.codUsuario = codigo;
        }
        //altera a data da reserva
        public void alterarDataReserva(DateTime data) 
        {
            this.dataReserva = data;
        }
        //altera o status do exemplar
        public void alterarStatus(string status) 
        {
            this.status = status;
        }
    }
}