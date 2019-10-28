package dao;

import entities.Movimientos;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless
public class MovimientosFacade extends AbstractFacade<Movimientos> {

    @PersistenceContext(unitName = "siaecPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public MovimientosFacade() {
        super(Movimientos.class);
    }
    
    //Método para filtrar movimientos por sucursal seleccionada (insumo_entrada_salida_listado.xhtml).
    public List<Movimientos> movimientosPorSucursal(int clinicaId){
        return getEntityManager().createNamedQuery("Movimientos.findByMovimientoPorClinica").setParameter("clinicaId", clinicaId).getResultList();
    }
    
    //Método para filtrar movimientos por insumo y sucursal (insumo_historial_editar.xhtml).
    public List<Movimientos> movimientosPorExistencia(int existenciaId){
        return getEntityManager().createNamedQuery("Movimientos.findByMovimientoPorExistencia").setParameter("existenciaId", existenciaId).getResultList();
    }
    
}
