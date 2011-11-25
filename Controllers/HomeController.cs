using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Mvc;
using Biblio.Models;

namespace Biblio.Controllers
{
    //classe com dados de login do usuario do sistema
    public class LoginUsuario 
    {
        private int idUsuario;
        private string senha;
        private bool loginAtivo = false;
        //vincula dados de acesso do usuario
        public void vincularLoginUsuario(int ID, string senhaAcesso) 
        {
            this.idUsuario = ID;
            this.senha = senhaAcesso;
            this.loginAtivo = true;
        }
        //alterar status do login apos desconexao
        public void alterarStatusLogin()
        {
            this.loginAtivo = false;
        }
        //retorna status do login do usuário
        public bool statusLogin() 
        {
            return this.loginAtivo;
        }
        //retorna id do usuario
        public int idAcesso()
        { return this.idUsuario; }
        //retorna senha
        public string senhaAcesso()
        { return this.senha; }
    }

    //classe de acesso ao sistema atraves dos dados de login
    public static class AcessoUsuario 
    {
        public static string usuario = "";
        public static LoginUsuario acesso = new LoginUsuario();
        //faz o login do usuario no sistema
        public static void LoginUsuario(int ID, string senhaAcesso) 
        {
            acesso.vincularLoginUsuario(ID, senhaAcesso);
        }
        //faz o logoff e desconecta usuario
        public static void LogoffUsuario() 
        {
            acesso.alterarStatusLogin();
        }
    }

    public class HomeController : Controller
    {
        Usuarios usuario;
        public ActionResult Index()
        {
            //verifica se o usuário do sistema já ativo
            if(!AcessoUsuario.acesso.statusLogin())
            { Response.Write("<script> document.location = \"/Home/Login/\"; </script>"); }
            return View();
        }

        public ActionResult Movimentar() 
        {
            return View();
        }

        public ActionResult Login()
        {
            if (Request.Form.Get("idUsuario") != null && Request.Form.Get("senha") != null)
            {
                //seleciona o usuário pela sua id, codigo unico e verifica se existe usuario
                this.usuario = new Usuarios(int.Parse(Request.Form.Get("idUsuario")));
                if(this.usuario.verificarUsuario())
                {
                    AcessoUsuario.LoginUsuario(int.Parse(Request.Form.Get("idUsuario")), Request.Form.Get("senha"));
                    AcessoUsuario.usuario = this.usuario.nome();
                    Response.Write("<script> document.location = \"/Home/\"; </script>");
                }
                else if (!this.usuario.verificarUsuario())
                {
                    Response.Write("<script> alert(\"Usuário não encontrado! \n Verifique os dados e tente conectar novamente.\");");
                    Response.Write(" document.location = \"/Home/Login/\"; </script>");
                }
            }
            return View(); 
        }
        //confirma o logoff do usuário e desconecta do sistema
        public void Logoff()
        {
            AcessoUsuario.LogoffUsuario();
            Response.Write("<script> alert(\"Usuário Desconectado!\");");
            Response.Write(" document.location = \"/Home/Login/\"; </script>");
        }
    }
}
