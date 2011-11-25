<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    ::Movimentação de produto::
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div style="margin:1cm; margin-left:3cm;">
    <table id="mainform">
        <tr>
            <th colspan="2">Movimentação</th>
        </tr>
        <tr>
            <td style="padding:1cm;">
			    <input type="button" value="Emprestimos" style="padding:20px; font-size:16px; width:5cm;" onclick="document.location = /Emprestimos/" 
                title="Registrar um novo empréstimo" />
		    </td>
            <td style="padding:1cm;">
			    <input type="button" value="Renovação" style="padding:20px; font-size:16px; width:5cm;" onclick="document.location = //" />
		    </td>
        </tr>
        <tr>
            <td style="padding:1cm;">
			    <input type="button" value="Devoluções" style="padding:20px; font-size:16px; width:5cm;" onclick="document.location = /Devolucao/" 
                title="Registrar a devolução do produto" />
		    </td>
            <td style="padding:1cm;">
			    <input type="button" value="Reservas" style="padding:20px; font-size:16px; width:5cm;" onclick="document.location = /Reservas/" 
                title="Solicitar reservas de produtos" />
		    </td>
        </tr>
    </table>
</div>
</asp:Content>
