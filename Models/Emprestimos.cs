using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.SqlClient;
using System.Data;

namespace Biblio.Models
{
    public class Emprestimos : BiblioBanco
    {
        //dados das obras
        private int codExemplar;
        private int codUsuario;
        private DateTime dataEmprestimo;
        private DateTime dataPrevista;
        private DateTime dataEntrega;
        private float multa;
        private int atraso;
        private string status;
        //contrução da classe
        public Emprestimos() : base() 
        {
            //seleciona emprestimos
            this.selecionarEmprestimos();
        }
        //seleciona todos emprestimos
        public void selecionarEmprestimos() 
        {
            this.comando = new SqlCommand("getEmprestimos",this.conectar);
            this.comando.CommandType = CommandType.StoredProcedure;
            this.adapter = new SqlDataAdapter(this.comando);
            this.adapter.MissingSchemaAction = MissingSchemaAction.AddWithKey;
            this.dset = new DataSet();
            this.adapter.Fill(dset, "emprestimo");
            this.conectar.Open();
            this.comando.ExecuteNonQuery();
            this.conectar.Close();
        }
        //registra um novo emprestimo no banco
        public void registrarEmprestimo() 
        {
            this.comando = new SqlCommand("inserir_emprestimos",this.conectar);
            this.comando.CommandType = CommandType.StoredProcedure;
            this.comando.Parameters.AddWithValue("@codExemplar", this.codExemplar);
            this.comando.Parameters.AddWithValue("@codUsuario", this.codUsuario);
            this.comando.Parameters.AddWithValue("@dataEmprestimo", this.dataEmprestimo);
            this.comando.Parameters.AddWithValue("@dataPrevista", this.dataPrevista);
            this.comando.Parameters.AddWithValue("@dataEntrega", this.dataEntrega);
            this.comando.Parameters.AddWithValue("@multa", this.multa);
            this.comando.Parameters.AddWithValue("@atraso", this.atraso);
            this.comando.Parameters.AddWithValue("@status", this.status);
            this.conectar.Open();
            this.comando.ExecuteNonQuery();
            this.conectar.Close();
        }
        //registrar devolução do empréstimo
        public void registrarDevolucao() 
        {
            this.comando = new SqlCommand("inserir_devolucao",this.conectar);
            this.comando.CommandType = CommandType.StoredProcedure;
            this.comando.Parameters.AddWithValue("@codExemplar", this.codExemplar);
            this.comando.Parameters.AddWithValue("@codUsuario", this.codUsuario);
            this.comando.Parameters.AddWithValue("@dataEntrega", this.dataEntrega);
            this.comando.Parameters.AddWithValue("@status", this.status);
            this.conectar.Open();
            this.comando.ExecuteNonQuery();
            this.conectar.Close();
        }
        //verifica se exemplar está em emprestimo, pesquisando pelo código
        public bool existeEmprestimo(int codExemplar) 
        {
            bool existe = false;
            //procura se ja existe um emprestimo feito pelo numero do exemplar
            int linha = 0;
            while (linha < this.dset.Tables["emprestimo"].Rows.Count && !existe)
            {
                if (codExemplar == int.Parse(this.dset.Tables["emprestimo"].Rows[linha]["numExemplar"].ToString()))
                {
                    if (this.dset.Tables["emprestimo"].Rows[linha]["status"].ToString() == "Emprestado")
                    { existe = true; }
                }
                linha++;
            }
            return existe;
        }
        public void vincularExemplar(int codExemplar) 
        {
            this.codExemplar = codExemplar;
        }
        public void vincularUsuario(int codUsuario) 
        {
            this.codUsuario = codUsuario;
        }
        public void calcularMulta() 
        {
            this.multa = this.multa * this.atraso;
        }
        public void alterarDataEmprestimo(DateTime data)
        {
            this.dataEmprestimo = data;
        }
        public void alterarDataPrevista(DateTime data) 
        {
            this.dataPrevista = data;
        }
        public void alterarDevolucao(DateTime data) 
        {
            this.dataEntrega = data;
        }
        public void alterarStatus(string status)
        {
            this.status = status;
        }
    }
}