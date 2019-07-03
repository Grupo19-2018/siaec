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
            //System.out.println("converters.ClinicaConvertidor.getAsObject() seleccione");
            return null;
        } else {
            try {
                //System.out.println("Value " + value);
                //System.out.println("Faces Contex" + context);
                String[] tokens = value.split("pri");
                //System.out.println("Token " + tokens[0]);
                //System.out.println("Token " + tokens[1]);
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
            //System.out.println("converters.PrivilegiosConvertidor.getAsString()");
            return null;
        }
        //System.out.println("IdPrivilegio " +((Privilegios) value).getPrivilegiosPK().getPrivilegioId());
        //System.out.println("Submenu " +((Privilegios) value).getPrivilegiosPK().getSubmenuId());
        return String.valueOf(((Privilegios) value).getPrivilegiosPK().getSubmenuId() + "pri" + ((Privilegios) value).getPrivilegiosPK().getPrivilegioId());
    }

    public PrivilegiosFacade getPrivilegiosFacade() {
        return privilegiosFacade;
    }

}
