<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    ::Edição de obras::
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<script language="javascript">
    function ExcluirObra(codigo) 
    {
        var opcao = confirm("Tem certeza que deseja excluir esta obra e todos seus exemplares?");
        if (opcao) 
        {
            alert("Operação de exclusão confirmada!");
            document.location = "/Exclusao/?item=obras&codigo=" + codigo;
        }
        else { alert("Operação de exclusão cancelada!"); }
    }
    function ExcluirExemplar(codigo) 
    {
        var opcao = confirm("Tem certeza que deseja excluir este exemplar?");
        if (opcao) 
        {
            alert("Operação de exclusão confirmada!");
            document.location = "/Exclusao/?item=exemplar&codigo=" + codigo;
        }
        else { alert("Operação de exclusão cancelada!"); }
    }

</script>
<div style="margin:1cm;">
    <form name="editarObra" method="post" action="/Edicao/atualizarDados/">
        <table id="mainform" width="70%">
            <tr>
                <th colspan="4">Edição de obras</th>
            </tr>
            <tr><td colspan="4" style="padding:10px 0 10px 0;"><i>Informações da obra</i></td></tr>
            <tr>
                <td><label>Código da obra</label></td>
                <td><input type="text" name="codObra" value="<%Response.Write(ViewBag.codObra);%>" readonly="readonly" /></td>
                <td><label>ISBN</label></td>
                <td><input type="text" name="isbn" value="<%Response.Write(ViewBag.isbn);%>" /></td>
            </tr>
            <tr>
                <td><label>Tipo</label></td>
                <td>
                    <select name="tipo">
                        <option><%Response.Write(ViewBag.tipo);%></option>
                        <option>Livro</option>
                        <option>Revista</option>
                    </select>                    
                </td>
                <td><label>Descrição</label></td>
                <td><input type="text" name="descricao" value="<%Response.Write(ViewBag.descricao);%>" /></td>
            </tr>
            <tr>
                <td><label>Editora</label></td>
                <td><input type="text" name="editora" value="<%Response.Write(ViewBag.editora);%>" /></td>
                <td><label>Edição</label></td>
                <td><input type="text" name="edicao" value="<%Response.Write(ViewBag.edicao);%>" /></td>
            </tr>
            <tr>
                <td><label>Autores</label></td>
                <td><input type="text" name="autores" value="<%Response.Write(ViewBag.autores);%>" /></td>
                <td></td><td></td>
            </tr>
            <tr><td colspan="4" style="padding:10px 0 10px 0;"><i>Informações do exemplar</i></td></tr>
            <tr>
                <td><label>Código do exemplar</label></td>
                <td><input type="text" name="exemplar" value="<%Response.Write(ViewBag.exemplar);%>" /></td>
                <td><label>Status</label></td>
                <td><input type="text" name="status" value="<%Response.Write(ViewBag.status);%>" readonly="readonly" /></td>
            </tr>
            <tr>
                <td colspan="4" style="text-align:center; padding:10px;">
                    <input type="hidden" name="editor_item" value="obras" />
                    <input type="button" value="Salvar alterações" onclick="document.editarObra.submit();" />
                    <input type="button" value="Excluir obra" title="Exclui a obra e exemplares que pertence a obra" onclick="ExcluirObra('<%Response.Write(ViewBag.codObra);%>')" />
                    <input type="button" value="Excluir exemplar" title="Exclui um exemplar que pertence a obra" onclick="ExcluirExemplar('<%Response.Write(ViewBag.exemplar);%>')" />
                    <input type="button" value="Fechar" onclick="inicio()" />
               </td>
            </tr>
        </table>
    </form>
</div>
</asp:Content>
