package dao;

import entities.Insumos;
import java.util.Date;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless
public class InsumosFacade extends AbstractFacade<Insumos> {

    @PersistenceContext(unitName = "siaecPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public InsumosFacade() {
        super(Insumos.class);
    }
    
    //Método para listado de insumos en módulo insumos.
    public List<Insumos> insumosDisponibles(boolean insumoEstado){
        return getEntityManager().createNamedQuery("Insumos.findByInsumoEstado").setParameter("insumoEstado", insumoEstado).getResultList();
    }
    
    //Lista de Insumos, para validacion de reporte de listado de insumos médicos (rep_listado_insumos.xhtml).
    public List<Insumos> findListadoInsumosReporte(boolean insumoEstado, Date fechaInicio, Date fechaFin){
        return getEntityManager().createNamedQuery("Insumos.findListadoInsumosReporte").setParameter("insumoEstado", insumoEstado).setParameter("fechaInicio", fechaInicio).setParameter("fechaFin", fechaFin).getResultList();
    }
    
}
