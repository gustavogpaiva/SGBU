<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<%@ Import Namespace="Biblio.Models" %>
<%@ Import Namespace="Biblio.Controllers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    ::Reservas de obras::
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<script language="javascript">
	var codExemplar = 0;
	function novaPesquisa(frm) {
		frm.status_resultado.value = "0";
		enviarPesquisa(frm);
    }
    function reservados(frm) {
        frm.buscar.value = "Reservas";
        frm.termo.value = "Reservas";
        enviarPesquisa(frm);
    }
	function reservar(frm) {
	    if (frm.status_resultado.value == "OK") {
	        document.location = "/Reservas/solicitarReserva/?codigo=" + codExemplar;
		}
		else { alert("Não é possivel fazer reserva"); }
    }
    function cancelar(frm) {
        if (frm.status_resultado.value == "OK") {
            document.location = "/Reservas/cancelarReserva/?codigo=" + codExemplar;
        }
    }
</script>
<div id="content">
    <div class="feature"> 
  		<div style="margin:1cm;">
			<form name="pesquisarReserva" method="post" action="/Reservas/">
				<table id="mainform" width="50%">
					<tr>
						<th colspan="2">Consultar exemplar</th>
					</tr>
					<tr>
						<td><label>Buscar por:</label></td>
						<td>
							<select id="select" name="buscar">
								<option>Código</option>
								<option>Título</option>
								<option>Autores</option>
                                <option>Reservas</option>
							</select>
						</td>
					</tr>
					<tr>
						<td><label>Tipo obra:</label></td>
						<td>
							<select id="select" name="tipobra">
								<option>Livro</option>
								<option>Revistas</option>
							</select>
						</td>
					</tr>
					<tr>
						<td><label>Termo do exemplar:</label></td>
						<td>
                            <input type="text" name="termo" value="" />
                            <input type="hidden" name="status_resultado" value="0" />
                        </td>
					</tr>
					<tr>
						<td><input type="button" value="Procurar" onclick="novaPesquisa(pesquisarReserva)" /></td>
						<td><input type="button" value="Fechar" onclick="inicio()" /></td>
					</tr>
				</table>
			</form>
            <p>
                <input type="button" style="border:none;background:#006699;color:#FFFFFF;font-size:15px;" 
                value="Obter ultimas reservas" title="Obtem todas reservas em aberto" onclick="reservados(pesquisarReserva);" />
            </p>
		<div style="margin-top:1cm;">
			<table id="mainform" width="100%" border="1">
				    <tr>
					    <th>Status</th>
					    <th>Código</th>
					    <th>Tipo</th>
					    <th>Descrição</th>			
					    <th>Editora</th>
                        <th>Autores</th>
				    </tr>
				    <% 
			            //verifica termo e pesquisa	o livro existente
                        if (Request.Form.Get("termo") != "")
                        {
                            ReservasController novaReserva = new ReservasController();                            	        
                            novaReserva.PesquisarExemplar(Request.Form.Get("buscar"), Request.Form.Get("termo"));
                            while(novaReserva.pesquisar.listaResultado.Count > 0)
                            {
                                %> <tr> <% 
                                    System.Data.DataRow resultado = novaReserva.pesquisar.listaResultado[0] as System.Data.DataRow;
                                %>
                                    <!--Status-->
                                    <td style="text-align:center">
                                        <% Response.Write(resultado["status"]); %>
                                    </td>
                                    <!--codigo-->
                                    <td style="text-align:center">
                                        <% Response.Write(resultado["numExemplar"]); %>
                                    </td>
                                    <!--tipo-->
                                    <td style="text-align:center">
                                        <% Response.Write(resultado["tipo"]); %>
                                    </td>
                                    <!--descrição-->
                                    <td style="text-align:center">
                                        <% Response.Write(resultado["descricao"]); %>
                                    </td>
                                    <!--editora-->
                                    <td style="text-align:center">
                                        <% Response.Write(resultado["editora"]); %>
                                    </td>
                                    <!--autores-->
                                    <td style="text-align:center">
                                        <% Response.Write(resultado["autores"]); %>
                                    </td>
                                    <!--reservar exemplar-->
                                    <td style="text-align:center">
                                        <input type="button" value="Reservar" 
                                        onclick="codExemplar = <%Response.Write(resultado["numExemplar"]);%>; reservar(pesquisarReserva);" />
                                    </td>
                                    <!---->
                                    <td style="text-align:center">
                                        <input type="button" value="Cancelar"
                                        onclick="codExemplar = <%Response.Write(resultado["numExemplar"]);%>; cancelar(pesquisarReserva);" />
                                    </td>
                                <%
                                novaReserva.pesquisar.listaResultado.RemoveAt(0);
                                %> </tr>
                                <script language="javascript">
                                    //recebe status do resultado OK, a pesquisa retornou resultados
                                    document.pesquisarReserva.status_resultado.value = "OK";
                                </script> 
                                <%
                            }//while
                        }//if
                    %>
			    </table>
            </div>
	    </div>
    </div>
</div>
</asp:Content>
