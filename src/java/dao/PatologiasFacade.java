package dao;

import entities.Patologias;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless
public class PatologiasFacade extends AbstractFacade<Patologias> {

    @PersistenceContext(unitName = "siaecPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public PatologiasFacade() {
        super(Patologias.class);
    }
    
    public List<Patologias> patologiasDisponibles(boolean patologiaEstado){
        return getEntityManager().createNamedQuery("Patologias.findByPatologiaEstado").setParameter("patologiaEstado", patologiaEstado).getResultList();
    }
    
}
