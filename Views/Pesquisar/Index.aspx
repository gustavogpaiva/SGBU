<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    ::Pesquisas::
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div style="margin:1cm; margin-left:3cm;">
    <table id="mainform">
        <tr>
            <th colspan="2">Opções de pesquisas</th>
        </tr>
        <tr>
            <td style="padding:1cm;">
			    <input type="button" value="Obras com exemplares" style="padding:20px; font-size:16px; width:5cm;" onclick="document.location='/Pesquisar/Obras/';" 
                title="Pesquisar obras com seus exemplares do acervo" />
		    </td>
            <td style="padding:1cm;">
			    <input type="button" value="Usuários" style="padding:20px; font-size:16px; width:5cm;" onclick="document.location='/Pesquisar/Usuarios/';" 
                title="Pesquisar usuarios do sistema" />
		    </td>
        </tr>
        <tr>
            <td style="padding:1cm;">
			    <input type="button" value="Autores" style="padding:20px; font-size:16px; width:5cm;" onclick="document.location='/Pesquisar/Atores/';" />
		    </td>
            <td style="padding:1cm;">
			    <input type="button" value="Cursos" style="padding:20px; font-size:16px; width:5cm;" onclick="document.location='/Pesquisar/Cursos/';" />
		    </td>
        </tr>
        <tr>
            <td style="padding:1cm;">
			    <input type="button" value="Editoras" style="padding:20px; font-size:16px; width:5cm;" onclick="document.location='/Pesquisar/Editoras/';" />
		    </td>
            <td style="padding:1cm;">
			    <input type="button" value="Universidades" style="padding:20px; font-size:16px; width:5cm;" onclick="document.location='/Pesquisar/Universidades/';" />
		    </td>
        </tr>
    </table>
</div>
</asp:Content>
