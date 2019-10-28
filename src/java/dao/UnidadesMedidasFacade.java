package dao;

import entities.UnidadesMedidas;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless
public class UnidadesMedidasFacade extends AbstractFacade<UnidadesMedidas> {

    @PersistenceContext(unitName = "siaecPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public UnidadesMedidasFacade() {
        super(UnidadesMedidas.class);
    }
    
    public List<UnidadesMedidas> unidadesMedidasDisponibles(boolean unidadMedidaEstado){
        return getEntityManager().createNamedQuery("UnidadesMedidas.findByUnidadmedidaEstado").setParameter("unidadmedidaEstado", unidadMedidaEstado).getResultList();
    }
    
}
