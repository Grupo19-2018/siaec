package dao;

import entities.Promociones;
import java.util.Date;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless
public class PromocionesFacade extends AbstractFacade<Promociones> {

    @PersistenceContext(unitName = "siaecPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public PromocionesFacade() {
        super(Promociones.class);
    }
    
    public List<Promociones> promocionesDisponibles(boolean promocionEstado){
        return getEntityManager().createNamedQuery("Promociones.findByPromocionEstado").setParameter("promocionEstado", promocionEstado).getResultList();
    }
    
    //Para promociones a mostrarse en carrusel.
    public List<Promociones> promocionesActivas(boolean promocionEstado){
        Date fechaActual = new Date();
         return getEntityManager().createNamedQuery("Promociones.findByPromocionEstadoActiva").setParameter("promocionEstado", promocionEstado).setParameter("fechaActual", fechaActual).getResultList();
    }
    
    //Para correos
    public List<Promociones> promocionesFechaMes() {
        return getEntityManager().createNamedQuery("Promociones.cumpleanyosMes").setParameter("fecha_actual", new Date()).getResultList();
    }
	
    public List<Promociones> promocionesEspeciales() {
        return getEntityManager().createNamedQuery("Promociones.promocionesEspeciales").setParameter("fecha_actual", new Date()).getResultList();
    }
	
    public List<Promociones> promocionesReinicioCumpAndEsp(){
        return getEntityManager().createNamedQuery("Promociones.promocionesReinicioEspAndCump").setParameter("fecha_actual", new Date()).getResultList();
    }

    //Lista de promociones por rango de fechas, para validar reporte vacio
     public List<Promociones> findPromocionReport(Date fechainicio, Date fechafin){
        return getEntityManager().createNamedQuery("Promociones.findpromocionDemandaReport").setParameter("fechainicio", fechainicio).setParameter("fechafin", fechafin).getResultList();
    }
     
}
