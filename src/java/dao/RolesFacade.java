package dao;

import entities.Roles;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless
public class RolesFacade extends AbstractFacade<Roles> {

    @PersistenceContext(unitName = "siaecPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public RolesFacade() {
        super(Roles.class);
    }
    
    public List<Roles> rolesDisponibles(boolean rolEstado){
        return getEntityManager().createNamedQuery("Roles.findByRolEstado").setParameter("rolEstado", rolEstado).getResultList();
    }
    
}
