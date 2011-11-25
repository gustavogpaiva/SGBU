using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Mvc;
using Biblio.Models;

namespace Biblio.Controllers
{
    public class DevolucaoController : Controller
    {
        public Emprestimos devolver;
        public Obras pesquisar;
        public Usuarios usuario;
        //
        // GET: /Devolucao/

        public ActionResult Index()
        {
            return View();
        }
        //pesquisa um emprestimo do usuário segundo um tipo de busca
        public void PesquisarEmprestimo(string termo)
        {
            this.pesquisar = new Obras();
            if (termo != null)
            {
                //vetor envia ao modelo um tipo de pesquisa a ser feita no banco
                string[] tipoPesquisa = new string[2];
                tipoPesquisa[0] = "@codigo";
                tipoPesquisa[1] = "getLivroEmprestado";
                this.pesquisar.PesquisarObra(termo, tipoPesquisa);
            }
        }
        public void GerarDevolucao() 
        {
            this.devolver = new Emprestimos();
            this.usuario = new Usuarios(int.Parse(Request.Form.Get("codUsuario")));
            this.devolver.vincularExemplar(int.Parse(Request.Form.Get("codExemplar")));
            this.devolver.vincularUsuario(int.Parse(Request.Form.Get("codUsuario")));
            this.devolver.alterarDevolucao(DateTime.Parse(Request.Form.Get("dtdevolucao")));
            this.devolver.alterarStatus("Disponível");
            this.devolver.registrarDevolucao();
            this.usuario.alterarQtdeEmprestimos(-1);
            this.usuario.atualizarUsuario();
            Response.Write("<script>alert(\"Livro devolvido com sucesso! Comprovante enviado para email.\");");
            Response.Write("document.location = \"/Devolucao/\"; </script>");
        }
    }
}
