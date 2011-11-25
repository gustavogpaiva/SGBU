<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    ::Editor de usuários::
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<script language="javascript">
    function ExcluirUsuario(codigo) 
    {
        var opcao = confirm("Tem certeza que deseja excluir este usuário?");
        if (opcao) 
        {
            alert("Operação de exclusão confirmada!");
            document.location = "/Exclusao/?item=usuarios&codigo=" + codigo;
        }
        else { alert("Operação de exclusão cancelada!"); }
    }
</script>
<div style="margin:1cm;">
    <form name="editarUsuario" method="post" action="/Edicao/atualizarDados/">
        <table id="mainform" width="70%">
            <tr>
                <th colspan="4">Edição de usuários</th>
            </tr>
            <tr><td colspan="4" style="padding:10px 0 10px 0;"><i>Informações do usuário</i></td></tr>
            <tr>
                <td><label>Matricula do usuário</label></td>
                <td><input type="text" name="codUsuario" value="<%Response.Write(ViewBag.codUsuario);%>" readonly="readonly" /></td>
                <td><label>Nome</label></td>
                <td><input type="text" name="nomeUsuario" value="<%Response.Write(ViewBag.nome);%>" /></td>
            </tr>
            <tr>
                <td><label>Endereço</label></td>
                <td><input type="text" name="endereco" value="<%Response.Write(ViewBag.endereco);%>" /></td>
                <td><label>Telefone</label></td>
                <td><input type="text" name="telefone" value="<%Response.Write(ViewBag.telefone);%>" /></td>
            </tr>
            <tr>
                <td><label>Email</label></td>
                <td><input type="text" name="email" value="<%Response.Write(ViewBag.email);%>" /></td>
                <td></td>
                <td></td>
            </tr>
            <tr><td colspan="4" style="padding:10px 0 10px 0;"><i>Instituição e unidade de ensino</i></td></tr>
            <tr>
                <td><label>Tipo de usuário</label></td>
                <td>
                    <select name="tipo">
                        <option><%Response.Write(ViewBag.tipo);%></option>
                        <option>Aluno</option>
                        <option>Funcionário</option>
                        <option>Professor</option>
                    </select>
                </td>
                <td><label>Universidade</label></td>
                <td>
                    <select name="universidade">
                        <option><%Response.Write(ViewBag.universidade);%></option>
                        <option>PUC Arcos</option>
                        <option>PUC Barreiro</option>
                        <option>PUC Contagem</option>
                        <option>PUC Coração eucarístico</option>
                        <option>PUC São Gabriel</option>
                    </select>
                </td>
            </tr>
            <tr><td colspan="4" style="padding:10px 0 10px 0;"><i>Alterar senha</i></td></tr>
            <tr>
                <td><label>Senha antiga</label></td>
                <td><input type="password" name="antiSenha" /></td>
                <td><label>Nova senha</label></td>
                <td><input type="password" name="novaSenha" /></td>
            </tr>
            <tr>
                <td colspan="4" style="text-align:center; padding:10px;">
                    <input type="hidden" name="editor_item" value="usuarios" />
                    <input type="button" value="Salvar alterações" onclick="document.editarUsuario.submit();" />
                    <input type="button" value="Excluir usuário" onclick="ExcluirUsuario('<%Response.Write(ViewBag.codUsuario);%>')" />
                    <input type="button" value="Fechar" onclick="inicio()" />
                </td>
            </tr>
        </table>
    </form>    
</div>
</asp:Content>
