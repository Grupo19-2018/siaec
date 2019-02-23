package controllers;

import dao.ClinicasFacade;
import dao.ExistenciasFacade;
import dao.InsumosFacade;
import dao.MovimientosFacade;
import dao.TiposInsumosFacade;
import dao.UnidadesMedidasFacade;
import entities.Clinicas;
import entities.Existencias;
import entities.Insumos;
import entities.Movimientos;
import entities.Submenus;
import entities.TiposInsumos;
import entities.UnidadesMedidas;
import java.io.IOException;
import java.io.Serializable;
import java.util.Date;
import java.util.List;
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
public class InsumosBean implements Serializable {

//****************************************************************************//
//                          Declaración de variables                          //
//****************************************************************************//
    
    @EJB
    private InsumosFacade insumosFacade;
    private Insumos insumoNuevo = new Insumos();
    private Insumos insumoSeleccionado = new Insumos();
    private Insumos insumoEditar = new Insumos();
    private Insumos insumoConsultar = new Insumos();
    
    @EJB
    private UnidadesMedidasFacade unidadesMedidasFacade;
    
    @EJB
    private TiposInsumosFacade tiposInsumosFacade;
    
    @EJB
    private ExistenciasFacade existenciasFacade;
    private Existencias existenciaEditar = new Existencias();
    private Existencias existenciaNueva = new Existencias();
    
    @EJB
    private ClinicasFacade clinicasFacade;
    
    @EJB
    private MovimientosFacade movimientosFacade;
    private Movimientos movimientoNuevo = new Movimientos();
    
    private int sucursalId;
    private int insumoId;
    
    //Session
    @ManagedProperty(value = "#{appSession}")
    private AppSession appSession;
    
    public InsumosBean() {
    }

//****************************************************************************//
//                  Métodos para obtener listas por entidades                 //
//****************************************************************************//

    public List<UnidadesMedidas> todosUnidadesMedidasDisponibles(){
        return getUnidadesMedidasFacade().unidadesMedidasDisponibles(Boolean.TRUE);
    }
    
    public List<TiposInsumos> todosTiposInsumosDisponibles(){
        return getTiposInsumosFacade().tiposInsumosDisponibles(Boolean.TRUE);
    }
    
    public List<Insumos> todosInsumosDisponibles(){
        return getInsumosFacade().insumosDisponibles(Boolean.TRUE);
    }
    
    public List<Clinicas> todasClinicasDisponibles(){
        return getClinicasFacade().clinicasDisponibles(Boolean.TRUE);
    }
    
    public List<Existencias> todasExistencias(){
        if(sucursalId == 0){
            return getExistenciasFacade().findAll();
        }
        else{
            return getExistenciasFacade().insumosPorClinica(sucursalId);
        }
    }
    
    public List<Movimientos> todosMovimientos(){
        return getMovimientosFacade().findAll();
    }
    
    public List<Existencias> todosSolicitudInsumos(){
        return getExistenciasFacade().solicitudInsumos();
    }
    
    public List<Existencias> todosSolicitudInsumosAgotados(){
        return getExistenciasFacade().solicitudInsumosAgotados();
    }
    
    public List<Existencias> todosSolicitudInsumosPorAgotarse(){
        return getExistenciasFacade().solicitudInsumosPorAgotados();
    }
    
    public List<Clinicas> todosSucursalesDisponibles(){
        return getClinicasFacade().clinicasDisponibles(Boolean.TRUE);
    }
    
    public List<Submenus> todosSubmenusDisponibles(){
        return appSession.getUsuario().getRolId().getSubmenusList();
    }
    
//****************************************************************************//
//                 Métodos Get para obtener datos de entidades                //
//****************************************************************************//    
    
    public InsumosFacade getInsumosFacade() {
        return insumosFacade;
    }

    public UnidadesMedidasFacade getUnidadesMedidasFacade() {
        return unidadesMedidasFacade;
    }

    public TiposInsumosFacade getTiposInsumosFacade() {
        return tiposInsumosFacade;
    }

    public ExistenciasFacade getExistenciasFacade() {
        return existenciasFacade;
    }

    public ClinicasFacade getClinicasFacade() {
        return clinicasFacade;
    }

    public MovimientosFacade getMovimientosFacade() {
        return movimientosFacade;
    }
    
//****************************************************************************//
//                             Métodos Get y SET                              //
//****************************************************************************//
    
    public Insumos getInsumoNuevo() {
        return insumoNuevo;
    }
    public void setInsumoNuevo(Insumos insumoNuevo) {
        this.insumoNuevo = insumoNuevo;
    }

    public Existencias getExistenciaEditar() {
        return existenciaEditar;
    }
    public void setExistenciaEditar(Existencias existenciaEditar) {
        this.existenciaEditar = existenciaEditar;
    }

    public Movimientos getMovimientoNuevo() {
        return movimientoNuevo;
    }
    public void setMovimientoNuevo(Movimientos movimientoNuevo) {
        this.movimientoNuevo = movimientoNuevo;
    }

    public int getSucursalId() {
        return sucursalId;
    }
    public void setSucursalId(int sucursalId) {
        this.sucursalId = sucursalId;
    }

    public Insumos getInsumoSeleccionado() {
        return insumoSeleccionado;
    }
    public void setInsumoSeleccionado(Insumos insumoSeleccionado) {
        this.insumoSeleccionado = insumoSeleccionado;
    }

    public Insumos getInsumoEditar() {
        return insumoEditar;
    }
    public void setInsumoEditar(Insumos insumoEditar) {
        this.insumoEditar = insumoEditar;
    }

    public Insumos getInsumoConsultar() {
        return insumoConsultar;
    }
    public void setInsumoConsultar(Insumos insumoConsultar) {
        this.insumoConsultar = insumoConsultar;
    }

    public Existencias getExistenciaNueva() {
        return existenciaNueva;
    }
    public void setExistenciaNueva(Existencias existenciaNueva) {
        this.existenciaNueva = existenciaNueva;
    }

    public AppSession getAppSession() {
        return appSession;
    }
    public void setAppSession(AppSession appSession) {
        this.appSession = appSession;
    }

    public int getInsumoId() {
        return insumoId;
    }
    public void setInsumoId(int insumoId) {
        this.insumoId = insumoId;
    }
        
//****************************************************************************//
//                                  Métodos                                   //
//****************************************************************************//

    //Método para guardar un nuevo Insumo (insumo_nuevo.xhtml)
    public void guardarInsumo(){
        try{
            insumoNuevo.setInsumoEstado(Boolean.TRUE);
            insumoNuevo.setInsumoUsuarioCreacion("Nombre de usuario");
            insumoNuevo.setInsumoFechaCreacion(new Date());
            getInsumosFacade().create(insumoNuevo);
            for (Clinicas clini : todasClinicasDisponibles()){
              existenciaNueva.setClinicaId(new Clinicas(clini.getClinicaId()));
              existenciaNueva.setInsumoId(new Insumos(insumoNuevo.getInsumoId()));
              existenciaNueva.setExistenciaCantidad(0.0);
              getExistenciasFacade().create(existenciaNueva);
              existenciaNueva = new Existencias();
            }
            insumoNuevo = new Insumos();
            mensajeConfirmacion("El insumo se ha guardado.");
        } catch (Exception e) {
            mensajeError("Se detuvo el proceso en el método: guardarInsumo.");
        }
    }
    
    public void editarInsumo(){
        try{
            insumoEditar.setInsumoUsuarioModificacion("Nombre de usuario");
            insumoEditar.setInsumoFechaModificacion(new Date());
            getInsumosFacade().edit(insumoEditar);
            mensajeConfirmacion("El insumo se ha actualizado.");
        } catch (Exception e) {
            mensajeError("Se detuvo el proceso en el método: editarInsumo.");
        }
    }
    
    //Método para eliminar una Unidad de Medida (cat_unidadmedidas_listado.xhtml)
    public void eliminarInsumo(){
        try{
            insumoEditar.setInsumoEstado(Boolean.FALSE);
            insumoEditar.setInsumoUsuarioModificacion("Nombre de usuario");
            insumoEditar.setInsumoFechaModificacion(new Date());
            getInsumosFacade().edit(insumoEditar);
            mensajeConfirmacion("El insumo se ha eliminado.");
        } catch (Exception e) {
            mensajeError("Se detuvo el proceso en el método: eliminarInsumo.");
        }
    }
    
    //Método para obtener el límite en la cantidad de entrada y/o salida de insumos (insumo_control.xhtml).
    public double limiteCantidad(){
        double cantidad = 999999;
        if(movimientoNuevo.getMovimientoTipo() == null){
            cantidad = 999999;
        }
        else{
            if(!(movimientoNuevo.getMovimientoTipo())){
                if(sucursalId != 0){
                    cantidad = getExistenciasFacade().existenciaPorInsumoClinica(sucursalId, insumoSeleccionado.getInsumoId()).getExistenciaCantidad();
                }
            }
        }
        return cantidad;
    }
    
    //Método para guardar una Entrada/Salida de Insumo (insumo_control.xhtml)
    public void guardarMovimiento() {
        try{
            existenciaEditar = getExistenciasFacade().existenciaPorInsumoClinica(sucursalId, insumoSeleccionado.getInsumoId());
            double cantidad = existenciaEditar.getExistenciaCantidad();
            if(movimientoNuevo.getMovimientoTipo()){
                existenciaEditar.setExistenciaCantidad(cantidad + getMovimientoNuevo().getMovimientoCantidad());
            }else{
                existenciaEditar.setExistenciaCantidad(cantidad - getMovimientoNuevo().getMovimientoCantidad());
            }
            getExistenciasFacade().edit(existenciaEditar);
            movimientoNuevo.setMovimientoFechaCreacion(new Date());
            movimientoNuevo.setMovimientoUsuarioCreacion("Nombre Usuario");
            movimientoNuevo.setExistenciaId(new Existencias(existenciaEditar.getExistenciaId()));
            getMovimientosFacade().create(movimientoNuevo);
            if(movimientoNuevo.getMovimientoTipo()){
                mensajeConfirmacion("La entrada de insumo se ha guardado.");
            }
            else{
                mensajeConfirmacion("La salida de insumo se ha guardado.");
            }
            existenciaEditar = new Existencias();
            movimientoNuevo = new Movimientos();
            sucursalId = 0;
        } catch (Exception e) {
            mensajeError("Se detuvo el proceso en el método: movimientoInsumo.");
        }
    }
    
    //Método para obtener la cantidad de insumo por sucursal.
    public double cantidadInsumo(int insumoId){
        if(sucursalId == 0){
            List<Existencias> existencia = getExistenciasFacade().existenciaPorInsumo(insumoId);
            double cantidad = 0.0;
            for (Existencias exist : existencia){
                cantidad = cantidad + exist.getExistenciaCantidad();
            }
            return cantidad;
        }
        else{
            return getExistenciasFacade().existenciaPorInsumoClinica(sucursalId, insumoId).getExistenciaCantidad();
        }
    }
    
    //Método para obtener la existencia por insumo.
    public double existenciaPorInsumo(){
        if(sucursalId == 0){
            List<Existencias> existencia = getExistenciasFacade().existenciaPorInsumo(insumoSeleccionado.getInsumoId());
            double cantidad = 0.0;
            for (Existencias exist : existencia){
                cantidad = cantidad + exist.getExistenciaCantidad();
            }
            return cantidad;
        }
        else{
            return getExistenciasFacade().existenciaPorInsumoClinica(sucursalId, insumoSeleccionado.getInsumoId()).getExistenciaCantidad();
        }
    }
    
    //Método para cargar insumo seleccionado para consultar. (insumo_consultar.xhtml)
    public void cargarInsumoConsultar(){
        insumoConsultar = getInsumosFacade().find(insumoId);
    }
        
    //Método para cargar insumo seleccionado para editar. (insumo_editar.xhtml)
    public void cargarInsumoEditar(){
        insumoEditar = getInsumosFacade().find(insumoId);
    }
        
    //Método para inicializar objeto Movimientos (insumo_control.xhtml).
    public void cargarInsumoControl(){
        insumoSeleccionado = getInsumosFacade().find(insumoId);
        movimientoNuevo = new Movimientos();
        sucursalId = 0;
    }
    
    //Método para verificar si el usuario tiene acceso a la página consultada. (Todas las páginas)
    public void verificaAcceso(String pagina){
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
                        if(submenu.getSumbenuNombre().equals(pagina)){
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
    
    //Método para mostrar mensaje de guardado/actualizado/eliminado.
    public void mensajeConfirmacion(String mensaje) {
        FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_INFO, "Mensaje", mensaje);
        RequestContext.getCurrentInstance().showMessageInDialog(message);
    }
    
    //Método para mostrar mensaje de error en el sistema.
    public void mensajeError(String mensaje) {
        FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_ERROR, "¡Error!", mensaje);
        RequestContext.getCurrentInstance().showMessageInDialog(message);
    }
    
}