using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Mvc;
using System.Data.SqlClient;
using System.Data;

namespace Biblio.Models
{
    public class Usuarios : BiblioBanco
    {
        private int codUsuario;
        private string nomeUsuario;
        private string endereco;
        private string telefone;
        private string email;
        private string universidade;
        private string tipoUsuario;
        private int qtdeEmprestimos = 0;
        private int qtdeReservas = 0;
        private string senha;
        private bool existUsuario = false;
        public Usuarios(int codigo) : base() 
        {
            this.selecionarUsuario(codigo);
        }
        //seleciona o usuário existente no sistema para utilizar as funçoes do sistema
        public void selecionarUsuario(int codigo) 
        {
            this.comando = new SqlCommand("getUsuarioExistente", this.conectar);
            this.comando.CommandType = CommandType.StoredProcedure;
            this.comando.Parameters.AddWithValue("@codigo", codigo);
            this.conectar.Open();
            this.comando.ExecuteNonQuery();
            this.conectar.Close();
            this.adapter = new SqlDataAdapter(this.comando);
            this.adapter.MissingSchemaAction = MissingSchemaAction.AddWithKey;
            this.dset = new DataSet();
            this.adapter.Fill(this.dset, "usuario");
            int linhaTable = 0;
            while(linhaTable < this.dset.Tables["usuario"].Rows.Count && !existUsuario)
            {
                //verifica se o codigo do usuario é igual ao usuario do data
                if (codigo.ToString().Equals(this.dset.Tables["usuario"].Rows[linhaTable]["codUsuario"].ToString()))
                {
                    //vincula dados do usuário encontrado
                    this.codUsuario = int.Parse(this.dset.Tables["usuario"].Rows[linhaTable]["codUsuario"].ToString());
                    this.nomeUsuario = this.dset.Tables["usuario"].Rows[linhaTable]["nomeUsuario"].ToString();
                    this.telefone = this.dset.Tables["usuario"].Rows[linhaTable]["telefone"].ToString();
                    this.email = this.dset.Tables["usuario"].Rows[linhaTable]["email"].ToString();
                    this.universidade = this.dset.Tables["usuario"].Rows[linhaTable]["universidade"].ToString();
                    this.endereco = this.dset.Tables["usuario"].Rows[linhaTable]["endereco"].ToString();
                    this.tipoUsuario = this.dset.Tables["usuario"].Rows[linhaTable]["tipoUsuario"].ToString();
                    this.qtdeEmprestimos = int.Parse(this.dset.Tables["usuario"].Rows[linhaTable]["qtdeEmprestimo"].ToString());
                    this.qtdeReservas = int.Parse(this.dset.Tables["usuario"].Rows[linhaTable]["qtdeReserva"].ToString());
                    this.senha = this.dset.Tables["usuario"].Rows[linhaTable]["senha"].ToString();
                    existUsuario = true;
                }
                else
                {
                    linhaTable++;
                }
            }
        }
        //vincula dados do usuario presente no sistema
        public void vincularUsuario(string nome, string tel, string endereco, string email, string universidade, string tipo) 
        {
            this.nomeUsuario = nome;
            this.telefone = tel;
            this.endereco = endereco;
            this.email = email;
            this.universidade = universidade;
            this.tipoUsuario = tipo;
        }
        //verifica existencia de usuario
        public bool verificarUsuario()
        {
            return this.existUsuario;
        }
        //altera quantidade de obras emprestadas
        public void alterarQtdeEmprestimos(int quantidade)
        {
            this.qtdeEmprestimos = this.qtdeEmprestimos + quantidade;
        }
        //altera quantidade de obras reservadas
        public void alterarQtdeReservas(int quantidade)
        {
            this.qtdeReservas = this.qtdeReservas + quantidade;
        }
        //altera senha do usuário de acesso
        public void alterarSenhaAcesso(string senhaAcesso) 
        {
            this.senha = senhaAcesso;
        }
        //obtem o codigo do usuario
        public int codigo(){ return this.codUsuario; }
        //obtem o nome do usuario
        public string nome(){ return this.nomeUsuario; }
        //cadastra novo usuario do sistema
        public void cadastrar()
        {
            this.comando = new SqlCommand("inserir_usuarios", this.conectar);
            this.comando.CommandType = CommandType.StoredProcedure;
            this.comando.Parameters.AddWithValue("@nome", this.nomeUsuario);
            this.comando.Parameters.AddWithValue("@telefone", this.telefone);
            this.comando.Parameters.AddWithValue("@endereco", this.endereco);
            this.comando.Parameters.AddWithValue("@email", this.email);
            this.comando.Parameters.AddWithValue("@universidade", this.universidade);
            this.comando.Parameters.AddWithValue("@tipo", this.tipoUsuario);
            this.conectar.Open();
            this.comando.ExecuteNonQuery();
            this.conectar.Close();
        }
        //deletar um usuario existente
        public void deletar(int codigo) 
        {
            this.comando = new SqlCommand("deletar_usuarios", this.conectar);
            this.comando.CommandType = CommandType.StoredProcedure;
            this.comando.Parameters.AddWithValue("@codigo", codigo);
            this.conectar.Open();
            this.comando.ExecuteNonQuery();
            this.conectar.Close();
        }
        //pesquisar usuários existentes
        public void pesquisarUsuario(string[] pesquisa) 
        {
            this.comando = new SqlCommand("getUsuarioCodigoNome", this.conectar);
            this.comando.CommandType = CommandType.StoredProcedure;
            this.comando.Parameters.AddWithValue("@codigo", pesquisa[0]);
            this.comando.Parameters.AddWithValue("@nome", pesquisa[1]);
            this.adapter = new SqlDataAdapter(this.comando);
            this.adapter.MissingSchemaAction = MissingSchemaAction.AddWithKey;
            this.dset = new DataSet();
            this.adapter.Fill(this.dset, "usuario");
            //percorre todo dataset e insere resultados da pesquisa na lista de resultados
            for (int i = 0; i < this.dset.Tables["usuario"].Rows.Count; i++)
            { 
                //atribui cada row do dataset ao data row
                this.rowResultado = this.dset.Tables["usuario"].Rows[i];
                //e insere na lista de resultados um data row
                this.listaResultado.Add(this.rowResultado);
            }
        }
        //atualiza dados do usuario apos alguma movimentação ou alterações
        public void atualizarUsuario() 
        {
            this.comando = new SqlCommand("atualizar_usuario", this.conectar);
            this.comando.CommandType = CommandType.StoredProcedure;
            this.comando.Parameters.AddWithValue("@codigo", this.codUsuario);
            this.comando.Parameters.AddWithValue("@nome", this.nomeUsuario);
            this.comando.Parameters.AddWithValue("@telefone", this.telefone );
            this.comando.Parameters.AddWithValue("@endereco", this.endereco);
            this.comando.Parameters.AddWithValue("@email", this.email);
            this.comando.Parameters.AddWithValue("@universidade", this.universidade);
            this.comando.Parameters.AddWithValue("@qtdeEmprestimo", this.qtdeEmprestimos);
            this.comando.Parameters.AddWithValue("@qtdeReserva", this.qtdeReservas);
            this.comando.Parameters.AddWithValue("@senha", this.senha);
            this.conectar.Open();
            this.comando.ExecuteNonQuery();
            this.conectar.Close();            
        }
    }
}