package controllers;

import com.sun.mail.smtp.SMTPAddressFailedException;
import dao.BitacoraFacade;
import dao.ConfiguracionesFacade;
import dao.UsuariosFacade;
import entities.Bitacora;
import entities.Configuraciones;
import entities.Usuarios;
import java.io.IOException;
import java.io.Serializable;
import java.util.Date;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;
import javax.mail.MessagingException;
import javax.mail.SendFailedException;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.codec.digest.DigestUtils;
import org.primefaces.PrimeFaces;
import org.primefaces.context.RequestContext;
import util.CorreoBasico;
import util.CorreoPlantilla;
import util.Mensajes;

/* @author Equipo 19-2018 FIA-UES */
@ManagedBean
@ViewScoped
public class SesionBean implements Serializable {

    @EJB
    private BitacoraFacade bitacoraFacade;
    private Bitacora bitacoraNueva = new Bitacora();

    @EJB
    private UsuariosFacade usuariosFacade;

    @EJB
    private ConfiguracionesFacade configuracionFacade;
    private Configuraciones configuracionCorreo = new Configuraciones();

    Mensajes msj = new Mensajes();

//****************************************************************************//
//                                  Variables                                 //
//****************************************************************************//
    private String usuario = "";
    private String password = "";
    private Integer codigo;

    @ManagedProperty(value = "#{appSession}")
    private AppSession appSession;

    public SesionBean() {
    }

//****************************************************************************//
//                                   Métodos                                  //
//****************************************************************************//
    //Método Get para obtener datos de entidad Bitacora
    public BitacoraFacade getBitacoraFacade() {
        return bitacoraFacade;
    }

    //Método Get para obtener datos de entidad Usuarios
    public UsuariosFacade getUsuariosFacade() {
        return usuariosFacade;
    }

    public ConfiguracionesFacade getConfiguracionFacade() {
        return configuracionFacade;
    }

    //Método para mostrar mensaje en login (login.xhtml).
    private static FacesContext getFacesContext() {
        return FacesContext.getCurrentInstance();
    }

    //Método que define la acción por usuario logueado, direciona a página de inicio según usuario.
    public void iniciarSesion() {
        try {
            Usuarios usuarioLogueado = getUsuariosFacade().traeUsuarioLogueado(usuario);
            //System.out.println("UsuarioLogueado: "+usuarioLogueado.getUsuarioUsuario());
            if (usuarioLogueado != null) {
                if (!(usuarioLogueado.getUsuarioEstado())) {
                    mensajeError("El usuario no existe.");
                } else if (!(usuarioLogueado.getUsuarioBloqueado())) {
                    mensajeError("Su cuenta está bloqueada.");
                } else if (usuarioLogueado.getUsuarioContrasenia().equals(DigestUtils.md5Hex(password))) {
                    if (usuarioLogueado.getUsuarioActivacion()) {
                        appSession.setUsuario(usuarioLogueado);
                        guardarBitacora("Inicio sesion.");
                        //System.out.println("UsuarioLogueado: "+usuarioLogueado.getUsuarioUsuario());
                        usuarioLogueado.setUsuarioIntentoFallido(0);
                        //System.out.println("AppSession: "+appSession.getUsuario().getUsuarioUsuario());
                        getUsuariosFacade().edit(usuarioLogueado);
                        direccionaPagina("/dashboard.xhtml");
                    } else {
                        PrimeFaces current = PrimeFaces.current();
                        current.executeScript("PF('activacion').show();");
                    }
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

    public void iniciarSesionNuevo() {
        try {
            Usuarios usuarioLogueado = getUsuariosFacade().traeUsuarioLogueado(usuario);
            if (usuarioLogueado.getUsuarioCodigo().intValue() == codigo) {
                appSession.setUsuario(usuarioLogueado);
                usuarioLogueado.setUsuarioIntentoFallido(0);
                usuarioLogueado.setUsuarioActivacion(Boolean.TRUE);
                getUsuariosFacade().edit(usuarioLogueado);
                direccionaPagina("/dashboard.xhtml");
            } else {
                usuario = "";
                password = "";
                mensajeError("El código ingresado es incorrecto.");
            }
        } catch (Exception e) {
            mensajeError("No se ingresó un código.");
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

    //Método para guardar en la Bitacora.
    public void guardarBitacora(String transaccion) {
        try {
            bitacoraNueva.setBitacoraFechaHora(new Date());
            bitacoraNueva.setBitacoraUsuario(appSession.getUsuario().getUsuarioUsuario());
            bitacoraNueva.setBitacoraTransaccion(transaccion);
            getBitacoraFacade().create(bitacoraNueva);
        } catch (Exception e) {
            mensajeError("Se detuvo el proceso en el método: guardarBitacora.");
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

    public Integer getCodigo() {
        return codigo;
    }

    public void setCodigo(Integer codigo) {
        this.codigo = codigo;
    }

    public Bitacora getBitacoraNueva() {
        return bitacoraNueva;
    }

    public void setBitacoraNueva(Bitacora bitacoraNueva) {
        this.bitacoraNueva = bitacoraNueva;
    }

    public void reenviarCodigo() {
        Usuarios usuarioLogueado = getUsuariosFacade().traeUsuarioLogueado(usuario);
        System.out.println("Usuario " + usuarioLogueado);
        enviarCorreo(usuarioLogueado);
    }

    public void enviarCorreo(Usuarios usuario) {
        configuracionCorreo = getConfiguracionFacade().find(1);
        CorreoPlantilla cp = new CorreoPlantilla();
        try {
            if (configuracionCorreo.getConfiguracionCorreoActivo()) {
                if (!configuracionCorreo.getConfiguracionCorreoCuenta().isEmpty()) {
                    if ((configuracionCorreo.getConfiguracionCorreoEnviadoMes() < configuracionCorreo.getConfiguracionCorreoMes() && configuracionCorreo.getConfiguracionCorreoEnviadoDia() < configuracionCorreo.getConfiguracionCorreoDia())
                            || configuracionCorreo.getConfiguracionCorreoIlimitada()) {

                        CorreoBasico enviarHtml = new CorreoBasico(configuracionCorreo);
                        String body = cp.reenviarMsj(usuario.getUsuarioPrimerNombre(), usuario.getUsuarioPrimerApellido(), usuario.getUsuarioCodigo());
                        enviarHtml.sendMailHTML(usuario.getUsuarioCorreo(), "SMILING CÓDIGO DE SEGURIDAD ", body);
                        msj.mensajeConfirmacion("Mensaje enviado.");
                        return;
                    }
                }
            }
            msj.mensajeError("Mensaje no enviado, pruebe en otro momento.");
        } catch (Exception e) {
            msj.mensajeError("Mensaje no enviado, pruebe en otro momento.");
        }
    }
    
    
}
