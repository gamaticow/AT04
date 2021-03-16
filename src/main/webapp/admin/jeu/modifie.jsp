<%@ page pageEncoding="UTF-8"%>
<%@ include file="../enTetePage.html"%>
<%@ page import="commerce.catalogue.domaine.modele.Jeu" %>
<%@ page import="java.lang.reflect.Field" %>
<%@ page import="java.lang.reflect.Method" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Arrays" %>
<%
Jeu jeu = (Jeu) session.getAttribute("jeu") ;
if (jeu == null)
	response.sendRedirect(response.encodeURL("index.jsp")) ;
 else { 
%>
    <form action="controleJeux.jsp?commande=modifier" method="post">
	  <input type="hidden" name="refArticle" value="<%=jeu.getRefArticle() %>"/>
<%
  Field[] articleFields = jeu.getClass().getSuperclass().getDeclaredFields();
  ArrayList<Field> list = new ArrayList<Field>(Arrays.asList(articleFields));
  for (int i = 0; i < list.size(); i++) {
    if (list.get(i).getName().equals("refArticle")) {
	  list.remove(i);
    }
  }
  articleFields = list.toArray(new Field[articleFields.length-1]);
  for (Field articleField : articleFields) {
    String articleLabel = articleField.getName().substring(0,1).toUpperCase() + articleField.getName().substring(1) ;
	Class noparams[] = {};
	Method method = jeu.getClass().getSuperclass().getDeclaredMethod("get" + articleLabel,noparams) ;
	String pattern = ".*" ;
	if(articleField.getType().toString().equals("int")) {
	   pattern = "\\d+" ;
	}
    if(articleField.getType().toString().equals("double")) {
      pattern = "\\d+.\\d+" ;
	}
    if(articleField.getType().toString().equals("class java.lang.String")) {
      pattern = ".*" ;
    }
%>
      <div>
        <label for="_<%=articleField.getName() %>_id"><%=articleLabel %></label>
		<div>
		  <input type="text" size="70" name="<%=articleField.getName() %>" value="<% 
		  if(method.invoke(jeu, null)!=null) out.print(method.invoke(jeu, null));
          else out.print(""); 
          %>" required pattern="<%=pattern %>"/>
		</div>
	  </div>
<%
  }
  Field[] musiqueFields = jeu.getClass().getDeclaredFields();
  list = new ArrayList<Field>(Arrays.asList(musiqueFields));
  for (int i = 0; i < list.size(); i++) {
    if (list.get(i).getName().equals("dateDeParution")) {
	  list.remove(i);
    }
  }
  musiqueFields = list.toArray(new Field[musiqueFields.length-2]);
  for (Field articleField : musiqueFields) {
    String articleLabel = articleField.getName().substring(0,1).toUpperCase() + articleField.getName().substring(1) ;
	Class noparams[] = {};
	Method method = jeu.getClass().getDeclaredMethod("get" + articleLabel,noparams) ;
	String pattern = ".*" ;
	if(articleField.getType().toString().equals("int")) {
	   pattern = "\\d+" ;
	}
    if(articleField.getType().toString().equals("double")) {
      pattern = "\\d+.\\d+" ;
	}
    if(articleField.getType().toString().equals("class java.lang.String")) {
      pattern = ".*" ;
    }
%>
      <div>
        <label for="_<%=articleField.getName() %>_id"><%=articleLabel %></label>
		<div>
		  <input type="text" size="70" name="<%=articleField.getName() %>" value="<% 
		  if(method.invoke(jeu, null)!=null) out.print(method.invoke(jeu, null));
          else out.print(""); 
          %>" required pattern="<%=pattern %>"/>
		</div>
	  </div>
<%
  }
%>
      <div>
        <input type="Submit" name="Submit" Value="Submit"/>
	  </div>
	</form>
<%
}
%>
<%@ include file="../piedDePage.html"%>
