<%@ page import="commerce.catalogue.domaine.modele.Utilisateur" %>
<%@ page import="commerce.catalogue.service.UtilisateurManager" %><%--
  Created by IntelliJ IDEA.
  User: quentin
  Date: 16/03/2021
  Time: 10:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String action = request.getParameter("action");
    Utilisateur utilisateur = new Utilisateur();
    UtilisateurManager utilisateurManager = new UtilisateurManager();
    String url = response.encodeURL("index.jsp");

    if (action.equals("deconnexion")) {
        utilisateur = null;
        session.invalidate();
        url = response.encodeURL("index.jsp");
    }else {
        if (action.equals("inscription")) {
            utilisateur.setNom(request.getParameter("nom"));
            utilisateur.setPrenom(request.getParameter("prenom"));
            utilisateur.setMail(request.getParameter("email"));
            utilisateur.setPassword(request.getParameter("password"));
            utilisateurManager.soumettreUtilisateur(utilisateur);
        } else if (action.equals("connexion")) {
            try {
                utilisateur = utilisateurManager.chercherUtilisateurParRef(request.getParameter("email"), request.getParameter("password"));
            } catch (Exception e) {
                //                e.printStackTrace();
            }

        }

        if (utilisateur == null)
            url = response.encodeURL("connexion.jsp?type=inscription");

        session.setAttribute("utilisateur", utilisateur);

    }

    response.sendRedirect(url);

%>
