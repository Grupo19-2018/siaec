package dao;

import entities.Privilegios;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless
public class PrivilegiosFacade extends AbstractFacade<Privilegios> {

    @PersistenceContext(unitName = "siaecPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public PrivilegiosFacade() {
        super(Privilegios.class);
    }
    
    public List<Privilegios> privilegiosPorSubmenu(int submenuId){
        return getEntityManager().createNamedQuery("Privilegios.findBySubmenuId").setParameter("submenuId", submenuId).getResultList();
    }
    
    //Fecha: 20/febrero/2019
    //Convertidor 
    //Estado: Prueba
        public Privilegios privilegioAccion(int id_accion) {
            return (Privilegios) getEntityManager().createNamedQuery("Privilegio.privilegio").setParameter("id_accion", id_accion).getSingleResult();
        }
        
    public Privilegios privilegioPK(Integer privilegio_id, Integer submenu_id){
        return  (Privilegios) getEntityManager().createNamedQuery("Privilegio.privilegioPK").setParameter("privilegio_id", privilegio_id).setParameter("submenu_id", submenu_id).getSingleResult();
    }    
}
