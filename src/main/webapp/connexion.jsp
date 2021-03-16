<%--
  Created by IntelliJ IDEA.
  User: quentin
  Date: 16/03/2021
  Time: 09:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="enTetePage.jsp"%>
<%@page import="commerce.catalogue.domaine.modele.Utilisateur" %>

<%

    String type = request.getParameter("type");

    if (type == null || type.equals("connexion")) {

%>

<form action="controleUtilisateur.jsp?action=connexion" method="post">
    <div class="form-row">
        <div class="form-row-first">
            <label>
                Email :
                <input type="email" name="email" required>
            </label>
        </div>
        <div class="form-row-last">
            <label>
                Mot de passe :
                <input type="password" name="password" required>
            </label>
        </div>
    </div>
    <a href="?type=inscription" class="form-row-first">créer un compte</a>
    <input type="submit" class="button aligncenter" value="se connecter">
</form>

<%
    }else if (type.equals("inscription")) {
%>

<form action="controleUtilisateur.jsp?action=inscription" method="post">
    <div class="container form-row">
        <div class="form-row-first">
            <label>
                Nom :
                <input type="text" name="nom" required>
            </label>
        </div>
        <div class="form-row-last">
            <label>
                Prénom :
                <input type="text" name="prenom" required>
            </label>
        </div>
    </div>
    <div class="form-row">
        <div class="form-row-first">
            <label>
                Email :
                <input type="email" name="email" required>
            </label>
        </div>
        <div class="form-row-last">
            <label>
                Mot de passe :
                <input type="password" name="password" required>
            </label>
        </div>
    </div>
    <a href="?type=connexion" class="form-row-first">se connecter</a>
    <input type="submit" class="button aligncenter" value="s'inscrire">
</form>

<%
    }
%>

<%@include file="piedDePage.html"%>
