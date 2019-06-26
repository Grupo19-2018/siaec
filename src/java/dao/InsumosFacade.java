/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entities.Insumos;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Fam. Gomez Aldana
 */
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
    public List<Insumos> findListadoInsumosReporte(boolean insumoEstado){
        return getEntityManager().createNamedQuery("Insumos.findListadoInsumosReporte").setParameter("insumoEstado", insumoEstado).getResultList();
    }
    
}
