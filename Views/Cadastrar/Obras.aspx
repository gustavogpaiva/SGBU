<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    ::Cadastros de obras::
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div style="margin:1cm;">
    <form name="cadastrarObra" method="post" action="/Cadastrar/cadastrarNovaObra" runat="server">
        <table id="mainform" width="50%">
            <tr><th colspan="2">Cadastro de obras, exemplares</th></tr>
            <tr>
                <td><label>ISBN:</label></td>
                <td><input type="text" name="isbn" value="" /></td>
            </tr>
            <tr>
                <td><label>Tipo:</label></td>
                <td>
                    <select name="tipo">
                        <option>Selecione uma opção</option>
                        <option>Livro</option>
                        <option>Revista</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td><label>Descrição do livro:</label></td>
                <td><input type="text" name="descricao" value=""/></td>
            </tr>
            <tr>
                <td><label>Editora:</label></td>
                <td>
                    <select name="editora">
                        <option>Selecione uma opção</option>
                        <option>Atica</option>
                        <option>Brasport</option>
                        <option>Ciência moderna</option>
                        <option>Digerati</option>
                        <option>LTC</option>
                        <option>Verus</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td><label>Edição:</label></td>
                <td><input type="text" name="edicao" value=""/></td>
            </tr>
            <tr>
                <td><label>Autores:</label></td>
                <td><input type="text" name="autores" value=""/></td>
            </tr>
            <tr>
                <td><input type="reset" value="Limpar campos"/></td>
                <td><input type="submit" value="Cadastrar" /></td>
            </tr>
        </table>
        <input type="hidden" name="postado" value="false" />
    </form>
</asp:Content>
