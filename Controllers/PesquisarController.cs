using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Mvc;
using Biblio.Models;

namespace Biblio.Controllers
{
    public class PesquisarController : Controller
    {
        public Obras obra;
        public Usuarios usuario;
        //
        // GET: /Pesquisar/
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Obras() 
        {
            return View();
        }
        public ActionResult Usuarios() 
        {
            return View();
        }
        //pesquisa uma ocorrencia segundo um tipo de busca
        public void Pesquisar(string tipobusca, string termo) 
        {
            //vetor envia ao modelo um tipo de pesquisa a ser feita no banco
            string[] tipoPesquisa = new string[2];
            switch (tipobusca)
            {
                case "Código":
                    tipoPesquisa[0] = "@codigo";
                    tipoPesquisa[1] = "getCodigoObras";
                    this.obra.PesquisarObra(termo,tipoPesquisa);
                    break;
                case "Título":
                    tipoPesquisa[0] = "@titulo";
                    tipoPesquisa[1] = "getTitulosObras";
                    this.obra.PesquisarObra("%"+termo+"%",tipoPesquisa);
                    break;
                case "Usuario":
                    tipoPesquisa = termo.Split('#');
                    //string para buscar algum usuário com determinado nome
                    tipoPesquisa[1] = "%" + tipoPesquisa[1] + "%";
                    this.usuario.pesquisarUsuario(tipoPesquisa);
                    break;
            }
        }
    }
}
