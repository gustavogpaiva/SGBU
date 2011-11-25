<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    ::Cadastros de usuários::
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<script language="javascript">
    function verificarFrmCadastro(frm) 
    {
        if (frm.nomeUsuario.value == "" || frm.telUsuario.value == "" || 
            frm.endUsuario.value == "" || frm.mailUsuario.value == "")
        { alert("Preencha todos os campos do formulário antes de cadastrar novo usuário."); }
        else {frm.submit(); }
    }
</script>
<div style="margin:1cm;">
    <form name="cadastroUsuario" method="post" action="/Cadastrar/cadastrarNovoUsuario">
        <table id="mainform" width="50%">
            <tr>
                <th colspan="2">Cadastros de usuários</th>
            </tr>
            <tr>
                <td><label>Tipo de usuário</label></td>
                <td>
                    <select name="tipo">
                        <option>Selecione uma opção</option>
                        <option>Aluno</option>
                        <option>Funcionário</option>
                        <option>Professor</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td><label>Nome</label></td>
                <td><input type="text" name="nomeUsuario" /></td>
            </tr>
            <tr>
                <td><label>Telefone</label></td>
                <td><input type="text" name="telUsuario" /></td>
            </tr>
            <tr>
                <td><label>Endereço</label></td>
                <td><input type="text" name="endUsuario" /></td>
            </tr>
            <tr>
                <td><label>Email</label></td>
                <td><input type="text" name="mailUsuario" /></td>
            </tr>
            <tr>
                <td><label>Universidade</label></td>
                <td>
                    <select name="universidade">
                        <option>Selecione uma opção</option>
                        <option>PUC Arcos</option>
                        <option>PUC Barreiro</option>
                        <option>PUC Contagem</option>
                        <option>PUC Coração eucarístico</option>
                        <option>PUC São Gabriel</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td><input type="button" value="Cadastrar" onclick="verificarFrmCadastro(cadastroUsuario)" /></td>
                <td><input type="button" value="Fechar" onclick="inicio()" /></td>
            </tr>
        </table>
    </form>
</div>
</asp:Content>
