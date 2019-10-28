package dao;

import entities.Dashboard;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless
public class DashboardFacade extends AbstractFacade<Dashboard> {

    @PersistenceContext(unitName = "siaecPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public DashboardFacade() {
        super(Dashboard.class);
    }
    
    public List<Dashboard> dashboardPermitidos(){
        return getEntityManager().createNamedQuery("Dashboard.dashboardPermitidos").getResultList();
    }
    
}
