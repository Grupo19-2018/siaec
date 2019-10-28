package dao;

import entities.Submenus;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless
public class SubmenusFacade extends AbstractFacade<Submenus> {

    @PersistenceContext(unitName = "siaecPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public SubmenusFacade() {
        super(Submenus.class);
    }
    
    public List<Submenus> subMenuPorMenu(Integer menu_id) {
        return getEntityManager().createNamedQuery("Submenus.findMenu").setParameter("menu_id", menu_id).getResultList();
    }

}
