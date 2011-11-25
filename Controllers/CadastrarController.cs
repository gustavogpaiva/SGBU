using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Mvc;
using Biblio.Models;

namespace Biblio.Controllers
{
    public class CadastrarController : Controller
    {
        public Obras novaobra;
        public Exemplar novoexemplar;
        public Usuarios novousuario;
        //
        // GET: /Cadastrar/
        
        public ActionResult Index()
        {
            return View();
        }
        //exibe view de cadastro de nova obra e exemplares
        public ActionResult Obras() 
        {
            return View();
        }
        //exibe view de cadastro de novos usuarios
        public ActionResult Usuarios() 
        {
            return View();
        }
        //envia cadastro de nova obra ao modelo
        public void cadastrarNovaObra() 
        {
            this.novaobra = new Obras();
            //envia ao modelo de dados da nova obra a ser cadastrada
            this.novaobra.vincularObra
            (
                Request.Form.Get("isbn"), Request.Form.Get("tipo"),
                Request.Form.Get("descricao"), Request.Form.Get("editora"), Request.Form.Get("edicao"), Request.Form.Get("autores")
            );
            //verifica a existencia da obra, caso exista registra um novo exemplar para a obra
            if (!this.novaobra.existeObra())
            {
                //cadastra nova obra com os dados enviados para modelo
                this.novaobra.cadastrar();
                Response.Write("<script> alert(\"Obra cadastrada com sucesso!\"); </script>");
            }
            //caso a obra ja exista ele insere um novo exemplar para esta obra existente
            else if (this.novaobra.existeObra()) 
            {
                //cadastr um novo exemplar
                this.cadastrarNovoExemplar();
                Response.Write("<script> alert(\"Exemplar cadastrado com sucesso!\"); </script>");
            }
            Response.Write("<script> document.location = \"/Cadastrar/\"; </script>");
        }
        //envia cadastro de um novo exemplar ao modelo
        public void cadastrarNovoExemplar() 
        {
            this.novoexemplar = new Exemplar();
            int codigo = int.Parse(this.novaobra.rowResultado["codObra"].ToString());
            this.novoexemplar.vincularExemplar(codigo,"Disponível");
            this.novoexemplar.cadastrar();
        }
        //envia cadastro de novo usuário do sistema
        public void cadastrarNovoUsuario() 
        {
            //aloca classe para administrador enviar cadastro
            this.novousuario = new Usuarios(1000);
            this.novousuario.vincularUsuario
            (
                Request.Form.Get("nomeUsuario"), Request.Form.Get("telUsuario"), Request.Form.Get("endUsuario"), 
                Request.Form.Get("mailUsuario"), Request.Form.Get("universidade"), Request.Form.Get("tipo")
            );
            this.novousuario.cadastrar();
            Response.Write
            (
                "<script> alert(\"" + Request.Form.Get("tipo") + " '" + 
                Request.Form.Get("nomeUsuario") + "' cadastrado com sucesso!\"); </script>"
            );
            Response.Write("<script> document.location = \"/Cadastrar/\"; </script>");
        }
    }
}
