package dao;

import entities.Medicos;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless
public class MedicosFacade extends AbstractFacade<Medicos> {

    @PersistenceContext(unitName = "siaecPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public MedicosFacade() {
        super(Medicos.class);
    }
    
    public List<Medicos> medicosDisponibles(boolean medicoEstado){
        return getEntityManager().createNamedQuery("Medicos.findByMedicoEstado").setParameter("medicoEstado", medicoEstado).getResultList();
    }
    
    //Metodo para encontrar medico por medio del usuario.
    //Usado en: Dashboard_Medico.java
    public Medicos medico(String usuario){
        return (Medicos) getEntityManager().createNamedQuery("Medicos.findByMedicoUsuario").setParameter("medicoUsuario", usuario).getSingleResult();
    }
    
}
