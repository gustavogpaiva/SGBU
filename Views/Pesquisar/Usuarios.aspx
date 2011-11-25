<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<%@ Import Namespace="Biblio.Models" %>
<%@ Import Namespace="Biblio.Controllers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    ::Pesquisar usuários ::
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<script language="javascript">
    function Pesquisar(frm) 
    {
        if (frm.codUsuario.value == undefined) { frm.codUsuario.value = "0"; }
        if (frm.nomeUsuario.value == undefined) { frm.nomeUsuario.value = "0"; }
        frm.submit();
    }
    function EditarUsuario(item) 
    {
        var codigo = document.getElementById("codigo" + item).innerHTML;
        var nome = document.getElementById("nome" + item).innerHTML;
        var Endereço = document.getElementById("endereco" + item).innerHTML;
        var Telefone = document.getElementById("telefone" + item).innerHTML;
        var Email = document.getElementById("email" + item).innerHTML;
        var Tipo = document.getElementById("tipo" + item).innerHTML;
        var Universidade = document.getElementById("universidade" + item).innerHTML;
        var parametro = "codigo=" + codigo + "&nome=" + nome + "&end=" + Endereço + "&tel=" +
        Telefone + "&email=" + Email + "&tipo=" + Tipo + "&universidade=" + Universidade;
        document.location = "/Edicao/Usuarios/?"+parametro;
    }
</script>
    <div style="margin:1cm;">
    <form name="pesquisarUsuario" method="post" action="/Pesquisar/Usuarios">
        <table id="mainform" width="50%">
            <tr><th colspan="2">Consultar usuários</th></tr>
            <tr>
                <td><label>Matricula do usuário</label></td>
                <td><input type="text" name="codUsuario" /></td>
            </tr>
            <tr>
                <td><label>Nome do usuário</label></td>
                <td><input type="text" name="nomeUsuario" /></td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <input type="button" value="Pesquisar" onclick="Pesquisar(pesquisarUsuario)" />
                    <input type="button" value="Fechar" onclick="inicio()" /> 
                </td>
            </tr>
        </table>
    </form>
    <div style="margin-top:1cm;">
	    <table id="mainform" width="100%" border="1">
            <tr>
                <th>Matrícula</th>
                <th>Nome</th>
                <th>Endereço</th>
                <th>Telefone</th>
                <th>Email</th>
                <th>Tipo</th>
                <th>Universidade</th>
                <th>Emprestimos</th>
                <th>Reservas</th>
            </tr>
            <%
                if (Request.Form.Get("codUsuario") != "" || Request.Form.Get("nomeUsuario") != "")
                {
                    PesquisarController novapesquisa = new PesquisarController();
                    string pesquisa = Request.Form.Get("codUsuario") + "#" + Request.Form.Get("nomeUsuario");
                    novapesquisa.usuario = new Usuarios(1000);
                    novapesquisa.Pesquisar("Usuario", pesquisa);
                    while (novapesquisa.usuario.listaResultado.Count > 0)
                    {
                        System.Data.DataRow resultado = novapesquisa.usuario.listaResultado[0] as System.Data.DataRow;
                        int item = int.Parse(resultado["codUsuario"].ToString());
                    %> 
                    <tr>
                        <td id="codigo<%Response.Write(item);%>" style="text-align:center"><%Response.Write(resultado["codUsuario"].ToString());%></td>
                        <td id="nome<%Response.Write(item);%>" style="text-align:center"><%Response.Write(resultado["nomeUsuario"].ToString());%></td>
                        <td id="endereco<%Response.Write(item);%>" style="text-align:center"><%Response.Write(resultado["endereco"].ToString());%></td>
                        <td id="telefone<%Response.Write(item);%>" style="text-align:center"><%Response.Write(resultado["telefone"].ToString());%></td>
                        <td id="email<%Response.Write(item);%>" style="text-align:center"><%Response.Write(resultado["email"].ToString());%></td>
                        <td id="tipo<%Response.Write(item);%>" style="text-align:center"><%Response.Write(resultado["tipoUsuario"].ToString());%></td>
                        <td id="universidade<%Response.Write(item);%>" style="text-align:center"><%Response.Write(resultado["universidade"].ToString());%></td>
                        <td style="text-align:center"><%Response.Write(resultado["qtdeEmprestimo"].ToString());%></td>
                        <td style="text-align:center"><%Response.Write(resultado["qtdeReserva"].ToString());%></td>
                        <td><input type="button" value="Editar" onclick="EditarUsuario('<%Response.Write(item);%>')" /></td>
                    </tr>
                    <%
                        novapesquisa.usuario.listaResultado.RemoveAt(0);
                    }//while
                }//if   
                %>
        </table>
    </div>
</div>
</asp:Content>
