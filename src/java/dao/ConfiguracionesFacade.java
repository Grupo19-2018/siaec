package dao;

import entities.Configuraciones;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless
public class ConfiguracionesFacade extends AbstractFacade<Configuraciones> {

    @PersistenceContext(unitName = "siaecPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ConfiguracionesFacade() {
        super(Configuraciones.class);
    }
    
}
