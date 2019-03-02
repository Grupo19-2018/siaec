/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entities.Movimientos;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Fam. Gomez Aldana
 */
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
    
    //Método paera filtrar movimientos por sucursal seleccionada (insumo_entrada_salida_listado.xhtml).
    public List<Movimientos> movimientosPorSucursal(int clinicaId){
        return getEntityManager().createNamedQuery("Movimientos.findByMovimientoPorClinica").setParameter("clinicaId", clinicaId).getResultList();
    }
    
}
