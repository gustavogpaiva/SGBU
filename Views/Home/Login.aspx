<%@ Page Title="" Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!-- DW6 -->
<head>
	<!-- Copyright 2005 Macromedia, Inc. All rights reserved. -->
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>::Login::</title>
	<link rel="stylesheet" href="../../Content/sgbu.css" type="text/css" />
</head>
<!-- The structure of this file is exactly the same as 2col_leftNav.html;
     the only difference between the two is the stylesheet they use -->
<body>
<div id="masthead">
  <h1 id="siteName">SGBU</h1>
  <div id="globalNav"> </div>
</div>
<!-- end masthead -->
<div id="content">
	<div style="margin:3cm 6cm;">
		<form name="loginUsuario" method="post" action="/Home/Login/">
			<table id="mainform">
				<tr>
					<th colspan="2">Acesso exclusivo</th>
				</tr>
				<tr>
					<td><label>Usuário:</label></td>
					<td><input type="text" name="idUsuario" /></td>
				</tr>
				<tr>
					<td><label>Senha:</label></td>
					<td><input type="password" name="senha" /></td>
				</tr>
				<tr>
					<td><a href="#" title="Recuperar sua senha pelo email">Esqueceu sua senha</a></td>
					<td><input type="submit" value="Entrar"></td>
				</tr>			
			</table>
		</form>
	</div>
</div>
<!--end navBar div -->
<div id="siteInfo"> <a href="inicio.html">Sobre SGBU</a> | <a href="#">Privacidade</a> | <a href="#">Contatos</a> | &copy;2011 SGBU </div>
<br />
</body>
</html>