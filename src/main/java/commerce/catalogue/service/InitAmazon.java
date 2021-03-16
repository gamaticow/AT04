/**
 * Title:        commerce
 * Description:  Class for e-commerce
 * Company:      IUT Laval - Université du Maine
 * @author  A. Corbière
 */
package commerce.catalogue.service;

import commerce.catalogue.domaine.modele.Jeu;
import commerce.catalogue.domaine.utilitaire.UniqueKeyGenerator;

public class InitAmazon {

	private final CatalogueManager catalogueManager ;

	public InitAmazon(CatalogueManager catalogueManager) {
		this.catalogueManager = catalogueManager ;
	}

	public void init() {
		Jeu jeu = new Jeu();
		jeu.setRefArticle(UniqueKeyGenerator.getUniqueId());
		jeu.setTitre("MarioKart 8 Deluxe");
		jeu.setImage("https://images-na.ssl-images-amazon.com/images/I/91BphPXVYVL._AC_SL1500_.jpg");
		jeu.setPrix(59.99);
		jeu.setDisponibilite(1);
		jeu.setEditeur("Nintendo");
		jeu.setType("Course");
		jeu.setConsole("Nintendo Switch");
		jeu.setPegi(3);

		try {
			catalogueManager.soumettreArticle(jeu);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
