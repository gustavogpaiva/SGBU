<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    ::Empréstimos::
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<script language="javascript">
    //envia formulário de emprestimo ao controle emprestimos
    function enviarEmprestimo() 
    {
        if (document.emprestimos.codUsuario.value != "" && document.emprestimos.codExemplar.value != ""
            && document.emprestimos.dtemprestimo.value != "")
        { document.emprestimos.submit(); }
        else
        { alert("Atenção!\nPreenche os campos requiridos, para solicitar o empréstimo."); }
    }
    function dataParaRegistro() 
    {
        document.emprestimos.dtemprestimo.value = obterDataAtual();
        document.emprestimos.dtdevolucao.value = obterDataDevolucao(document.emprestimos.dtemprestimo.value);
    }
</script>
<div id="content">
    <div class="feature"> 
	    <div style="margin:1cm;">
		    <form name="emprestimos" method="post" action="/Emprestimos/GerarEmprestimo/" >
                <table id="mainform" width="50%">
				    <tr>
					    <th colspan="2">Empréstimos de obras</th>
				    </tr>
				    <tr>
					    <td><label>Matricula do usuário:</label></td>
                        <td><input type="text" name="codUsuario" value="" /></td>
				    </tr>
				    <tr>
					    <td><label>Código do exemplar:</label></td>
                        <td><input type="text" name="codExemplar" value="" /></td>
				    </tr>
				    <tr>
					    <td><label>Emprestimo:</label></td>
					    <td><input type="text" name="dtemprestimo" onkeyup="dataParaRegistro()" /></td>
				    </tr>
				    <tr>
					    <td><label>Devolução:</label></td>
					    <td><input type="text" name="dtdevolucao" onkeyup="dataParaRegistro()" /></td>
				    </tr>
				    <tr>
                        <td align=center><input type="button" value="Gerar empréstimo" onclick="enviarEmprestimo()" /> </td>
					    <td align=center>
					        <input type="button" value="Fechar" onclick="inicio()" />
                       </td>	
				    </tr>
			    </table>
		    </form>
		</div>
	</div>
</div>
</asp:Content>
