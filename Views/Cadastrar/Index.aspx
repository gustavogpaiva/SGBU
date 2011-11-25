<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    ::Cadastros::
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div style="margin:1cm; margin-left:3cm;">
    <table id="mainform">
        <tr>
            <th colspan="2">Opções de cadastros</th>
        </tr>
        <tr>
            <td style="padding:1cm;">
			    <input type="button" value="Obras e exemplares" style="padding:20px; font-size:16px; width:5cm;" onclick="document.location='/Cadastrar/Obras/';" 
                title="Cadastrar novas obras e exemplares" />
		    </td>
            <td style="padding:1cm;">
			    <input type="button" value="Usuários" style="padding:20px; font-size:16px; width:5cm;" onclick="document.location='/Cadastrar/Usuarios/';" />
		    </td>
        </tr>
        <tr>
            <td style="padding:1cm;">
			    <input type="button" value="Autores" style="padding:20px; font-size:16px; width:5cm;" onclick="document.location='/Cadastrar/Atores/';" />
		    </td>
            <td style="padding:1cm;">
			    <input type="button" value="Cursos" style="padding:20px; font-size:16px; width:5cm;" onclick="document.location='/Cadastrar/Cursos/';" />
		    </td>
        </tr>
        <tr>
            <td style="padding:1cm;">
			    <input type="button" value="Editoras" style="padding:20px; font-size:16px; width:5cm;" onclick="document.location='/Cadastrar/Editoras/';" />
		    </td>
            <td style="padding:1cm;">
			    <input type="button" value="Universidades" style="padding:20px; font-size:16px; width:5cm;" onclick="document.location='/Cadastrar/Universidades/';" />
		    </td>
        </tr>
    </table>
</div>
</asp:Content>
