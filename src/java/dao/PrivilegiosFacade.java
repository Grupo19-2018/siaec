package dao;

import entities.Privilegios;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless
public class PrivilegiosFacade extends AbstractFacade<Privilegios> {

    @PersistenceContext(unitName = "siaecPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public PrivilegiosFacade() {
        super(Privilegios.class);
    }
    
    public List<Privilegios> privilegiosPorSubmenu(int submenuId){
        return getEntityManager().createNamedQuery("Privilegios.findBySubmenuId").setParameter("submenuId", submenuId).getResultList();
    }
    
}
