using System;
using System.Collections;
using System.Web;
using System.Web.Mvc;
using Biblio.Models;

namespace Biblio.Controllers
{
    public class EdicaoController : Controller
    {
        Obras obra;
        Usuarios usuario;
        
        //controlador pass para view os dados de obras e exemplares
        public ActionResult Obras(int codigo, int exemplar, string isbn, string tipo, 
            string descricao, string editora, string edicao, string autores, string status) 
        {
            ViewBag.codObra = codigo;
            ViewBag.exemplar = exemplar;
            ViewBag.isbn = isbn;
            ViewBag.tipo = tipo;
            ViewBag.descricao = descricao;
            ViewBag.editora = editora;
            ViewBag.edicao = edicao;
            ViewBag.autores = autores;
            ViewBag.status = status;
            return View();
        }
        //controlador passa para view os dados do usuários 
        public ActionResult Usuarios(int codigo, string nome, string end, string tel, 
            string email, string tipo, string universidade)
        {
            ViewBag.codUsuario = codigo;
            ViewBag.nome = nome;
            ViewBag.endereco = end;
            ViewBag.telefone = tel;
            ViewBag.email = email;
            ViewBag.tipo = tipo;
            ViewBag.universidade = universidade;
            return View();
        }
        //atualiza as alterações feitas na edição de um item
        public void atualizarDados() 
        { 
            switch(Request.Form.Get("editor_item"))
            {
                case "obras":
                    this.obra = new Obras();
                    this.obra.vincularObra
                    (
                        Request.Form.Get("isbn"), Request.Form.Get("tipo"), Request.Form.Get("descricao"),
                        Request.Form.Get("editora"), Request.Form.Get("edicao"), Request.Form.Get("autores") 
                    );
                    this.obra.atualizarObra();
                    break;
                case "usuarios":
                    this.usuario = new Usuarios(int.Parse(Request.Form.Get("codUsuario")));
                    this.usuario.vincularUsuario
                    (
                        Request.Form.Get("nomeUsuario"), Request.Form.Get("telefone"), Request.Form.Get("endereco"),
                        Request.Form.Get("email"), Request.Form.Get("universidade"), Request.Form.Get("tipo")
                    );
                    this.usuario.alterarSenhaAcesso(Request.Form.Get("novaSenha"));
                    this.usuario.atualizarUsuario();
                    break;
            }
            Response.Write("<script> alert(\"Dados atualizados com sucesso!\"); </script>");
            Response.Write("<script> document.location = \"/Pesquisar/\"; </script>");
        }
    }
}
