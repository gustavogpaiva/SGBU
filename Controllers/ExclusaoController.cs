using System;
using System.Collections;
using System.Web;
using System.Web.Mvc;
using Biblio.Models;

namespace Biblio.Controllers
{
    public class ExclusaoController : Controller
    {
        Exemplar exemplar;
        Obras obra;
        Usuarios usuario;

        public ActionResult Index(string item, int codigo)
        {
            switch(item)
            {
                case "exemplar":
                    this.exemplar = new Exemplar();
                    this.exemplar.deletar(codigo);
                    break;
                case "obras":
                    this.obra = new Obras();
                    this.obra.deletar(codigo);
                    break;
                case "usuarios":
                    this.usuario = new Usuarios(1000);
                    this.usuario.deletar(codigo);
                    break;
            }
            Response.Write("<script> document.location=\"/Pesquisar/\"; </script>");
            return View();
        }
    }
}
