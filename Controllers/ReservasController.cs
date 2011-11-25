using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Mvc;
using Biblio.Models;

namespace Biblio.Controllers
{
    public class ReservasController : Controller
    {
        public Reservas reservar;
        public Obras pesquisar;
        public Usuarios usuario;
        //
        // GET: /Reservas/
        public ActionResult Index()
        {
            return View();
        }
        //pesquisa um exemplar em empréstimo, segundo o tipo de busca
        public void PesquisarExemplar(string tipobusca, string termo) 
        {
            this.pesquisar = new Obras();
            //vetor envia ao modelo um tipo de pesquisa a ser feita no banco, 
            //e o termo de pesquisa a ser pesquisado
            string[] tipoPesquisa = new string[2];
            switch(tipobusca)
            {
                case "Código":
                    tipoPesquisa[0] = "@codigo";
                    tipoPesquisa[1] = "getCodObrasEmprestado";
                    this.pesquisar.PesquisarObra(termo, tipoPesquisa);
                    break;
                case "Título":
                    tipoPesquisa[0] = "@titulo";
                    tipoPesquisa[1] = "getTituloObraEmprestado";
                    this.pesquisar.PesquisarObra(termo, tipoPesquisa);             
                    break;
                case "Reservas":
                    tipoPesquisa[0] = "@reservado";
                    tipoPesquisa[1] = "getReservas";
                    this.pesquisar.PesquisarObra(termo, tipoPesquisa);
                    break;
            }
        }
        //solicita reserva com os dados do exemplar obtidos na pesquisa
        public void solicitarReserva(int codigo) 
        {
            this.usuario = new Usuarios(AcessoUsuario.acesso.idAcesso());
            this.reservar = new Reservas();
            //vincula codigo do exemplar para reserva
            this.reservar.vincularExemplar(codigo);
            //obtem codigo do usuario e vincula a reserva
            this.reservar.vincularUsuario(this.usuario.codigo());
            //verifica se o usuario ja fez reserva para este exemplar
            if(!this.reservar.existeReserva())
            {
                //obtem a data atual para registrar a reserva            
                this.reservar.alterarDataReserva(DateTime.Parse(DateTime.Now.ToString("dd/MM/yyyy")));
                //altera o status do exemplar emprestado para reservado
                this.reservar.alterarStatus("Reservado");
                //registra a reserva do exemplar
                this.reservar.registrarReserva();
                //alterar quantidade de reservas feitas pelo usuário
                this.usuario.alterarQtdeReservas(1);
                //atualiza dados do usuario apos a reserva
                this.usuario.atualizarUsuario();
                //exibe mensagem finaliza a reserva do usuário
                Response.Write("<script>alert(\" Reserva efetuada com sucesso! \\n\\n Reservado ao usuário " + this.usuario.nome() + " \");");
            }
            Response.Write("document.location = \"/Reservas/\"; </script>");
        }
        //cancela uma reserva existente
        public void cancelarReserva(int codigo) 
        {
            this.usuario = new Usuarios(AcessoUsuario.acesso.idAcesso());
            this.reservar = new Reservas();
            //vincula codigo do exemplar 
            this.reservar.vincularExemplar(codigo);
            //obtem codigo do usuario
            this.reservar.vincularUsuario(this.usuario.codigo());
            //alterar o status para disponivel
            this.reservar.alterarStatus("Disponível");
            //envia cancelamento da reserva
            this.reservar.removerReserva();
            //altera numero de reservas do usuario
            this.usuario.alterarQtdeReservas(-1);
            //atualiza ultimas alterações
            this.usuario.atualizarUsuario();
            //exibe mensagem de cancelamento
            Response.Write("<script>alert(\" Reserva cancelada com sucesso! \");");
            Response.Write(" document.location = \"/Reservas/\"; </script>");
        }
    }
}
