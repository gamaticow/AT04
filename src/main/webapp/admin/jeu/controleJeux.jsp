<%@ page pageEncoding="UTF-8"%>
<%@ page import="commerce.catalogue.service.CatalogueManager"%>
<%@ page import="commerce.catalogue.domaine.modele.Jeu"%>
<%
	CatalogueManager catalogueManager = (CatalogueManager)application.getAttribute("catalogueManager") ;
    Jeu jeu = new Jeu() ;
    int refArticle = 0;
    if(request.getParameter("commande")!=null) {
      if (request.getParameter("commande").equals("AModifier")) {
        jeu = (Jeu) catalogueManager.chercherArticleParRef(request.getParameter("refArticle")) ;
        session.setAttribute("jeu", jeu) ;
        response.sendRedirect(response.encodeURL("modifie.jsp")) ;
      }
      if (request.getParameter("commande").equals("ajouter")
       || request.getParameter("commande").equals("modifier")) {
        jeu.setRefArticle(request.getParameter("refArticle")) ;
        jeu.setTitre(request.getParameter("titre")) ;
        jeu.setEditeur(request.getParameter("editeur")) ;
        jeu.setConsole(request.getParameter("console")); ;
        jeu.setType(request.getParameter("type")); ;
        jeu.setPegi(Integer.parseInt(request.getParameter("pegi"))); ;
        jeu.setImage(request.getParameter("image")) ;
        jeu.setPrix(request.getParameter("prix")) ;
        jeu.setDisponibilite(request.getParameter("disponibilite")) ;
        catalogueManager.soumettreArticle(jeu) ;
	    response.sendRedirect(response.encodeURL("affiche.jsp")) ;
      }
      if (request.getParameter("commande").equals("supprimer")) {
        catalogueManager.supprimerArticleParRef(request.getParameter("refArticle")) ;
	    response.sendRedirect(response.encodeURL("affiche.jsp")) ;
      }
    }
    else
      response.sendRedirect(response.encodeURL("affiche.jsp")) ;
%>