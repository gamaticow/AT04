/**
 * Title:        commerce
 * Description:  Class for e-commerce
 * Company:      IUT Laval - Université du Maine
 * @author  A. Corbière
 */

package commerce.catalogue.service;

import commerce.catalogue.domaine.modele.Article;
import commerce.catalogue.domaine.modele.Utilisateur;
import commerce.catalogue.domaine.utilitaire.HibernateUtil;
import commerce.catalogue.domaine.utilitaire.UniqueKeyGenerator;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;

import java.util.List;

public class UtilisateurManager {

    public Utilisateur chercherUtilisateurParRef(String mail, String mdp) throws Exception {
        Utilisateur utilisateur;
        Session session = HibernateUtil.getSessionFactory().getCurrentSession() ;
        try {
            session.beginTransaction();
            Criteria criteria = session.createCriteria(Utilisateur.class);
            Criterion mailCriterion = Restrictions.eq("mail", mail);
            Criterion mdpCriterion = Restrictions.eq("password", mdp);
            utilisateur = (Utilisateur) criteria.add(Restrictions.and(mailCriterion, mdpCriterion));
            session.getTransaction().commit();
        }
        catch (RuntimeException e) {
            if (session.getTransaction() != null)
                session.getTransaction().rollback();
            throw new Exception();
        }
        return utilisateur;
    }
    public void supprimerUtilisateurParRef(String mail, String mdp) throws Exception {
        Utilisateur utilisateur ;
        Session session = HibernateUtil.getSessionFactory().getCurrentSession() ;
        try {
            session.beginTransaction();
            Criteria criteria = session.createCriteria(Utilisateur.class);
            Criterion mailCriterion = Restrictions.eq("mail", mail);
            Criterion mdpCriterion = Restrictions.eq("password", mdp);
            utilisateur = (Utilisateur) criteria.add(Restrictions.and(mailCriterion, mdpCriterion));
            session.delete(utilisateur) ;
            session.getTransaction().commit();
        }
        catch (RuntimeException e) {
            if (session.getTransaction() != null)
                session.getTransaction().rollback();
            throw e;
        }
    }
    public void soumettreUtilisateur(Utilisateur utilisateur) throws Exception {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession() ;
        try {
            session.beginTransaction();
            if (utilisateur.getId() == null) {
                utilisateur.setId(new UniqueKeyGenerator().getUniqueId()); ;
                session.save(utilisateur) ;
            }
            else {
                session.saveOrUpdate(utilisateur) ;
            }
            session.getTransaction().commit();
        }
        catch (RuntimeException e) {
            if (session.getTransaction() != null)
                session.getTransaction().rollback();
            throw e;
        }
    }

}