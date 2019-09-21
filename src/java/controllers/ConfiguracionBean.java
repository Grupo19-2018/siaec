package controllers;

import com.sun.mail.smtp.SMTPAddressFailedException;
import dao.BitacoraFacade;
import dao.ConfiguracionesFacade;
import entities.Bitacora;
import entities.Configuraciones;
import java.io.Serializable;
import java.util.Date;
import javax.ejb.EJB;
import javax.enterprise.context.SessionScoped;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedProperty;
import javax.inject.Named;
import javax.mail.MessagingException;
import javax.mail.SendFailedException;
import org.primefaces.context.RequestContext;
import util.CorreoBasico;

@Named(value = "configuracionBean")
@SessionScoped
public class ConfiguracionBean implements Serializable {

//****************************************************************************//
//                          Declaración de variables                          //
//****************************************************************************//
    @EJB
    private BitacoraFacade bitacoraFacade;
    private Bitacora bitacoraNueva = new Bitacora();
    
    @EJB
    private ConfiguracionesFacade configuracionFacade;
    private Configuraciones configuracionEditar = new Configuraciones();

    private String destinatario;
    private String asunto;
    private String cuerpo;
    private Date fechaActual = new Date();

    //Session
    @ManagedProperty(value = "#{appSession}")
    private AppSession appSession;
    
//****************************************************************************//
//                 Métodos Get para obtener datos de entidades                //
//****************************************************************************//
    public ConfiguracionesFacade getConfiguracionFacade() {
        return configuracionFacade;
    }

//****************************************************************************//
//                             Métodos Get y SET                              //
//****************************************************************************//
    public BitacoraFacade getBitacoraFacade() {
        return bitacoraFacade;
    }
    
    public Configuraciones getConfiguracionEditar() {
        return configuracionEditar;
    }

    public void setConfiguracionEditar(Configuraciones configuracionEditar) {
        this.configuracionEditar = configuracionEditar;
    }

    public String getDestinatario() {
        return destinatario;
    }

    public void setDestinatario(String destinatario) {
        this.destinatario = destinatario;
    }

    public String getAsunto() {
        return asunto;
    }

    public void setAsunto(String asunto) {
        this.asunto = asunto;
    }

    public String getCuerpo() {
        return cuerpo;
    }

    public void setCuerpo(String cuerpo) {
        this.cuerpo = cuerpo;
    }

    public Bitacora getBitacoraNueva() {
        return bitacoraNueva;
    }
    public void setBitacoraNueva(Bitacora bitacoraNueva) {
        this.bitacoraNueva = bitacoraNueva;
    }

    public AppSession getAppSession() {
        return appSession;
    }
    public void setAppSession(AppSession appSession) {
        this.appSession = appSession;
    }
    
    public Date getFechaActual() {
        return fechaActual;
    }
    public void setFechaActual(Date fechaActual) {
        this.fechaActual = fechaActual;
    }
    
//****************************************************************************//
//                                  Métodos                                   //
//****************************************************************************//
    //Metodo para cargar la configuracion, utilizado en configuracion_Corre.xhtml
    public void cargarConfiguracion() {
        configuracionEditar = getConfiguracionFacade().find(1);
        if(configuracionEditar==null){
            Configuraciones temp = new Configuraciones();
            temp.setConfiguracionTiempoSesion(30);
            temp.setConfiguracionCorreoHost("");
            temp.setConfiguracionCorreoHost("");
            temp.setConfiguracionCorreoPort(0);
            temp.setConfiguracionCorreoRequerido(Boolean.FALSE);
            temp.setConfiguracionCorreoEncryptacion("sin");
            temp.setConfiguracionCorreoCuenta("");
            temp.setConfiguracionCorreoContrasenya("");
            temp.setConfiguracionCorreoIlimitada(Boolean.FALSE);
            temp.setConfiguracionCorreoMes(100);
            temp.setConfiguracionCorreoDia(1);
            temp.setConfiguracionCorreoEnviadoDia(0);
            temp.setConfiguracionCorreoEnviadoMes(0);
            temp.setConfiguracionCorreoActivo(Boolean.FALSE);
            temp.setConfiguracionPromocionCumpleanyos(Boolean.FALSE);
            temp.setConfiguracionPromocionGeneral(Boolean.FALSE);
            getConfiguracionFacade().create(temp);
            configuracionEditar = getConfiguracionFacade().find(1);
        }
    }

    public void guardarConfiguracion() {
        try {
            getConfiguracionFacade().edit(configuracionEditar);
            guardarBitacora("Actualizó la configuración para envío de correos.");
            mensajeGuardado("La configuración ha sido guardada.");
        } catch (Exception e) {
            mensajeGuardado("Error al guardar la configuracion");
        }
    }

    //Método para guardar en la Bitacora.
    public void guardarBitacora(String transaccion) {
        try {
            System.out.println("entra al metodo bitacora");
            bitacoraNueva.setBitacoraFechaHora(new Date());
            System.out.println("Fecha Actual: " + fechaActual);
            bitacoraNueva.setBitacoraUsuario(appSession.getUsuario().getUsuarioUsuario());
            System.out.println("Usuario: " + appSession.getUsuario().getUsuarioUsuario());
            bitacoraNueva.setBitacoraTransaccion(transaccion);
            System.out.println("Transaccion: " + transaccion);
            getBitacoraFacade().create(bitacoraNueva);
            System.out.println("Bitacora Guaradda");
        } catch (Exception e) {
            mensajeError("Se detuvo el proceso en el método: guardarBitacora.");
        }
    }
    
    //Realizado para ver el funcionamiento del correo, "configuracion_correo.xhtml" 
    public void testConexion() {
        try {
            CorreoBasico test = new CorreoBasico(configuracionEditar);
            String destinatario = configuracionEditar.getConfiguracionCorreoCuenta();
            test.sendMail(destinatario, "Test de conexion", "Prueba de conexion");
            mensaje("Revise el buzón de entrada de: " + destinatario, "Test de correo");

        } catch (MessagingException e) {
            mensaje("Revise la configuración actual", "Test de correo");
        } catch (Exception e) {
            mensaje("Revise la configuración actual", "Test de correo");
        }

    }

    //Se enviara informacion con formato de html
    public void enviarCorreoHtml() {
        try {
            if (configuracionEditar.getConfiguracionCorreoActivo()) {
                if (!configuracionEditar.getConfiguracionCorreoCuenta().isEmpty()) {
                    if ((configuracionEditar.getConfiguracionCorreoEnviadoMes() < configuracionEditar.getConfiguracionCorreoMes() && configuracionEditar.getConfiguracionCorreoEnviadoDia() < configuracionEditar.getConfiguracionCorreoDia())
                            || configuracionEditar.getConfiguracionCorreoIlimitada()) {

                        CorreoBasico enviarHtml = new CorreoBasico(configuracionEditar);
                        String body = "<div style=\"margin-top: 0px; margin-bottom: 35px;\">"
                                + "      <h1 style=\"text-align: center; background: #0B6EAC; color: white\">Clinica Dental Smiling</h1>    "
                                + "    </div>"
                                + "    <div style=\"margin-top: 10px; margin-bottom: 60px;\">"
                                + "      <p>"
                                + "          <br/>" + cuerpo + "<br/>"
                                + "      </p>"
                                + "    </div>"
                                + "    <div style=\"background-color:#0B6EAC; color: white;\">"
                                + "      <div style=\"text-align: right\">"
                                + "         <p>Horario de lunes a viernes de 8:00 a.m. a 6:00 p.m.<br/>"
                                + "            Sabádo de 8:00 a.m. a 2:30 p.m. <br/>"
                                + "            Diagonal Dr Arturo Romero edificio 444 local # 4 Edificio del Subway . Col medica.<br/>"
                                + "         </p>"
                                + "      </div>"
                                + "         <div style=\"padding:5px; text-align: center; border-top: 1px double white\">"
                                + "              © 2019 <b>SIAEC</b> Todos los Derechos Reservados."
                                + "         </div> "
                                + "      </div>";
                        enviarHtml.sendMailHTML(destinatario, asunto, body);
                        mensaje("Mensaje enviado.", "Correo");
                    } else {
                        mensaje("Limite de envios superados.", "Correo");
                    }
                } else {
                    mensaje("Verifique la cuenta del correo.", "Correo");
                }
            } else {
                mensaje("Correo desactivado.", "Correo");
            }
        } catch (SMTPAddressFailedException me) {
            mensaje("Mensaje no enviado", "Correo");
        } catch (SendFailedException me) {
            mensaje("Mensaje no enviado", "Correo");
        } catch (MessagingException me) {
            mensaje("Mensaje no enviado", "Correo");
        } catch (Exception e) {
            mensaje("Mensaje no enviado.", "Correo");
        }

    }

    //Método para mostrar mensaje de guardado/actualizado.
    public void mensajeGuardado(String mensaje) {
        FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_INFO, "Mensaje", mensaje);
        RequestContext.getCurrentInstance().showMessageInDialog(message);
    }

    public void mensaje(String mensaje, String asunto) {
        FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_INFO, asunto, mensaje);
        RequestContext.getCurrentInstance().showMessageInDialog(message);
    }

    public String correoVerificar(String correo){
        if( !correo.isEmpty()){
            return correo;
        }else{
            return "Verificar correo.";
        }
    }
    
    public void activarDesactivarPromocionesCumpleanyos(boolean cumpleanyos){
        try {
            configuracionEditar = getConfiguracionFacade().find(1);
            configuracionEditar.setConfiguracionPromocionCumpleanyos(cumpleanyos);
            getConfiguracionFacade().edit(configuracionEditar);
        } catch (Exception e) {
        }
    }
    
    public void activarDesactivarPromocionesGenerales(boolean general){
        try {
            configuracionEditar = getConfiguracionFacade().find(1);
            configuracionEditar.setConfiguracionPromocionGeneral(general);
            getConfiguracionFacade().edit(configuracionEditar);
        } catch (Exception e) {
        }
    }

    public void mensajeError(String mensaje) {
        FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_ERROR, "¡Error!", mensaje);
        RequestContext.getCurrentInstance().showMessageInDialog(message);
    }

}
