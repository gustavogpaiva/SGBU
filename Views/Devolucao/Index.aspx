<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<%@ Import Namespace="Biblio.Models" %>
<%@ Import Namespace="Biblio.Controllers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    ::Devoluções::
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<script language="javascript">
    var emprestimo;
    var devolucao = obterDataAtual();
    var prevista;
    function novaPesquisa(frm) 
    {
        frm.status_resultado.value = "0";
        document.devolucoes.action = "/Devolucao/";
        enviarPesquisa(frm);
    }
    //formata a data de registro emprestimo obtida do banco
    function dataParaRegistro() 
    {
        if (emprestimo != undefined && prevista != undefined) 
        {
            document.devolucoes.dtemprestimo.value = emprestimo.replace("00:00:00","");
            document.devolucoes.dtdevolucao.value = devolucao.replace("00:00:00", "");
            document.devolucoes.dtprevista.value = prevista.replace("00:00:00", "");
        }
        
    }
    function enviarDevolucao(frm) 
    {
        if (frm.status_resultado.value == "OK") 
        {
            frm.action = "/Devolucao/GerarDevolucao/";
            frm.submit();    
        }
    }
</script>
<div id="content">
  <div class="feature"> 
	<form name="devolucoes" method="post" action="/Devolucao/" >
        <div style="margin:1cm;">  
			<table id="mainform">
				<tr>
					<th colspan="3">Devolução de obras</th>
				</tr>
				<tr>
					<td><label>Código do exemplar:</label></td>
					<td>
                        <input type="text" name="termo" />
                        <input type="hidden" name="buscar" value="Código" />
                        <input type="hidden" name="status_resultado" value="0" />
                    </td>
					<td><input type="button" value="Pesquisar" onclick="novaPesquisa(devolucoes)" /></td>
				</tr>
				<tr>
					<td><label>Descrição:</label></td>
					<td><input type="text" name="descricao" /></td>
					<td> </td>
				</tr>	
			</table>
	    </div>
	    <div style="margin:1cm;">
		    <table id="mainform" border="2">
			    <tr>
				    <th width="auto">Matricula do usuário</th>
				    <th width="auto">Código do exemplar</th>
				    <th width="auto">Usuário</th>
			    </tr>
                <%
                    //verifica termo para pesquisar	o livro existente
                    if (Request.Form.Get("termo") != "")
                    {
                        DevolucaoController devolverMaterial = new DevolucaoController();
                        //pesquisa o exemplar com o codigo enviado do formulário
                        devolverMaterial.PesquisarEmprestimo(Request.Form.Get("termo"));
                        while(devolverMaterial.pesquisar.listaResultado.Count > 0)
                        {
                            System.Data.DataRow resultado = devolverMaterial.pesquisar.listaResultado[0] as System.Data.DataRow;
                            %> 
                            <tr>
                                <!--Matricula-->
                                <td style="text-align:center;">
                                    <input type="text" name="codUsuario" value="<%Response.Write(resultado["codUsuario"].ToString());%>" readonly="readonly" /> 
                                </td>
                                <!--Código-->
				                <td style="text-align:center;">
                                    <input type="text" name="codExemplar" value="<%Response.Write(resultado["numExemplar"].ToString());%>" readonly="readonly" /> 
                                </td>
                                <!--Nome-->
				                <td style="text-align:center;">
                                    <input type="text" name="nome" value="<%Response.Write(resultado["nomeUsuario"].ToString());%>" readonly="readonly" /> 
                                </td>                                                            
                            <%
                            devolverMaterial.pesquisar.listaResultado.RemoveAt(0);
                            Response.Write("<script>document.devolucoes.descricao.value = \"" + resultado["descricao"].ToString() + "\"</script>");
                            Response.Write("<script>emprestimo = \"" + resultado["dataEmprestimo"].ToString() + "\"</script>");
                            Response.Write("<script>prevista = \"" + resultado["dataPrevista"].ToString() + "\"</script>");
                            Response.Write("<script>document.devolucoes.termo.value = \"" + resultado["numExemplar"].ToString()  + "\"</script>");
                            %> </tr>
                            <script language="javascript">
                                //recebe status do resultado OK, a pesquisa retornou resultados
                                document.devolucoes.status_resultado.value = "OK";
                            </script> 
                            <%
                        }//while
                    }//if
                %>
		    </table>
        </div>
        <div style="margin:1cm;">    
            <table id="mainform">
                <tr>
				    <td><label>Data de empréstimo:</label></td>
				    <td><label>Devolução de devolução:</label></td>
				    <td><label>Data prevista:</label></td>
			    </tr>
			    <tr>
                    <!--obtem data do emprestimo-->
				    <td><input type="text" name="dtemprestimo" value="" /></td>
                    <!--obtem data da devolução do usuário-->
				    <td><input type="text" name="dtdevolucao" value="" /></td>
                    <!--obtem data da devolução prevista-->
				    <td><input type="text" name="dtprevista" value="" /></td>
			    </tr>	
			    <tr>
				    <td><input type="button" value="Gerar devolução" onclick="enviarDevolucao(devolucoes)" /></td>
				    <td><input type="button" value="Fechar" onclick="inicio()" /></td>
				    <td> </td>
                    <script>dataParaRegistro();</script>
			    </tr>
            </table>
        </div>
    </form>
  </div>
</div>
</asp:Content>
