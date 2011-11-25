<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    ::SGBU::
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div id="content">
  <div class="feature"> 
  		<br>
  		<h2>Bem vindo!</h2>
		<center>
			<img src="/Content/livro.jpg" />
			<h3>Sobre o SGBU</h3>
			<p style="text-align:justify">
			O sistema tem capacidade de armazenar um grande acervo.
			Possui processos de automação, para as soluções isoladas da biblioteca, desde formação do acervo até o empréstimo.
			Possibilitando aos seus usuários acesso para consultas, reservas de livros, identificação e pesquisa sobre o acervo disponível.
			<br><br>
			Para conhecer mais clique nos links  tópicos de ajuda =>
			</p>	
		</center>
  </div>
</div>
  <div id="navBar">
  <div class="relatedLinks">
  	<h3>Tópicos de ajuda</h3>
		<div id="sectionLinks">			
			<ul>
				<li><a href="#">Cadastrar novo usuário</a></li>
				<li><a href="#">Cadastrar novo livro</a></li>
				<li><a href="#">Cadastrar novo autor</a></li>
				<li><a href="#">Cadastrar nova editora</a></li>
				<li><a href="#">Cadastrar nova categoria</a></li>
				<li><a href="#">Solicitar reservas de livros</a></li>
				<li><a href="#">Registrar empréstimos de livros</a></li>
				<li><a href="#">Registrar devolução de livros</a></li>
				<li><a href="#">Consultar livros do acervo</a></li>
				<li><a href="#">Consultar autores</a></li>
				<li><a href="#">Consultar editoras</a></li>
				<li><a href="#">Emitir Relatórios</a></li>	
			</ul>
		</div>
  </div>
</div>
<!--end navBar div -->
</asp:Content>
