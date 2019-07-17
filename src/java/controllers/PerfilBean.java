package controllers;

import dao.UsuariosFacade;
import entities.Usuarios;
import java.io.IOException;
import java.io.Serializable;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.codec.digest.DigestUtils;
import org.primefaces.context.RequestContext;

/* @author Equipo 19-2018 FIA-UES */
@ManagedBean
@ViewScoped
public class PerfilBean implements Serializable {

    @EJB
    private UsuariosFacade usuariosFacade;
    private Usuarios usuarioLogueado = new Usuarios();
    
    private boolean banderaCorreo = true; //Bandera para habilitar edición de correo. (perfil_consultar)
    private boolean banderaTelefono = true; //Bandera para habilitar edición de teléfono. (perfil_consultar)
    private boolean banderaBoton = false;  //Bandera para habilitar botón de guardar edición. (perfil_consultar)
    
    private String contraseniaActual; //Para guardar la contraseña actual. (cambiar_contrasenia)
    private String contraseniaNueva1; //Para guardar la nueva contraseña. (cambiar_contrasenia)
    private String contraseniaNueva2; //Para validar la nueva contraseña. (cambiar_contrasenia)
    
    private boolean banderaPanel1 = true; //Para mostra/ocultar panel para contraseña actual. (cambiar_contrasenia)
    private boolean banderaPanel2 = false; //Para mostra/ocultar panel para nueva contraseña. (cambiar_contrasenia)
    private boolean banderaPanel3 = false; //Para mostra/ocultar panel para repetir nueva contraseña. (cambiar_contrasenia)
    private boolean banderaPanel4 = false; //Para mostra/ocultar panel para confirmación de contraseña actualizada. (cambiar_contrasenia)
    
    //Session
    @ManagedProperty(value = "#{appSession}")
    private AppSession appSession;
    
    public PerfilBean() {
    }
    
    public UsuariosFacade getUsuariosFacade() {
        return usuariosFacade;}
    
    public Usuarios getUsuarioLogueado() {
        usuarioLogueado = appSession.getUsuario();
        return usuarioLogueado;
    }
    public void setUsuarioLogueado(Usuarios usuarioLogueado) {
        this.usuarioLogueado = usuarioLogueado;
    }

    public AppSession getAppSession() {
        return appSession;
    }
    public void setAppSession(AppSession appSession) {
        this.appSession = appSession;
    }
    
    public boolean isBanderaCorreo() {
        return banderaCorreo;
    }
    public void setBanderaCorreo(boolean banderaCorreo) {
        this.banderaCorreo = banderaCorreo;
    }

    public boolean isBanderaTelefono() {
        return banderaTelefono;
    }
    public void setBanderaTelefono(boolean banderaTelefono) {
        this.banderaTelefono = banderaTelefono;
    }

    public boolean isBanderaBoton() {
        return banderaBoton;
    }
    public void setBanderaBoton(boolean banderaBoton) {
        this.banderaBoton = banderaBoton;
    }

    public String getContraseniaActual() {
        return contraseniaActual;
    }
    public void setContraseniaActual(String contraseniaActual) {
        this.contraseniaActual = contraseniaActual;
    }

    public String getContraseniaNueva1() {
        return contraseniaNueva1;
    }
    public void setContraseniaNueva1(String contraseniaNueva1) {
        this.contraseniaNueva1 = contraseniaNueva1;
    }

    public String getContraseniaNueva2() {
        return contraseniaNueva2;
    }
    public void setContraseniaNueva2(String contraseniaNueva2) {
        this.contraseniaNueva2 = contraseniaNueva2;
    }
    
    public boolean isBanderaPanel1() {
        return banderaPanel1;
    }
    public void setBanderaPanel1(boolean banderaPanel1) {
        this.banderaPanel1 = banderaPanel1;
    }

    public boolean isBanderaPanel2() {
        return banderaPanel2;
    }
    public void setBanderaPanel2(boolean banderaPanel2) {
        this.banderaPanel2 = banderaPanel2;
    }

    public boolean isBanderaPanel3() {
        return banderaPanel3;
    }
    public void setBanderaPanel3(boolean banderaPanel3) {
        this.banderaPanel3 = banderaPanel3;
    }

    public boolean isBanderaPanel4() {
        return banderaPanel4;
    }
    public void setBanderaPanel4(boolean banderaPanel4) {
        this.banderaPanel4 = banderaPanel4;
    }
        
    //Método para actualizar en la entidad Usuarios. (perfil_consultar) 
    public void actualizarUsuario() {
        try {
            getUsuariosFacade().edit(usuarioLogueado);
            banderaCorreo = true;
            banderaTelefono = true;
            banderaBoton = false;
        } catch (Exception e) {
            mensajeError("Se detuvo el proceso en el método: actualizarUsuario.");
        }
    }

    //Método para actualizar constraseña. (cambiar_contrasenia)  
    public void actualizarContrasenia() {
        try {
            if(contraseniaNueva2.equals(contraseniaNueva1)){
                usuarioLogueado = appSession.getUsuario();
                usuarioLogueado.setUsuarioContrasenia(DigestUtils.md5Hex(contraseniaNueva1));
                getUsuariosFacade().edit(usuarioLogueado);
                contraseniaNueva1 = "";
                contraseniaNueva2 = "";
                banderaPanel1 = false;
                banderaPanel2 = false;
                banderaPanel3 = false;
                banderaPanel4 = true;
            }
            else{
                addMensaje("Las contraseñas no coinciden.");
            }
            
        } catch (Exception e) {
            mensajeError("Se detuvo el proceso en el método: actualizarContrasenia.");
        }
    }

    //Método para validar la contraseña actual. (cambiar_contrasenia) 
    public void validaContrasenia(){
        try{
            banderaPanel1 = true;
            banderaPanel2 = false;
            banderaPanel3 = false;
            banderaPanel4 = false;
            if (DigestUtils.md5Hex(contraseniaActual).equals(appSession.getUsuario().getUsuarioContrasenia())) {
                banderaPanel1 = false;
                banderaPanel2 = true;
                banderaPanel3 = false;
                banderaPanel4 = false;
            }
            else{
                addMensaje("La contraseña es incorrecta");
            }
        } catch (Exception e){
            mensajeError("Se detuvo el proceso en el método: validaContrasenia.");
        }
    }
    
    //Método para validar la nueva contraseña. (cambiar_contrasenia) 
    public void nuevaContrasenia(){
        try{
            banderaPanel1 = false;
            banderaPanel2 = true;
            banderaPanel3 = false;
            banderaPanel3 = false;
            if (contraseniaNueva1.length() > 5 && contraseniaNueva1.length() < 11) {
                banderaPanel1 = false;
                banderaPanel2 = false;
                banderaPanel3 = true;
                banderaPanel4 = false;
            }
            else{
                addMensaje("La contraseña debe tener entre 6 y 10 caracteres.");
            }
        } catch (Exception e){
            mensajeError("Se detuvo el proceso en el método: nuevaContrasenia.");
        }
    }
    
    public void addMensaje(String mensaje) {
	getFacesContext().addMessage("",new FacesMessage(FacesMessage.SEVERITY_INFO, mensaje, null));
    }
    
    private static FacesContext getFacesContext() {
        return FacesContext.getCurrentInstance();
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
    
    //Método para salir del sistema.
    public void salirSistema(){
        appSession.setUsuario(null);
        FacesContext context = FacesContext.getCurrentInstance();
        HttpServletRequest origRequest = (HttpServletRequest) context.getExternalContext().getRequest();
        String contextPath = origRequest.getContextPath();
        try{
            FacesContext.getCurrentInstance().getExternalContext().redirect(contextPath+"/login.xhtml");
        }
        catch(IOException e){
            e.printStackTrace();
        }
    }
        
}
