package converters;

import dao.DashboardFacade;
import entities.Dashboard;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.ConverterException;
import javax.inject.Named;

@Named(value = "dashboardConvertidor")
@ManagedBean
@ViewScoped
public class DashboardConvertidor implements Converter {

    @EJB
    private DashboardFacade dashboardFacade;

    @Override
    public Object getAsObject(FacesContext context, UIComponent component, String value) {
        if (value.trim().equals("") || value.trim().equals("Seleccione uno...")) {
            return null;
        } else {
            try {
                 int id = Integer.parseInt(value);
                 Dashboard dasboard = getDashboardFacade().find(id);
                return  dasboard;
            } catch (Exception e) {
                 throw new ConverterException(new FacesMessage(FacesMessage.SEVERITY_ERROR, "Error de conversión", "Seleccione un tablero."));
            }
        }
    }

    @Override
    public String getAsString(FacesContext context, UIComponent component, Object value) {
        if(!(value instanceof Dashboard)){
            return null;
        }
        return String.valueOf(((Dashboard) value).getDashboardId());
    }

    public DashboardFacade getDashboardFacade() {
        return dashboardFacade;
    }
    
}
