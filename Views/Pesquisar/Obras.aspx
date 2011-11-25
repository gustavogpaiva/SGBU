<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<%@ Import Namespace="Biblio.Models" %>
<%@ Import Namespace="Biblio.Controllers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    ::Pesquisar obras::
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<script language="javascript">
    function EditarObra(item, codObra, statusExe) 
    {
        var codigo = codObra;
        var exemplar = document.getElementById("exemplar" + item).innerHTML;
        var isbn = document.getElementById("isbn" + item).innerHTML;
        var tipo = document.getElementById("tipo" + item).innerHTML;
        var descricao = document.getElementById("descricao" + item).innerHTML;
        var editora = document.getElementById("editora" + item).innerHTML;
        var edicao = document.getElementById("edicao" + item).innerHTML;
        var autores = document.getElementById("autores" + item).innerHTML;
        var status = statusExe;
        var parametro = "codigo=" + codigo + "&exemplar=" + exemplar + "&isbn=" + isbn +
        "&tipo=" + tipo + "&descricao=" + descricao + "&editora=" + editora +
        "&edicao=" + edicao + "&autores=" + autores + "&status=" + status;
        document.location = "/Edicao/Obras/?"+parametro;
    }
</script>
<div style="margin:1cm;">
<form name="pesquisarObra" method="post" action="/Pesquisar/Obras">
	<table id="mainform" width="50%">
		<tr>
			<th colspan="2">Consultar obras</th>
		</tr>
		<tr>
			<td><label>Buscar por:</label></td>
			<td>
				<select id="select" name="buscar">
					<option>Código</option>
					<option>Título</option>
					<option>Autores</option>
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
			<td><label>Termo da obra:</label></td>
			<td><input type="text" name="termo" /></td>
		</tr>
		<tr>
			<td><input type="button" value="Pesquisar" 
            onclick="enviarPesquisa(pesquisarObra)" /></td>
            <td><input type="button" value="Fechar" onclick="inicio()" /> </td>
		</tr>
	</table>
</form>
	<div style="margin-top:1cm;">
		<table id="mainform" width="100%" border="1">
			<tr>
				<th>Exemplar</th>
				<th>ISBN</th>
				<th>Tipo</th>
				<th>Descrição</th>			
				<th>Editora</th>
				<th>Edição</th>
				<th>Autores</th>
			</tr>
            <% 
                if (Request.Form.Get("termo") != "")
                {
                    PesquisarController novaPesquisa = new PesquisarController();
                    novaPesquisa.obra = new Obras();
                    novaPesquisa.Pesquisar(Request.Form.Get("buscar"),Request.Form.Get("termo"));
                    while(novaPesquisa.obra.listaResultado.Count > 0)
                    {
                        System.Data.DataRow resultado = novaPesquisa.obra.listaResultado[0] as System.Data.DataRow;
                        int item = int.Parse(resultado["numExemplar"].ToString());
                    %>
                    <tr>
                        <td id="exemplar<%Response.Write(item);%>" style="text-align:center"> <% Response.Write(resultado["numExemplar"].ToString()); %> </td>
                        <td id="isbn<%Response.Write(item);%>" style="text-align:center"> <% Response.Write(resultado["isbn"].ToString()); %> </td>
                        <td id="tipo<%Response.Write(item);%>" style="text-align:center"> <% Response.Write(resultado["tipo"].ToString()); %> </td>
                        <td id="descricao<%Response.Write(item);%>" style="text-align:center"> <% Response.Write(resultado["descricao"].ToString()); %> </td>
                        <td id="editora<%Response.Write(item);%>" style="text-align:center"> <% Response.Write(resultado["editora"].ToString()); %> </td>
                        <td id="edicao<%Response.Write(item);%>" style="text-align:center"> <% Response.Write(resultado["edicao"].ToString()); %> </td>
                        <td id="autores<%Response.Write(item);%>" style="text-align:center"> <% Response.Write(resultado["autores"].ToString()); %> </td>
                        <td>
                            <input type="button" value="Editar" onclick="EditarObra('<%Response.Write(item);%>','<%Response.Write(resultado["codObra"].ToString());%>','<%Response.Write(resultado["status"].ToString());%>')" />
                        </td>
                    </tr>
                    <%    
                        novaPesquisa.obra.listaResultado.RemoveAt(0);  
                    }//while
                }//if
            %>
		</table>
	</div>
</div>
</asp:Content>