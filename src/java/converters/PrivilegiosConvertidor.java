package converters;

import dao.PrivilegiosFacade;
import entities.Privilegios;
import java.io.Serializable;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.ConverterException;
import javax.inject.Named;

@Named(value = "privilegiosConvertidor")
@ManagedBean
@ViewScoped
public class PrivilegiosConvertidor implements Converter, Serializable {

    @EJB
    private PrivilegiosFacade privilegiosFacade;

    public PrivilegiosConvertidor() {
    }

    @Override
    public Object getAsObject(FacesContext context, UIComponent component, String value) {
        if (value.trim().equals("") || value.trim().equals("Seleccione uno...") || value.trim().equals("null")) {
            return null;
        } else {
            try {
                String[] tokens = value.split("pri");
                Privilegios privilegio = getPrivilegiosFacade().privilegioPK(Integer.parseInt(tokens[1]), Integer.parseInt(tokens[0]));
                return privilegio;
            } catch (Exception e) {
                System.err.print(e);
                throw new ConverterException(new FacesMessage(FacesMessage.SEVERITY_ERROR, "Error de conversión", "Seleccione una unidad de medida."));
            }
        }
    }

    @Override
    public String getAsString(FacesContext context, UIComponent component, Object value) {
        if (!(value instanceof Privilegios)) {
            return null;
        }
        return String.valueOf(((Privilegios) value).getPrivilegiosPK().getSubmenuId() + "pri" + ((Privilegios) value).getPrivilegiosPK().getPrivilegioId());
    }

    public PrivilegiosFacade getPrivilegiosFacade() {
        return privilegiosFacade;
    }

}
