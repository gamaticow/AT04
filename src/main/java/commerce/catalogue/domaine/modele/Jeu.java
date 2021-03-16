package commerce.catalogue.domaine.modele;

import javax.persistence.Basic;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;

/**
 * Created by Corentin on 16/03/2021 at 11:42
 */

@Entity (name="commerce.catalogue.domaine.modele.Jeu")
@DiscriminatorValue("jeu")
public class Jeu extends Article {

    private String editeur;
    private String type;
    private String console;
    private int pegi;

    @Basic
    public String getEditeur() {
        return editeur;
    }
    public void setEditeur(String inEditeur) {
        editeur = inEditeur;
    }

    @Basic
    public String getType() {
        return type;
    }
    public void setType(String inType) {
        type = inType;
    }

    @Basic
    public String getConsole() {
        return console;
    }
    public void setConsole(String inConsole) {
        console = inConsole;
    }

    @Basic
    public int getPegi() {
        return pegi;
    }
    public void setPegi(int inPegi) {
        pegi = inPegi;
    }


}
