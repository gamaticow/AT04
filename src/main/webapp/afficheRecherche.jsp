<%@ page pageEncoding="UTF-8"%>
<%@ include file="enTetePage.jsp"%>
<%@ page import="commerce.catalogue.service.CatalogueManager"%>
<%@ page import="commerce.catalogue.domaine.modele.Article"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.List"%>
<%
	if (session.getAttribute("panier")==null) {
		response.sendRedirect("./index.jsp");
	} else {
		CatalogueManager catalogueManager = (CatalogueManager) application
									.getAttribute("catalogueManager");
		List<Article> articles = catalogueManager.getArticles();
		Iterator<Article> listeDesArticles ;
		Article article;
%>
<nav id="navigation" class="col-full" role="navigation">
	<ul id="main-nav" class="nav fl">
		<li id="menu-item-290"
			class="menu-item menu-item-type-custom menu-item-object-custom current-menu-item">
			<a href="<%=response.encodeURL("./afficheRecherche.jsp")%>">Rechercher
				un article</a>
		</li>
		<li id="menu-item-290"
			class="menu-item menu-item-type-custom menu-item-object-custom">
			<a href="<%=response.encodeURL("./controlePanier.jsp")%>">Panier</a>
		</li>
	</ul>
</nav>
<div id="content" class="site-content" tabindex="-1">
	<div class="col-full">
		<div class="primary" class="content-area">
			<section id="main" class="site-main" role="main">
				<h1 class="page-title">Résultats de la recherche</h1>
				<ul class="products">
					<%
							listeDesArticles = articles.iterator() ;
							while (listeDesArticles.hasNext()) {
								article = (Article) listeDesArticles.next();
					%>
					<li class="product type-product"><a
						href="<%=response.encodeURL("./controlePanier.jsp?refArticle="
								+ article.getRefArticle()
						+ "&amp;commande=ajouterLigne")%>"> <img
							src="<% if (article.getImage().startsWith("http")) 
									    out.print(article.getImage()) ;
							        else
							        	out.print("./images/"+article.getImage()) ; %>"
							class="attachment-shop_catalog wp-post-image" alt="poster_2_up"
							height="300" width="300"/>
							<h3><%=article.getTitre()%></h3> <span class="price"><ins>
									<span class="amount"><%=article.getPrix()%> €</span>
								</ins></span>

					</a> <a
						href="<%=response.encodeURL("./controlePanier.jsp?refArticle="
								+ article.getRefArticle()
						+ "&amp;commande=ajouterLigne")%>"
						class="button add_to_cart_button product_type_simple">Mettre
							dans le panier</a>
<%
							}
 %>
				</ul>
			</section>
		</div>
	</div>
</div>
<%
	}
%>
<%@ include file="piedDePage.html"%>