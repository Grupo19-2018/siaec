package dao;

import entities.Municipios;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless
public class MunicipiosFacade extends AbstractFacade<Municipios> {

    @PersistenceContext(unitName = "siaecPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public MunicipiosFacade() {
        super(Municipios.class);
    }
    
    public List<Municipios> municipioPorDepartamentos(int departamentoId){
        return getEntityManager().createNamedQuery("Municipios.findByMunicipioByDepartamento").setParameter("departamentoId", departamentoId).getResultList();
    }
    
    public Municipios MunicipioDePaciente(Integer municipioId) {
        List <Municipios> results = getEntityManager().createNamedQuery("Municipios.findByMunicipioId").setParameter("municipioId", municipioId).getResultList();
        Municipios foundEntity = null;
        if (!results.isEmpty()) {
            foundEntity = results.get(0);
        }
        return foundEntity;
    }
    
}
