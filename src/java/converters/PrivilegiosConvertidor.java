
package converters;

import dao.PrivilegiosFacade;
import entities.Clinicas;
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
public class PrivilegiosConvertidor implements Converter, Serializable{
    
    @EJB 
    private PrivilegiosFacade privilegiosFacade;
    
    public PrivilegiosConvertidor() {
    }
    
    @Override
    public Object getAsObject(FacesContext context, UIComponent component, String value) {
        if (  value.trim().equals("") || value.trim().equals("Seleccione uno...") || value.trim().equals("null") ) {
            //System.out.println("converters.ClinicaConvertidor.getAsObject()");
            return null;
        } else {
            try {
               //System.out.println(".getAsObject() Es el else");
                //System.out.println("Value" +value);
                //System.out.println("Faces Contex" + context);
                //System.out.println("UI" + component);
                int id = Integer.parseInt(value);
                //Privilegios privilegio = getPrivilegiosFacade().find(id);
                Privilegios privilegio = getPrivilegiosFacade().privilegioAccion(id);
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
            System.out.println("converters.PrivilegiosConvertidor.getAsString()");
            return null;
        }
        System.out.println("convertersgetAsString() retorno");
        return String.valueOf(((Privilegios) value).getPrivilegiosPK().getPrivilegioId());
    }

    public PrivilegiosFacade getPrivilegiosFacade() {
        return privilegiosFacade;
    }

    
    
    
}
