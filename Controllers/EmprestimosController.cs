using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Mvc;
using Biblio.Models;

namespace Biblio.Controllers
{
    public class EmprestimosController : Controller
    {
        public Emprestimos novoemprestimo;
        public Usuarios usuario;
        //
        // GET: /Emprestimos/
        public ActionResult Index()
        {
            return View();
        }
        //solicita o emprestimo da obra para o usuário e registra
        public void GerarEmprestimo() 
        {
            this.novoemprestimo = new Emprestimos();
            this.usuario = new Usuarios(int.Parse(Request.Form.Get("codUsuario")));
            if(!this.novoemprestimo.existeEmprestimo(int.Parse(Request.Form.Get("codExemplar"))))
            {
                this.novoemprestimo.vincularExemplar(int.Parse(Request.Form.Get("codExemplar")));
                this.novoemprestimo.vincularUsuario(int.Parse(Request.Form.Get("codUsuario")));
                this.novoemprestimo.alterarDataEmprestimo(DateTime.Parse(Request.Form.Get("dtemprestimo")));
                this.novoemprestimo.alterarDataPrevista(DateTime.Parse(Request.Form.Get("dtdevolucao")));
                this.novoemprestimo.alterarDevolucao(DateTime.Parse(Request.Form.Get("dtdevolucao")));
                this.novoemprestimo.alterarStatus("Emprestado");
                this.novoemprestimo.registrarEmprestimo();
                this.usuario.alterarQtdeEmprestimos(1);
                this.usuario.atualizarUsuario();
                Response.Write
                (
                    "<script> alert(\" O livro " + " \\n\\n foi emprestado ao aluno " + 
                    this.usuario.nome() + " \"); </script>"
                );
            }
            else
            {
                Response.Write("<script> alert(\"O livro já está Emprestado!\"); </script>");
            }
            Response.Write("<script> document.location = \"/Emprestimos/\"; </script>");
        }
    }
}
