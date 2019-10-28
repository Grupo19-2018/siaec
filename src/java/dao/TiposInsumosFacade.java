package dao;

import entities.TiposInsumos;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless
public class TiposInsumosFacade extends AbstractFacade<TiposInsumos> {

    @PersistenceContext(unitName = "siaecPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public TiposInsumosFacade() {
        super(TiposInsumos.class);
    }
    
    public List<TiposInsumos> tiposInsumosDisponibles(boolean TipoInsumo){
        return getEntityManager().createNamedQuery("TiposInsumos.findByTipoinsumoEstado").setParameter("tipoinsumoEstado", TipoInsumo).getResultList();
    }
    
}
