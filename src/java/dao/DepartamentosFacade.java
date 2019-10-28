package dao;

import entities.Departamentos;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless
public class DepartamentosFacade extends AbstractFacade<Departamentos> {

    @PersistenceContext(unitName = "siaecPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public DepartamentosFacade() {
        super(Departamentos.class);
    }
    
}
