package dao;

import entities.Bitacora;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless
public class BitacoraFacade extends AbstractFacade<Bitacora> {

    @PersistenceContext(unitName = "siaecPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public BitacoraFacade() {
        super(Bitacora.class);
    }
    
}
