package util;

import javax.faces.application.FacesMessage;
import org.primefaces.context.RequestContext;

public  class Mensajes {

    public Mensajes() {
    }
    
    //Método para mostrar mensaje de guardado/actualizado.
    public void mensajeGuardado(String mensaje) {
        FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_INFO, "Mensaje", mensaje);
        RequestContext.getCurrentInstance().showMessageInDialog(message);
    }

    //Método para mostrar mensaje de error en el sistema.
    public void mensajeError(String mensaje) {
        FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_ERROR, "¡Error!", mensaje);
        RequestContext.getCurrentInstance().showMessageInDialog(message);
    }
    
    //Método para mostrar mensaje de guardado/actualizado/eliminado.
    public void mensajeConfirmacion(String mensaje) {
        FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_INFO, "Mensaje", mensaje);
        RequestContext.getCurrentInstance().showMessageInDialog(message);
    }
}
