package controllers;

import com.sun.mail.smtp.SMTPAddressFailedException;
import dao.BitacoraFacade;
import dao.ConfiguracionesFacade;
import dao.PacientesFacade;
import dao.UsuariosFacade;
import entities.Bitacora;
import entities.Configuraciones;
import entities.Pacientes;
import entities.Roles;
import entities.Submenus;
import entities.Usuarios;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import javax.inject.Named;
import javax.enterprise.context.SessionScoped;
import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.ViewScoped;
import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;
import javax.mail.MessagingException;
import javax.mail.SendFailedException;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.codec.digest.DigestUtils;
import org.primefaces.PrimeFaces;
import org.primefaces.context.RequestContext;
import org.primefaces.model.UploadedFile;
import static org.springframework.util.FileCopyUtils.BUFFER_SIZE;
import util.CorreoBasico;

@ManagedBean
@ViewScoped
public class HomeBean implements Serializable {

//****************************************************************************//
//                          Declaración de variables                          //
//****************************************************************************//
    
    @EJB
    private BitacoraFacade bitacoraFacade;
    private Bitacora bitacoraNueva = new Bitacora();
    
    @EJB
    private PacientesFacade pacientesFacade;
    private Pacientes pacienteConsultar = new Pacientes();
    
    @EJB
    private ConfiguracionesFacade configuracionFacade;
    private Configuraciones configuracionCorreo = new Configuraciones();
    
    @EJB
    private ConfiguracionesFacade configuracionesFacade;
    private Configuraciones configuracion = new Configuraciones();
    private Configuraciones configuracionEditar = new Configuraciones();

    @EJB
    private UsuariosFacade usuariosFacade;
    private Usuarios usuarioNuevo = new Usuarios();

    private Date fechaSistema = new Date();
    private UploadedFile fileSuperior;
    private UploadedFile fileInferior;
    private UploadedFile fileLogin;

    private Date fechaActual = new Date();
    private Integer expediente;
    private Integer codigo;
    private boolean panel1 = true;
    private boolean panel2 = false;
    private boolean panel3 = false;
    private boolean panel4 = false;
    
    private String valorContra;

    public String getValorContra() {
        return valorContra;
    }

    public void setValorContra(String valorContra) {
        this.valorContra = valorContra;
    }
    
    //Session
    @ManagedProperty(value = "#{appSession}")
    private AppSession appSession;
    
    public HomeBean() {
    }

//****************************************************************************//
//                  Métodos para obtener listas por entidades                 //
//****************************************************************************//
    public List<Usuarios> todosUsuarios() {
        return getUsuariosFacade().findAll();
    }

//****************************************************************************//
//                 Métodos Get para obtener datos de entidades                //
//****************************************************************************//
    public ConfiguracionesFacade getConfiguracionesFacade() {
        return configuracionesFacade;
    }

    public UsuariosFacade getUsuariosFacade() {
        return usuariosFacade;
    }

    public BitacoraFacade getBitacoraFacade() {
        return bitacoraFacade;
    }

//****************************************************************************//
//                             Métodos Get y SET                              //
//****************************************************************************//
    
    public Bitacora getBitacoraNueva() {
        return bitacoraNueva;
    }
    public void setBitacoraNueva(Bitacora bitacoraNueva) {
        this.bitacoraNueva = bitacoraNueva;
    }

    public Pacientes getPacienteConsultar() {
        return pacienteConsultar;
    }
    public void setPacienteConsultar(Pacientes pacienteConsultar) {
        this.pacienteConsultar = pacienteConsultar;
    }

    public PacientesFacade getPacientesFacade() {
        return pacientesFacade;
    }

    public boolean isPanel1() {
        return panel1;
    }

    public void setPanel1(boolean panel1) {
        this.panel1 = panel1;
    }

    public boolean isPanel2() {
        return panel2;
    }

    public void setPanel2(boolean panel2) {
        this.panel2 = panel2;
    }

    public boolean isPanel3() {
        return panel3;
    }

    public void setPanel3(boolean panel3) {
        this.panel3 = panel3;
    }

    public boolean isPanel4() {
        return panel4;
    }

    public void setPanel4(boolean panel4) {
        this.panel4 = panel4;
    }

    public Integer getExpediente() {
        return expediente;
    }

    public void setExpediente(Integer expediente) {
        this.expediente = expediente;
    }

    public Integer getCodigo() {
        return codigo;
    }

    public void setCodigo(Integer codigo) {
        this.codigo = codigo;
    }

    public Configuraciones getConfiguracionCorreo() {
        return configuracionCorreo;
    }
    public void setConfiguracionCorreo(Configuraciones configuracionCorreo) {
        this.configuracionCorreo = configuracionCorreo;
    }

    public ConfiguracionesFacade getConfiguracionFacade() {
        return configuracionFacade;
    }
            
    public Usuarios getUsuarioNuevo() {
        return usuarioNuevo;
    }
    public void setUsuarioNuevo(Usuarios usuarioNuevo) {
        this.usuarioNuevo = usuarioNuevo;
    }

    public Date getFechaSistema() {
        return fechaSistema;
    }
    public void setFechaSistema(Date fechaSistema) {
        this.fechaSistema = fechaSistema;
    }

    public Configuraciones getConfiguracion() {
        return getConfiguracionesFacade().find(1);
    }
    public void setConfiguracion(Configuraciones configuracion) {
        this.configuracion = configuracion;
    }

    public Configuraciones getConfiguracionEditar() {
        return configuracionEditar;
    }
    public void setConfiguracionEditar(Configuraciones configuracionEditar) {
        this.configuracionEditar = configuracionEditar;
    }

    public UploadedFile getFileSuperior() {
        return fileSuperior;
    }
    public void setFileSuperior(UploadedFile fileSuperior) {
        this.fileSuperior = fileSuperior;
    }

    public UploadedFile getFileInferior() {
        return fileInferior;
    }
    public void setFileInferior(UploadedFile fileInferior) {
        this.fileInferior = fileInferior;
    }

    public UploadedFile getFileLogin() {
        return fileLogin;
    }
    public void setFileLogin(UploadedFile fileLogin) {
        this.fileLogin = fileLogin;
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
    
    //Método que busca el expediente de paciente y envia código al correo electrónico.
    public void buscaExpediente(){
        if(expediente.longValue() != 0){
            pacienteConsultar = getPacientesFacade().find(expediente);
        }
        if(pacienteConsultar == null){
            panel1 = false;
            panel2 = false;
            panel3 = true;
            panel4 = false;
            expediente = null;
        }
        else{
            panel1 = false;
            panel2 = true;
            panel3 = false;
            panel4 = false;
            String correo = pacienteConsultar.getPacienteCorreo();
            int cod = pacienteConsultar.getPacienteCodigo();
            //enviarCorreo(correo, cod);
        }
    }
    
    //Método que busca verifica si el código ingresao por el usuario corresponde al del paciente.
    public void buscaCodigo(){
        if(codigo.longValue() != 0){
            if(codigo.equals(pacienteConsultar.getPacienteCodigo())){
                direccionaPagina("/registro_con_expediente_usuario.xhtml");
            } else{
                panel1 = false;
                panel2 = false;
                panel3 = false;
                panel4 = true;
                codigo = null;
            }
        }
    }
        
    // Método para extraer el teléfono de los pacientes (registro_con_expediente_usuario.xhtml)
    public String telefonoPaciente() {
        if(pacienteConsultar.getPacienteTelefonoMovil() != null){
            return pacienteConsultar.getPacienteTelefonoMovil();
        }
        if(pacienteConsultar.getPacienteTelefonoCasa() != null){
            return pacienteConsultar.getPacienteTelefonoCasa();
        }
        if(pacienteConsultar.getPacienteTelefonoOficina() != null){
            return pacienteConsultar.getPacienteTelefonoOficina();
        }
        return "Sin teléfono";
    }
    
    public void reenviarCodigo(String usuario){
        Usuarios usuarioLogueado = getUsuariosFacade().traeUsuarioLogueado(usuario);
        enviarCorreo(usuarioLogueado);
    } 
    
    public void enviarCorreo(Usuarios usuario) {
        configuracionCorreo = getConfiguracionFacade().find(1);
        try {
            if (configuracionCorreo.getConfiguracionCorreoActivo()) {
                if (!configuracionCorreo.getConfiguracionCorreoCuenta().isEmpty()) {
                    if ((configuracionCorreo.getConfiguracionCorreoEnviadoMes() < configuracionCorreo.getConfiguracionCorreoMes() && configuracionCorreo.getConfiguracionCorreoEnviadoDia() < configuracionCorreo.getConfiguracionCorreoDia())
                            || configuracionCorreo.getConfiguracionCorreoIlimitada()) {

                        CorreoBasico enviarHtml = new CorreoBasico(configuracionCorreo);
                        String body = "<div style=\"margin-top: 0px;\">"
                                + "      <h1 style=\"text-align: center; background: #0B6EAC; color: white\">Clinica Dental Smiling</h1>    "
                                + "    </div>"
                                + "    <div>"
                                + "    Hola " + usuario.getUsuarioPrimerNombre() + " " + usuario.getUsuarioPrimerApellido() + "."
                                + "    <br/> El código para activación de tu cuenta es: "
                                + "          <h2 style=\"text-align: center\">" + usuario.getUsuarioCodigo() + "</h2>"
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
                        enviarHtml.sendMailHTML(usuario.getUsuarioCorreo(), "SMILING CÓDIGO DE SEGURIDAD ", body);
                        mensajeConfirmacion("Mensaje enviado.");
                    } else {
                        mensajeError("Limite de envios superados.");
                    }
                } else {
                    mensajeError("Verifique la cuenta del correo.");
                }
            } else {
                mensajeError("Correo desactivado.");
            }
        } catch (SMTPAddressFailedException me) {
            mensajeError("Mensaje no enviado");
        } catch (SendFailedException me) {
            mensajeError("Mensaje no enviado");
        } catch (MessagingException me) {
            mensajeError("Mensaje no enviado");
        } catch (Exception e) {
            mensajeError("Mensaje no enviado");
        }
    }
    
    //Método para direccionar a una página (registro_con_expediente.xhtml)
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
    
    public void guardarUsuario() {
        try{
            for (Usuarios usuario : todosUsuarios()) {
                if (usuarioNuevo.getUsuarioUsuario().equals(usuario.getUsuarioUsuario())) {
                    mensajeError("El nombre de usuario no está disponible");
                    usuarioNuevo.setUsuarioUsuario("");
                    return;
                }
            }
            usuarioNuevo.setUsuarioCodigo((int) (Math.random() * 999) + 999);
            usuarioNuevo.setUsuarioFechaCreacion(fechaSistema);
            usuarioNuevo.setRolId(new Roles(5));
            usuarioNuevo.setUsuarioIntentoFallido(0);
            usuarioNuevo.setUsuarioEstado(Boolean.TRUE);
            usuarioNuevo.setUsuarioBloqueado(Boolean.TRUE);
            usuarioNuevo.setUsuarioActivacion(Boolean.FALSE);
            usuarioNuevo.setUsuarioContrasenia(DigestUtils.md5Hex(usuarioNuevo.getUsuarioContrasenia()));
            enviarCorreo(usuarioNuevo);
            getUsuariosFacade().create(usuarioNuevo);
                PrimeFaces current = PrimeFaces.current();
                current.executeScript("PF('guardado').show();");
            //mensajeConfirmacion("Su usuario ha sido creado, se ha enviado un código de seguridad para validar su cuenta al correo: " + usuarioNuevo.getUsuarioCorreo());
            usuarioNuevo = new Usuarios();
        } catch (Exception e) {
            mensajeError("Se detuvo el proceso en el método: guardarUsuario.");
        }
    }

    public void mensajeError(String mensaje) {
        FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_ERROR, "¡Error!", mensaje);
        RequestContext.getCurrentInstance().showMessageInDialog(message);
    }

    public void editarHome() {
        getConfiguracionesFacade().edit(configuracionEditar);
        mensajeConfirmacion("La página de inicio se ha actualizado.");
    }

    //Método para verificar si ya existe el archivo a subir (home_parametros.xhtml).
    public void existeArchivoEditar() {
        try {
            if ((fileSuperior != null) || (fileInferior != null) || (fileLogin != null)) {

                if (fileSuperior != null) {
                    ExternalContext dir = FacesContext.getCurrentInstance().getExternalContext();
                    String pathRelativo = "/images/configuraciones/";
                    String directorio = dir.getRealPath(pathRelativo);
                    //FacesContext cty = FacesContext.getCurrentInstance();
                    //String directorio = cty.getExternalContext().getInitParameter("directory_path_configurations");
                    File archivo1 = new File(directorio + "/" + getFileSuperior().getFileName() + "/");
                    if (archivo1.exists()) {
                        FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_WARN, "Mensaje", "El archivo seleccionado ya se está utilizando.");
                        RequestContext.getCurrentInstance().showMessageInDialog(message);
                    } else {
                        eliminarArchivoSuperior();
                        subeArchivoEditarSuperior(fileSuperior);
                    }
                }
                
                if (fileInferior != null) {
                    ExternalContext dir = FacesContext.getCurrentInstance().getExternalContext();
                    String pathRelativo = "/images/configuraciones/";
                    String directorio = dir.getRealPath(pathRelativo);
                    //FacesContext cty = FacesContext.getCurrentInstance();
                    //String directorio = cty.getExternalContext().getInitParameter("directory_path_configurations");
                    File archivo1 = new File(directorio + "/" + getFileInferior().getFileName() + "/");
                    if (archivo1.exists()) {
                        FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_WARN, "Mensaje", "El archivo seleccionado ya se está utilizando.");
                        RequestContext.getCurrentInstance().showMessageInDialog(message);
                    } else {
                        eliminarArchivoInferior();
                        subeArchivoEditarInferior(fileInferior);
                    }
                }
                
                if (fileLogin != null) {
                    ExternalContext dir = FacesContext.getCurrentInstance().getExternalContext();
                    String pathRelativo = "/images/configuraciones/";
                    String directorio = dir.getRealPath(pathRelativo);
                    //FacesContext cty = FacesContext.getCurrentInstance();
                    //String directorio = cty.getExternalContext().getInitParameter("directory_path_configurations");
                    File archivo1 = new File(directorio + "/" + getFileLogin().getFileName() + "/");
                    if (archivo1.exists()) {
                        FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_WARN, "Mensaje", "El archivo seleccionado ya se está utilizando.");
                        RequestContext.getCurrentInstance().showMessageInDialog(message);
                    } else {
                        eliminarArchivoLogin();
                        subeArchivoEditarLogin(fileLogin);
                    }
                }
                
                } else {
                    editarHome();
                    guardarBitacora("Actualizó la información del home.");
                }
            }catch (Exception e) {
            mensajeError("Se detuvo el proceso en el método: existeArchivoEditar.");
        }
        }
    
    //Método para eliminar un archivo (home_parametros.xhtml).
    public void eliminarArchivoSuperior() throws FileNotFoundException {
        try {
            ExternalContext dir = FacesContext.getCurrentInstance().getExternalContext();
            String pathRelativo = "/images/configuraciones/";
            String directorio = dir.getRealPath(pathRelativo);
            //FacesContext cty = FacesContext.getCurrentInstance();
            //String directorio = cty.getExternalContext().getInitParameter("directory_path_configurations");
            File archivoEliminar = new File(directorio + "/" + configuracionEditar.getConfiguracionImagenSuperior());
            System.out.println("Documento a eliminar: " + archivoEliminar);
            if (archivoEliminar.exists()) {
                System.out.println("El archivo existe.");
                if (archivoEliminar.delete()) {
                    System.out.println("El archivo se eliminó.");
                }
            } else {
                System.out.println("El archivo no existe.");
            }
        } catch (Exception e) {
            mensajeError("Se detuvo el proceso en el método: eliminarArchivoSuperior.");
        }
    }
    
    //Método para eliminar un archivo (home_parametros.xhtml).
    public void eliminarArchivoInferior() throws FileNotFoundException {
        try {
            ExternalContext dir = FacesContext.getCurrentInstance().getExternalContext();
            String pathRelativo = "/images/configuraciones/";
            String directorio = dir.getRealPath(pathRelativo);
            //FacesContext cty = FacesContext.getCurrentInstance();
            //String directorio = cty.getExternalContext().getInitParameter("directory_path_configurations");
            File archivoEliminar = new File(directorio + "/" + configuracionEditar.getConfiguracionImagenInferior());
            System.out.println("Documento a eliminar: " + archivoEliminar);
            if (archivoEliminar.exists()) {
                System.out.println("El archivo existe.");
                if (archivoEliminar.delete()) {
                    System.out.println("El archivo se eliminó.");
                }
            } else {
                System.out.println("El archivo no existe.");
            }
        } catch (Exception e) {
            mensajeError("Se detuvo el proceso en el método: eliminarArchivoInferior.");
        }
    }
    
    //Método para eliminar un archivo (home_parametros.xhtml).
    public void eliminarArchivoLogin() throws FileNotFoundException {
        try {
            ExternalContext dir = FacesContext.getCurrentInstance().getExternalContext();
            String pathRelativo = "/images/configuraciones/";
            String directorio = dir.getRealPath(pathRelativo);
            //FacesContext cty = FacesContext.getCurrentInstance();
            //String directorio = cty.getExternalContext().getInitParameter("directory_path_configurations");
            File archivoEliminar = new File(directorio + "/" + configuracionEditar.getConfiguracionImagenLogin());
            System.out.println("Documento a eliminar: " + archivoEliminar);
            if (archivoEliminar.exists()) {
                System.out.println("El archivo existe.");
                if (archivoEliminar.delete()) {
                    System.out.println("El archivo se eliminó.");
                }
            } else {
                System.out.println("El archivo no existe.");
            }
        } catch (Exception e) {
            mensajeError("Se detuvo el proceso en el método: eliminarArchivoLogin.");
        }
    }

    //Método que guarda el archivo seleccionado (home_parametros.xhtml).
    public void subeArchivoEditarSuperior(UploadedFile file) throws InterruptedException {
        ExternalContext dir = FacesContext.getCurrentInstance().getExternalContext();
        String pathRelativo = "/images/configuraciones/";
        String directorioArchivo = dir.getRealPath(pathRelativo);
        //FacesContext ctx = FacesContext.getCurrentInstance();
        //String directorioArchivo = ctx.getExternalContext().getInitParameter("directory_path_configurations");
        String nombreArchivo = getFileSuperior().getFileName();
        int punto = nombreArchivo.lastIndexOf(".");
        String extension = nombreArchivo.substring(punto + 1, nombreArchivo.length());
        File archivoImagen = new File(directorioArchivo + "/" + getFileSuperior().getFileName());
        try {
            FileOutputStream fileOutputStream = new FileOutputStream(archivoImagen);
            byte[] buffer = new byte[BUFFER_SIZE];
            int bulk;
            InputStream inputStream = getFileSuperior().getInputstream();
            while (true) {
                bulk = inputStream.read(buffer);
                if (bulk < 0) {
                    break;
                }
                fileOutputStream.write(buffer, 0, bulk);
                fileOutputStream.flush();
            }
            fileOutputStream.close();
            inputStream.close();
            configuracionEditar.setConfiguracionImagenSuperior(getFileSuperior().getFileName());
            getConfiguracionesFacade().edit(configuracionEditar);
            Thread.sleep(6000);
            editarHome();
            guardarBitacora("Actualizó el banner superior del home.");
        } catch (IOException e) {
            mensajeError("Se detuvo el proceso en el método: subeArchivoEditarSuperior.");
        }
    }

    public void subeArchivoEditarInferior(UploadedFile file) throws InterruptedException {
        ExternalContext dir = FacesContext.getCurrentInstance().getExternalContext();
        String pathRelativo = "/images/configuraciones/";
        String directorioArchivo = dir.getRealPath(pathRelativo);
        //FacesContext ctx = FacesContext.getCurrentInstance();
        //String directorioArchivo = ctx.getExternalContext().getInitParameter("directory_path_configurations");
        String nombreArchivo = getFileInferior().getFileName();
        int punto = nombreArchivo.lastIndexOf(".");
        String extension = nombreArchivo.substring(punto + 1, nombreArchivo.length());
        File archivoImagen = new File(directorioArchivo + "/" + getFileInferior().getFileName());
        try {
            FileOutputStream fileOutputStream = new FileOutputStream(archivoImagen);
            byte[] buffer = new byte[BUFFER_SIZE];
            int bulk;
            InputStream inputStream = getFileInferior().getInputstream();
            while (true) {
                bulk = inputStream.read(buffer);
                if (bulk < 0) {
                    break;
                }
                fileOutputStream.write(buffer, 0, bulk);
                fileOutputStream.flush();
            }
            fileOutputStream.close();
            inputStream.close();
            configuracionEditar.setConfiguracionImagenInferior(getFileInferior().getFileName());
            getConfiguracionesFacade().edit(configuracionEditar);
            Thread.sleep(6000);
            editarHome();
            guardarBitacora("Actualizó el banner inferior del home.");
        } catch (IOException e) {
            mensajeError("Se detuvo el proceso en el método: subeArchivoEditarInferior.");
        }
    }
    public void subeArchivoEditarLogin(UploadedFile file) throws InterruptedException {
        ExternalContext dir = FacesContext.getCurrentInstance().getExternalContext();
        String pathRelativo = "/images/configuraciones/";
        String directorioArchivo = dir.getRealPath(pathRelativo);
        //FacesContext ctx = FacesContext.getCurrentInstance();
        //String directorioArchivo = ctx.getExternalContext().getInitParameter("directory_path_configurations");
        String nombreArchivo = getFileLogin().getFileName();
        int punto = nombreArchivo.lastIndexOf(".");
        String extension = nombreArchivo.substring(punto + 1, nombreArchivo.length());
        File archivoImagen = new File(directorioArchivo + "/" + getFileLogin().getFileName());
        try {
            FileOutputStream fileOutputStream = new FileOutputStream(archivoImagen);
            byte[] buffer = new byte[BUFFER_SIZE];
            int bulk;
            InputStream inputStream = getFileLogin().getInputstream();
            while (true) {
                bulk = inputStream.read(buffer);
                if (bulk < 0) {
                    break;
                }
                fileOutputStream.write(buffer, 0, bulk);
                fileOutputStream.flush();
            }
            fileOutputStream.close();
            inputStream.close();
            configuracionEditar.setConfiguracionImagenLogin(getFileLogin().getFileName());
            getConfiguracionesFacade().edit(configuracionEditar);
            Thread.sleep(6000);
            editarHome();
            guardarBitacora("Actualizó el banner del login.");
        } catch (IOException e) {
            mensajeError("Se detuvo el proceso en el método: subeArchivoEditarLogin.");
        }
    }
    
    //Método para mostrar mensaje de guardado/actualizado/eliminado.
    public void mensajeConfirmacion(String mensaje) {
        FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_INFO, "Mensaje", mensaje);
        RequestContext.getCurrentInstance().showMessageInDialog(message);
    }

    public void cargaConfiguracion() {
        configuracionEditar = getConfiguracionesFacade().find(1);
    }

    //Método para verificar si el usuario tiene acceso a la página consultada. (Todas las páginas)
    public void verificaAcceso(int pagina){
        //System.out.println("Entra al método del usuario.");
        boolean acceso = false;
        try{
            FacesContext context = FacesContext.getCurrentInstance();
            HttpServletRequest origRequest = (HttpServletRequest) context.getExternalContext().getRequest();
            String contextPath = origRequest.getContextPath();

            if(appSession.getUsuario() == null){
                FacesContext.getCurrentInstance().getExternalContext().redirect(contextPath+"/login.xhtml");
            }
            else{
                if(!(appSession.getUsuario().getRolId().getSubmenusList().isEmpty())){
                    for (Submenus submenu : todosSubmenusDisponibles()){
                        //System.out.println("Submenu: " + submenu.getSumbenuNombre());
                        if(submenu.getSubmenuId() == pagina){
                            acceso = true;
                        }
                    }
                }
            }
            if(!acceso){
                FacesContext.getCurrentInstance().getExternalContext().redirect(contextPath+"/login.xhtml");
            }
        } catch(IOException e){
            System.out.println("La variable appSession es nula.");
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
    
    public List<Submenus> todosSubmenusDisponibles(){
        return appSession.getUsuario().getRolId().getSubmenusList();
    }
    
}
