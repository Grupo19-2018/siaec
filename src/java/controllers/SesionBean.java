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
import org.primefaces.context.RequestContext;

/* @author Equipo 19-2018 FIA-UES */
@ManagedBean
@ViewScoped
public class SesionBean implements Serializable {

    @EJB
    private UsuariosFacade usuariosFacade;
    
//****************************************************************************//
//                                  Variables                                 //
//****************************************************************************//
    private String usuario = "";
    private String password = "";

    @ManagedProperty(value = "#{appSession}")
    private AppSession appSession;

    public SesionBean() {
    }

//****************************************************************************//
//                                   Métodos                                  //
//****************************************************************************//
    //Método Get para obtener datos de entidad Usuarios
    public UsuariosFacade getUsuariosFacade() {
        return usuariosFacade;
    }

    //Método para mostrar mensaje en login (login.xhtml).
    private static FacesContext getFacesContext() {
        return FacesContext.getCurrentInstance();
    }

    //Método que define la acción por usuario logueado, direciona a página de inicio según usuario.
    public void iniciarSesion() {
        try {
            Usuarios usuarioLogueado = getUsuariosFacade().traeUsuarioLogueado(usuario);
            System.out.println("UsuarioLogueado: "+usuarioLogueado.getUsuarioUsuario());
            if (usuarioLogueado != null) {
                if (!(usuarioLogueado.getUsuarioEstado())) {
                    mensajeError("El usuario no existe.");
                } else if (!(usuarioLogueado.getUsuarioBloqueado())) {
                    mensajeError("Su cuenta está bloqueada.");
                } else if (usuarioLogueado.getUsuarioContrasenia().equals(password)) {
                    appSession.setUsuario(usuarioLogueado);
                    System.out.println("UsuarioLogueado: "+usuarioLogueado.getUsuarioUsuario());
                    usuarioLogueado.setUsuarioIntentoFallido(0);
                    System.out.println("AppSession: "+appSession.getUsuario().getUsuarioUsuario());
                    getUsuariosFacade().edit(usuarioLogueado);
                    direccionaPagina("/dashboard.xhtml");
                } else {
                    mensajeError("Contraseña incorrecta.");
                    int intentos = usuarioLogueado.getUsuarioIntentoFallido();
                    usuarioLogueado.setUsuarioIntentoFallido(intentos + 1);
                    if (usuarioLogueado.getUsuarioIntentoFallido() == 3) {
                        usuarioLogueado.setUsuarioBloqueado(Boolean.FALSE);
                        usuarioLogueado.setUsuarioIntentoFallido(0);
                        getUsuariosFacade().edit(usuarioLogueado);
                        String mensaje = "Su cuenta ha sido bloqueada.";
                        mensajeError(mensaje);
                    } else {
                        getUsuariosFacade().edit(usuarioLogueado);
                    }
                }
            } else {
                mensajeError("El usuario no existe.");
            }
        } catch (Exception e) {
            mensajeError("Se detuvo el proceso en el método: iniciarSesion.");
        }
    }

    //Mpetodo para salir del sistema. (plantilla1)
    public void salirSistema() {
        appSession.setUsuario(null);
        FacesContext context = FacesContext.getCurrentInstance();
        HttpServletRequest origRequest = (HttpServletRequest) context.getExternalContext().getRequest();
        String contextPath = origRequest.getContextPath();
        try {
            FacesContext.getCurrentInstance().getExternalContext().redirect(contextPath + "/login.xhtml");
        } catch (IOException e) {
            mensajeError("Se detuvo el proceso en el método: salirSistema.");
        }
    }

    public void verificaAcceso() {
        try {
            FacesContext context = FacesContext.getCurrentInstance();
            HttpServletRequest origRequest = (HttpServletRequest) context.getExternalContext().getRequest();
            String contextPath = origRequest.getContextPath();

            if (appSession.getUsuario() == null) {
                FacesContext.getCurrentInstance().getExternalContext().redirect(contextPath + "/login.xhtml");
            }
            /*else{
                Aquí va la validación si se tiene acceso a la página consultada. 
                Si no hay acceso se envía al login. Caso contrario se muestra la página.
            }*/
        } catch (IOException e) {
            mensajeError("Se detuvo el proceso en el método: verificaAcceso.");
        }

    }

    //Método para mostrar mensaje de error en el sistema.
    public void mensajeError(String mensaje) {
        FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_ERROR, "¡Error!", mensaje);
        RequestContext.getCurrentInstance().showMessageInDialog(message);
    }

    //Método para direccionar a una página (login.xhtml)
    public void direccionaPagina(String url) {
        FacesContext context = FacesContext.getCurrentInstance();
        HttpServletRequest origRequest = (HttpServletRequest) context.getExternalContext().getRequest();
        String contextPath = origRequest.getContextPath();
        try {
            FacesContext.getCurrentInstance().getExternalContext().redirect(contextPath + url);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

//****************************************************************************//
//                      Métodos GET y SET para variables                      //
//****************************************************************************//
    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public AppSession getAppSession() {
        return appSession;
    }

    public void setAppSession(AppSession appSession) {
        this.appSession = appSession;
    }
 
}
