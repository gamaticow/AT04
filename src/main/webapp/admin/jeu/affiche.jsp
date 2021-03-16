<%@ page pageEncoding="UTF-8"%>
<%@ include file="../enTetePage.html"%>
<%@ page import="commerce.catalogue.service.CatalogueManager" %>
<%@ page import="commerce.catalogue.domaine.modele.Jeu" %>
<%@ page import="commerce.catalogue.domaine.modele.Article" %>
<%
 if (application.getAttribute("catalogueManager")==null) {
    response.sendRedirect("./index.jsp") ;
  }
  else {
	CatalogueManager catalogueManager = (CatalogueManager)application.getAttribute("catalogueManager") ;
%>
    <section class="entry">
      <table>
<%
    boolean enteteAffiche = false ;
    for(Article article : catalogueManager.getArticles()) {
	  if (article instanceof Jeu) {
	      Jeu jeu = (Jeu) article;
        if (!enteteAffiche) {
%>
        <thead>
          <tr>
            <th>R&eacute;f&eacute;rence&nbsp;</th>
            <th>Titre</th>
            <th>Editeur</th>
            <th>Console</th>
            <th>Type</th>
            <th>Pegi</th>
            <th>Disponibilit&eacute;</th>
			<th>Image</th>
            <th>prix</th>
            <th>&nbsp;</th>
            <th>&nbsp;</th>
          </tr>
        </thead>
<%
          enteteAffiche = true ;
        }
%>
		<tbody>
          <tr>
            <td><%=jeu.getRefArticle() %></td>
            <td><%=jeu.getTitre() %></td>
            <td><%=jeu.getEditeur() %></td>
            <td><%=jeu.getConsole() %></td>
            <td><%=jeu.getType() %></td>
            <td><%=jeu.getPegi() %></td>
            <td><%=jeu.getDisponibilite() %></td>
<%if (jeu.getImage() != null) {%>
		    <td><%=jeu.getImage() %></td>
<%} else {%>
		    <td>Inexistante</td>
<%}%>
            <td><%=jeu.getPrix() %></td>
            <td><a href="controleJeux.jsp?refArticle=<%=jeu.getRefArticle() %>&amp;commande=AModifier">Modifier</a></td>
            <td><a href="javascript:deleteObject('refArticle','<%=jeu.getRefArticle() %>')">Supprimer</a></td>
            <script type="text/javascript">
// <![CDATA[
	function deleteObject(id,idval)
	{
		if(confirm("Etes-vous sur de vouloir supprimer cet article ?"))
		{
			location.href = "controleJeux.jsp?commande=supprimer&" + id + "=" + idval;
		}
	}
// ]]>
            </script>
          </tr>
        </tbody>
<%
      }
    } 
%>
      </table>				
      <table>
        <tr>
          <td><a href="ajoute.jsp">Ajouter un nouveau jeu</a></td>
        </tr>
      </table>
     </section>
<%
  }
%>
<%@ include file="../piedDePage.html"%>
