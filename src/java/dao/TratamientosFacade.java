package dao;

import entities.Tratamientos;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless
public class TratamientosFacade extends AbstractFacade<Tratamientos> {

    @PersistenceContext(unitName = "siaecPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public TratamientosFacade() {
        super(Tratamientos.class);
    }
    
    public List<Tratamientos> tratamientosDisponibles(boolean tratamientoEstado){
        return getEntityManager().createNamedQuery("Tratamientos.findByTratamientoEstado").setParameter("tratamientoEstado", tratamientoEstado).getResultList();
    }
    
}
