package dao;

import entities.Clinicas;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless
public class ClinicasFacade extends AbstractFacade<Clinicas> {

    @PersistenceContext(unitName = "siaecPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ClinicasFacade() {
        super(Clinicas.class);
    }
    
    public List<Clinicas> clinicasDisponibles(boolean clinicaEstado){
        return getEntityManager().createNamedQuery("Clinicas.findByClinicaEstado").setParameter("clinicaEstado", clinicaEstado).getResultList();
    }
    
}
