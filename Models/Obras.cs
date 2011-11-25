using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.SqlClient;
using System.Data;

namespace Biblio.Models
{
    public class Obras : BiblioBanco
    {
        //dados das obras
        private int codObra;
        private string isbn;
        private string tipo;
        private string descricao;
        private string editora;
        private string edicao;
        private string autores;
        //contrução da classe
        public Obras() : base() 
        {
            //obtem ultimas todas obras
            this.selecionarObras();
        }
        //seleciona todas as obras
        public void selecionarObras()
        {
            this.comando = new SqlCommand("getObras", this.conectar);
            this.comando.CommandType = CommandType.StoredProcedure;
            this.adapter = new SqlDataAdapter(this.comando);
            this.adapter.MissingSchemaAction = MissingSchemaAction.AddWithKey;
            this.dset = new DataSet();
            this.adapter.Fill(dset, "obra");
            this.conectar.Open();
            this.comando.ExecuteNonQuery();
            this.conectar.Close();
        }
        //cadastrar uma nova obra
        public void cadastrar()
        {
            this.comando = new SqlCommand("inserir_obras", this.conectar);
            this.comando.CommandType = CommandType.StoredProcedure;
            this.comando.Parameters.AddWithValue("@isbn", this.isbn);
            this.comando.Parameters.AddWithValue("@tipo", this.tipo);
            this.comando.Parameters.AddWithValue("@descricao", this.descricao);
            this.comando.Parameters.AddWithValue("@editora", this.editora);
            this.comando.Parameters.AddWithValue("@edicao", this.edicao);
            this.comando.Parameters.AddWithValue("@autores", this.autores);
            this.conectar.Open();
            this.comando.ExecuteNonQuery();
            this.conectar.Close();
        }
        //deletar uma obra existente pelo codigo
        public void deletar(int codigo) 
        {
            this.comando = new SqlCommand("deletar_obras", this.conectar);
            this.comando.CommandType = CommandType.StoredProcedure;
            this.comando.Parameters.AddWithValue("@codObra", codigo);
            this.conectar.Open();
            this.comando.ExecuteNonQuery();
            this.conectar.Close();
        }
        //verifica se existe um obra cadastrada com o mesmo ISBN
        public bool existeObra() 
        {
            bool existe = false;
            int linha = 0;
            while (linha < this.dset.Tables["obra"].Rows.Count && !existe)
            {
                this.rowResultado = this.dset.Tables["obra"].Rows[linha];
                if (this.isbn == this.rowResultado["isbn"].ToString())
                {
                    existe = true;
                }
                else
                { linha++; }
            }
            return existe;
        }
        //envia ao modelo os dados da obra passado por parametro
        public void vincularObra(string isbn, string tipo, string descricao, string editora, string edicao, string autores) 
        {
            this.isbn = isbn;
            this.tipo = tipo;
            this.descricao = descricao;
            this.editora = editora;
            this.edicao = edicao;
            this.autores = autores;
        }
        //pesquisa uma obra existente ou exemplar por codigo por titulo ou por autor
        public void PesquisarObra(string termo, string[] procedimento) 
        {
            this.comando = new SqlCommand(procedimento[1], this.conectar);
            this.comando.CommandType = CommandType.StoredProcedure;
            this.comando.Parameters.AddWithValue(procedimento[0], termo);
            this.adapter = new SqlDataAdapter(this.comando);
            this.adapter.MissingSchemaAction = MissingSchemaAction.AddWithKey;
            this.dset = new DataSet();
            this.adapter.Fill(this.dset, "obra");
            //percorre todo dataset obtendo os resultados da pesquisas
            for (int i = 0; i < this.dset.Tables["obra"].Rows.Count; i++)
            {
                //atribui cada row do dataset ao datarow
                this.rowResultado = this.dset.Tables["obra"].Rows[i];
                //adiciona os resultados a lista de obras
                this.listaResultado.Add(this.rowResultado);
            }
        }
        //atualiza dados da obra após alterações
        public void atualizarObra() 
        { 
            this.comando = new SqlCommand("atualizar_obra", this.conectar);
            this.comando.CommandType = CommandType.StoredProcedure;
            this.comando.Parameters.AddWithValue("@codigo", this.codObra);
            this.comando.Parameters.AddWithValue("@isbn", this.isbn);
            this.comando.Parameters.AddWithValue("@tipo", this.tipo);
            this.comando.Parameters.AddWithValue("@descricao", this.descricao);
            this.comando.Parameters.AddWithValue("@editora", this.editora);
            this.comando.Parameters.AddWithValue("@edicao", this.edicao);
            this.comando.Parameters.AddWithValue("@autores", this.autores);
            this.conectar.Open();
            this.comando.ExecuteNonQuery();
            this.conectar.Close();         
        }
    }
}