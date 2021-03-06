package controllers;

import dao.BitacoraFacade;
import dao.PromocionesFacade;
import entities.Bitacora;
import entities.Promociones;
import entities.Submenus;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
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
import javax.servlet.http.HttpServletRequest;
import org.primefaces.context.RequestContext;
import org.primefaces.event.FileUploadEvent;
import org.primefaces.model.UploadedFile;
import static org.springframework.util.FileCopyUtils.BUFFER_SIZE;

@ManagedBean
@ViewScoped
public class PromocionesBean implements Serializable {

//****************************************************************************//
//                          Declaración de variables                          //
//****************************************************************************//
    
    @EJB
    private BitacoraFacade bitacoraFacade;
    private Bitacora bitacoraNueva = new Bitacora();

    @EJB
    private PromocionesFacade promocionesFacade;
    private Promociones promocionNuevo = new Promociones();
    private Promociones promocionConsultar = new Promociones();
    private Promociones promocionEditar = new Promociones();

    private UploadedFile file;
    private Date fechaSistema = new Date();
    private int promocionId;

    //Session
    @ManagedProperty(value = "#{appSession}")
    private AppSession appSession;

    public PromocionesBean() {
    }

//****************************************************************************//
//                  Métodos para obtener listas por entidades                 //
//****************************************************************************//
    
    public List<Promociones> todasPromocionesDisponibles() {
        return getPromocionesFacade().promocionesDisponibles(Boolean.TRUE);
    }

    public List<Promociones> todasPromocionesActivas() {
        return getPromocionesFacade().promocionesActivas(Boolean.TRUE);
    }

    public List<Submenus> todosSubmenusDisponibles() {
        return appSession.getUsuario().getRolId().getSubmenusList();
    }

//****************************************************************************//
//                 Métodos Get para obtener datos de entidades                //
//****************************************************************************//
    
    public BitacoraFacade getBitacoraFacade() {
        return bitacoraFacade;
    }

    public PromocionesFacade getPromocionesFacade() {
        return promocionesFacade;
    }

//****************************************************************************//
//                             Métodos Get y SET                              //
//****************************************************************************//
    
    public Promociones getPromocionNuevo() {
        return promocionNuevo;
    }
    public void setPromocionNuevo(Promociones promocionNuevo) {
        this.promocionNuevo = promocionNuevo;
    }

    public Promociones getPromocionConsultar() {
        return promocionConsultar;
    }
    public void setPromocionConsultar(Promociones promocionConsultar) {
        this.promocionConsultar = promocionConsultar;
    }

    public Promociones getPromocionEditar() {
        return promocionEditar;
    }
    public void setPromocionEditar(Promociones promocionEditar) {
        this.promocionEditar = promocionEditar;
    }

    public UploadedFile getFile() {
        return file;
    }
    public void setFile(UploadedFile file) {
        this.file = file;
    }

    public Date getFechaSistema() {
        return fechaSistema;
    }
    public void setFechaSistema(Date fechaSistema) {
        this.fechaSistema = fechaSistema;
    }

    public int getPromocionId() {
        return promocionId;
    }
    public void setPromocionId(int promocionId) {
        this.promocionId = promocionId;
    }

    public AppSession getAppSession() {
        return appSession;
    }
    public void setAppSession(AppSession appSession) {
        this.appSession = appSession;
    }

    public Bitacora getBitacoraNueva() {
        return bitacoraNueva;
    }
    public void setBitacoraNueva(Bitacora bitacoraNueva) {
        this.bitacoraNueva = bitacoraNueva;
    }
    
//****************************************************************************//
//                                  Métodos                                   //
//****************************************************************************//
    
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

    //Método para inicializar los valores de fechas para promoción de tipo cumpleaños (promocion_nuevo.xhtml).
    public void inicializaFechasNuevo() {
        try {
            if (promocionNuevo.getPromocionTipo() == 2) {
                Date fechaInicio = new Date();
                Date fechaFin = new Date();
                fechaInicio.setMonth(0);
                fechaInicio.setDate(1);
                fechaFin.setMonth(11);
                fechaFin.setDate(31);
                promocionNuevo.setPromocionInicio(fechaInicio);
                promocionNuevo.setPromocionFin(fechaFin);
            } else {
                promocionNuevo.setPromocionInicio(null);
                promocionNuevo.setPromocionFin(null);
            }
        } catch (Exception e) {
            mensajeError("Se detuvo el proceso en el método: inicializaFechasNuevo.");
        }
    }

    //Método para verificar si ya existe el archivo a subir (promocion_nuevo.xhtml).
    public void existeArchivoNuevo() {
        try {
            ExternalContext dir = FacesContext.getCurrentInstance().getExternalContext();
            String pathRelativo = "/images/promociones/";
            String directorio = dir.getRealPath(pathRelativo);
            File archivo1 = new File(directorio + "/" + getFile().getFileName() + "/");
            if (archivo1.exists()) {
                FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_WARN, "Mensaje", "El archivo seleccionado ya existe para una promoción.");
                RequestContext.getCurrentInstance().showMessageInDialog(message);
            } else {
                guardarPromocion();
            }
        } catch (Exception e) {
            mensajeError("Se detuvo el proceso en el método: existeArchivoNuevo.");
            System.err.println(e);
        }
    }

    //Método para guardar una Promoción (promocion_nuevo.xhtml).
    public void guardarPromocion() {
        try {
            for (Promociones promocion : todasPromocionesDisponibles()) {
                if (promocion.getPromocionNombre().equalsIgnoreCase(promocionNuevo.getPromocionNombre())) {
                    mensajeError("La promoción ya existe.");
                    return;
                }
            }
            promocionNuevo.setPromocionEstado(Boolean.TRUE);
            promocionNuevo.setPromocionUsuarioCreacion(appSession.getUsuario().getUsuarioUsuario());
            promocionNuevo.setPromocionFechaCreacion(new Date());
            promocionNuevo.setPromocionActiva(Boolean.TRUE);
            promocionNuevo.setPromocionCorreoLimitadoEspera(0);
            getPromocionesFacade().create(promocionNuevo);
            subeArchivoNuevo(file);
            guardarBitacora("Registró una promoción ("+promocionNuevo.getPromocionNombre()+").");
            promocionNuevo = new Promociones();
        } catch (Exception e) {
            mensajeError("Se detuvo el proceso en el método: guardarPromocion.");
        }
    }

    //Metodo para el handlefileupload
    //Estado: Prueba
    //Fecha: 04/marzo/2019
    public void handleFileUpload(FileUploadEvent event) {
        UploadedFile sfile = event.getFile();
        System.out.println("Se ejecuta con ");
        System.out.println("Archivo " + sfile.getFileName());
        System.out.println("Ruta " + sfile.getContentType());
        System.out.println("Contenido" + sfile.getContents());

        ExternalContext dire = FacesContext.getCurrentInstance().getExternalContext();
        String pathRelativo = "/images/promociones/";
        String directorioArchivo = dire.getRealPath(pathRelativo);
        //FacesContext ctx = FacesContext.getCurrentInstance();
        //String directorioArchivo = ctx.getExternalContext().getInitParameter("directory_path_promotions");
        String nombreArchivo = sfile.getFileName();
        int punto = nombreArchivo.lastIndexOf(".");
        String extension = nombreArchivo.substring(punto + 1, nombreArchivo.length());
        File archivoImagen = new File(directorioArchivo + "/" + sfile.getFileName());
        try {
            FileOutputStream fileOutputStream = new FileOutputStream(archivoImagen);
            byte[] buffer = new byte[BUFFER_SIZE];
            int bulk;
            InputStream inputStream = sfile.getInputstream();
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
        }
        catch (IOException e) {
            mensajeError("Se detuvo el proceso en el método: handleFileUpload.");
        }
    }

    //Método que guarda el archivo seleccionado (promocion_nuevo.xhtml).
    public void subeArchivoNuevo(UploadedFile file) {
        ExternalContext dire = FacesContext.getCurrentInstance().getExternalContext();
        String pathRelativo = "/images/promociones/";
        String directorioArchivo = dire.getRealPath(pathRelativo);
        String nombreArchivo = getFile().getFileName();
        int punto = nombreArchivo.lastIndexOf(".");
        String extension = nombreArchivo.substring(punto + 1, nombreArchivo.length());
        File archivoImagen = new File(directorioArchivo + "/" + getFile().getFileName());
        try {
            FileOutputStream fileOutputStream = new FileOutputStream(archivoImagen);
            byte[] buffer = new byte[BUFFER_SIZE];
            int bulk;
            InputStream inputStream = getFile().getInputstream();
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
            promocionNuevo.setPromocionImagenNombre(getFile().getFileName());
            promocionNuevo.setPromocionImagenUrl(directorioArchivo + "/" + getFile().getFileName());
            getPromocionesFacade().edit(promocionNuevo);
            //guardarBitacora("Editó una promoción ("+promocionEditar.getPromocionNombre()+").");
            mensajeGuardado("La promoción se ha guardado.");
        } catch (IOException e) {
            mensajeError("Se detuvo el proceso en el método: subeArchivoNuevo.");
        }
    }

    //Método para inicializar los valores de fechas para promoción de tipo cumpleaños (promocion_editar.xhtml).
    public void inicializaFechasEditar() {
        try {
            if (promocionEditar.getPromocionTipo() == 2) {
                Date fechaInicio = new Date();
                Date fechaFin = new Date();
                fechaInicio.setMonth(0);
                fechaInicio.setDate(1);
                fechaFin.setMonth(11);
                fechaFin.setDate(31);
                promocionEditar.setPromocionInicio(fechaInicio);
                promocionEditar.setPromocionFin(fechaFin);
            } else {
                promocionEditar.setPromocionInicio(null);
                promocionEditar.setPromocionFin(null);
            }
        } catch (Exception e) {
            mensajeError("Se detuvo el proceso en el método: inicializaFechasEditar.");
        }
    }

    //Método para verificar si ya existe el archivo a subir (promocion_editar.xhtml).
    public void existeArchivoEditar() {
        try {
            for (Promociones promocion : todasPromocionesDisponibles()) {
                if (promocion.getPromocionNombre().equalsIgnoreCase(promocionEditar.getPromocionNombre())) {
                    if(!(promocion.getPromocionId().toString().equals(promocionEditar.getPromocionId().toString()))){
                        mensajeError("La promoción ya existe.");
                        return;
                    }
                }
            }
            if (file != null) {
                ExternalContext dir = FacesContext.getCurrentInstance().getExternalContext();
                String pathRelativo = "/images/promociones/";
                String directorio = dir.getRealPath(pathRelativo);
                //FacesContext cty = FacesContext.getCurrentInstance();
                //String directorio = cty.getExternalContext().getInitParameter("directory_path_promotions");
                File archivo1 = new File(directorio + "/" + getFile().getFileName() + "/");
                if (archivo1.exists()) {
                    FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_WARN, "Mensaje", "El archivo seleccionado ya existe para una promoción.");
                    RequestContext.getCurrentInstance().showMessageInDialog(message);
                } else {
                    eliminarArchivo();
                    subeArchivoEditar(file);
                }
            } else {
                editarPromocion();
            }
        } catch (Exception e) {
            mensajeError("Se detuvo el proceso en el método: existeArchivoEditar.");
        }
    }

    //Método para eliminar un archivo (promocion_editar.xhtml).
    public void eliminarArchivo() throws FileNotFoundException {
        try {
            File archivoEliminar = new File(promocionEditar.getPromocionImagenUrl());
            if (archivoEliminar.exists()) {
                System.out.println("El archivo existe.");
                if (archivoEliminar.delete()) {
                    System.out.println("El archivo se eliminó.");
                }
            } else {
                System.out.println("El archivo no existe.");
            }
        } catch (Exception e) {
            mensajeError("Se detuvo el proceso en el método: eliminarArchivo.");
        }
    }

    //Método que guarda el archivo seleccionado (promocion_editar.xhtml).
    public void subeArchivoEditar(UploadedFile file) throws InterruptedException {
        ExternalContext dire = FacesContext.getCurrentInstance().getExternalContext();
        String pathRelativo = "/images/promociones/";
        String directorioArchivo = dire.getRealPath(pathRelativo);
        //FacesContext ctx = FacesContext.getCurrentInstance();
        //String directorioArchivo = ctx.getExternalContext().getInitParameter("directory_path_promotions");
        String nombreArchivo = getFile().getFileName();
        int punto = nombreArchivo.lastIndexOf(".");
        String extension = nombreArchivo.substring(punto + 1, nombreArchivo.length());
        File archivoImagen = new File(directorioArchivo + "/" + getFile().getFileName());
        try {
            FileOutputStream fileOutputStream = new FileOutputStream(archivoImagen);
            byte[] buffer = new byte[BUFFER_SIZE];
            int bulk;
            InputStream inputStream = getFile().getInputstream();
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
            promocionEditar.setPromocionImagenNombre(getFile().getFileName());
            promocionEditar.setPromocionImagenUrl(directorioArchivo + "/" + getFile().getFileName());
            getPromocionesFacade().edit(promocionEditar);
            Thread.sleep(3000);
            editarPromocion();
        } catch (IOException e) {
            mensajeError("Se detuvo el proceso en el método: subeArchivoEditar.");
        }
    }

    //Método para editar una Promoción (promocion_editar.xhtml)
    public void editarPromocion() {
        try {
            promocionEditar.setPromocionUsuarioModificacion(appSession.getUsuario().getUsuarioUsuario());
            promocionEditar.setPromocionFechaModificacion(new Date());
            getPromocionesFacade().edit(promocionEditar);
            guardarBitacora("Editó una promoción ("+promocionEditar.getPromocionNombre()+").");
            mensajeGuardado("La promoción se ha actualizado.");
        } catch (Exception e) {
            mensajeError("Se detuvo el proceso en el método: editarPromocion.");
        }
    }

    //Método para eliminar una Promoción (promocion_eliminar_listado.xhtml)
    public void eliminarPromocion() {
        try {
            File archivoEliminar = new File(promocionEditar.getPromocionImagenUrl());
            System.out.println("Documento a eliminar: " + archivoEliminar);
            if (archivoEliminar.exists()) {
                if (archivoEliminar.delete()) {
                    promocionEditar.setPromocionImagenNombre("");
                    promocionEditar.setPromocionImagenUrl("");
                    promocionEditar.setPromocionEstado(Boolean.FALSE);
                    promocionEditar.setPromocionUsuarioModificacion(appSession.getUsuario().getUsuarioUsuario());
                    promocionEditar.setPromocionFechaModificacion(new Date());
                    getPromocionesFacade().edit(promocionEditar);
                    guardarBitacora("Eliminó una promoción ("+promocionEditar.getPromocionNombre()+").");
                    mensajeGuardado("La promoción se ha eliminado.");
                }
            } else {
                promocionEditar.setPromocionImagenNombre("");
                promocionEditar.setPromocionImagenUrl("");
                promocionEditar.setPromocionEstado(Boolean.FALSE);
                promocionEditar.setPromocionUsuarioModificacion(appSession.getUsuario().getUsuarioUsuario());
                promocionEditar.setPromocionFechaModificacion(new Date());
                getPromocionesFacade().edit(promocionEditar);
                guardarBitacora("Eliminó una promoción ("+promocionEditar.getPromocionNombre()+").");
                mensajeGuardado("La promoción se ha eliminado.");
            }
        } catch (Exception e) {
            mensajeError("Se detuvo el proceso en el método: eliminarPromocion.");
        }
    }

    //Método para cargar promoción seleccionada para consultar. (promocion_consultar.xhtml)
    public void cargarPromocionConsultar() {
        promocionConsultar = getPromocionesFacade().find(promocionId);
    }

    //Método para cargar promoción seleccionada para editar. (promocion_editar.xhtml)
    public void cargarPromocionEditar() {
        promocionEditar = getPromocionesFacade().find(promocionId);
    }

    //Método para verificar si el usuario tiene acceso a la página consultada. (Todas las páginas)
    public void verificaAcceso(int pagina) {
        //System.out.println("Entra al método del usuario.");
        boolean acceso = false;
        try {
            FacesContext context = FacesContext.getCurrentInstance();
            HttpServletRequest origRequest = (HttpServletRequest) context.getExternalContext().getRequest();
            String contextPath = origRequest.getContextPath();

            if (appSession.getUsuario() == null) {
                FacesContext.getCurrentInstance().getExternalContext().redirect(contextPath + "/login.xhtml");
            } else if (!(appSession.getUsuario().getRolId().getSubmenusList().isEmpty())) {
                for (Submenus submenu : todosSubmenusDisponibles()) {
                    //System.out.println("Submenu: " + submenu.getSumbenuNombre());
                    if (submenu.getSubmenuId() == pagina) {
                        acceso = true;
                    }
                }
            }
            if (!acceso) {
                FacesContext.getCurrentInstance().getExternalContext().redirect(contextPath + "/login.xhtml");
            }
        } catch (IOException e) {
            System.out.println("La variable appSession es nula.");
        }
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

}
