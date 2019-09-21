package controllers;

import dao.BitacoraFacade;
import dao.ClinicasFacade;
import dao.ExistenciasFacade;
import dao.InsumosFacade;
import dao.MovimientosFacade;
import dao.TiposInsumosFacade;
import dao.UnidadesMedidasFacade;
import entities.Bitacora;
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
    private BitacoraFacade bitacoraFacade;
    private Bitacora bitacoraNueva = new Bitacora();

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
    private Movimientos movimientoEditar = new Movimientos();
    
    private int sucursalId;
    private int insumoId;
    private int existenciaId;
    private int movimientoId;
    
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
    
    public List<Movimientos> todosMovimientosPorExistencia(){
        return getMovimientosFacade().movimientosPorExistencia(movimientoEditar.getExistenciaId().getExistenciaId());
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
        if(sucursalId == 0){
            return getMovimientosFacade().findAll();
        }
        else{
            return getMovimientosFacade().movimientosPorSucursal(sucursalId);
        }
    }
    
    public List<Existencias> todosSolicitudInsumos(){
        if(sucursalId == 0){
            return getExistenciasFacade().solicitudInsumos();
        }
        else{
            return getExistenciasFacade().solicitudInsumosPorSucursal(sucursalId);
        }
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
    
    public BitacoraFacade getBitacoraFacade() {
        return bitacoraFacade;
    }

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

    public Movimientos getMovimientoEditar() {
        return movimientoEditar;
    }
    public void setMovimientoEditar(Movimientos movimientoEditar) {
        this.movimientoEditar = movimientoEditar;
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

    public int getExistenciaId() {
        return existenciaId;
    }
    public void setExistenciaId(int existenciaId) {
        this.existenciaId = existenciaId;
    }

    public int getMovimientoId() {
        return movimientoId;
    }
    public void setMovimientoId(int movimientoId) {
        this.movimientoId = movimientoId;
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

    //Método para guardar un nuevo Insumo (insumo_nuevo.xhtml)
    public void guardarInsumo(){
        try{
            for (Insumos insumo : todosInsumosDisponibles()) {
                if (insumo.getInsumoNombre().equalsIgnoreCase(insumoNuevo.getInsumoNombre())) {
                    mensajeError("El insumo ya existe.");
                    return;
                }
            }
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
            guardarBitacora("Registró un insumo ("+insumoNuevo.getInsumoNombre()+").");
            insumoNuevo = new Insumos();
            mensajeConfirmacion("El insumo se ha guardado.");
        } catch (Exception e) {
            mensajeError("Se detuvo el proceso en el método: guardarInsumo.");
        }
    }
    
    public void editarInsumo(){
        try{
            for (Insumos insumo : todosInsumosDisponibles()) {
                if (insumo.getInsumoNombre().equalsIgnoreCase(insumoEditar.getInsumoNombre())) {
                    if(!(insumo.getInsumoId().toString().equals(insumoEditar.getInsumoId().toString()))){
                        mensajeError("El insumo ya existe.");
                        return;
                    }
                }
            }
            insumoEditar.setInsumoUsuarioModificacion("Nombre de usuario");
            insumoEditar.setInsumoFechaModificacion(new Date());
            getInsumosFacade().edit(insumoEditar);
            guardarBitacora("Editó un insumo ("+insumoEditar.getInsumoNombre()+").");
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
            guardarBitacora("Eliminó un insumo ("+insumoEditar.getInsumoNombre()+").");
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
    
    //Método para obtener el límite inferior en la cantidad de entrada y/o salida de insumos (insumo_historial_editar.xhtml).
    public double limiteCantidadInferior(){
        double cantidad = 0.0;
            if(!(movimientoEditar.getMovimientoTipo())){
                    
            }
            else{
                cantidad = getExistenciasFacade().existenciaPorInsumoClinica(sucursalId, insumoSeleccionado.getInsumoId()).getExistenciaCantidad();
            }
        return cantidad;
    }
    
    //Método para obtener el límite en la cantidad de entrada y/o salida de insumos (insumo_historial_editar.xhtml).
    public double limiteCantidadEditar(){
        double cantidad = 999999;
        if(!(movimientoEditar.getMovimientoTipo())){
            cantidad = getExistenciasFacade().existenciaPorInsumoClinica(sucursalId, movimientoEditar.getExistenciaId().getInsumoId().getInsumoId()).getExistenciaCantidad();
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
                guardarBitacora("Ingresó existencias de insumo ("+existenciaEditar.getInsumoId().getInsumoNombre()+").");
                mensajeConfirmacion("La entrada de insumo se ha guardado.");
            }
            else{
                guardarBitacora("Retiró existencias de insumo ("+existenciaEditar.getInsumoId().getInsumoNombre()+").");
                mensajeConfirmacion("La salida de insumo se ha guardado.");
            }
            existenciaEditar = new Existencias();
            movimientoNuevo = new Movimientos();
            sucursalId = 0;
        } catch (Exception e) {
            mensajeError("Se detuvo el proceso en el método: guardarMovimiento.");
        }
    }
    
    //Método para guardar una Entrada/Salida de Insumo (insumo_historial_editar.xhtml)
    public void guardarMovimientoEditar() {
        Double entrada = 0.0;
        Double salida = 0.0;
        Double total = 0.0;
        try{
            getMovimientosFacade().edit(movimientoEditar);
            for (Movimientos movi : todosMovimientosPorExistencia()){
                if(movi.getMovimientoTipo()){
                    entrada = entrada + movi.getMovimientoCantidad();
                }else{
                    salida = salida + movi.getMovimientoCantidad();
                }
            }
            total = entrada - salida;
            System.out.println("Entrada: " + entrada);
            System.out.println("Salida: " + salida);
            System.out.println("Total: " + total);
            existenciaEditar = getExistenciasFacade().find(movimientoEditar.getExistenciaId().getExistenciaId());
            existenciaEditar.setExistenciaCantidad(total);
            getExistenciasFacade().edit(existenciaEditar);
            mensajeConfirmacion("Los cambios se han guardado.");
            guardarBitacora("Retiró existencias de insumo ("+existenciaEditar.getInsumoId().getInsumoNombre()+").");
        } catch (Exception e) {
            mensajeError("Se detuvo el proceso en el método: guardarMovimientoEditar.");
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
    
    //Método para obtener la existencia por insumo.
    public double existenciaPorInsumoEditar(){
        return getExistenciasFacade().existenciaPorInsumoClinica(sucursalId, movimientoEditar.getExistenciaId().getInsumoId().getInsumoId()).getExistenciaCantidad();
    }
    
    //Método para guardar una Entrada/Salida de Insumo (insumo_control.xhtml)
    public void cargarEntradaExistencia() {
        try{
            double cantidad = existenciaEditar.getExistenciaCantidad();
            existenciaEditar.setExistenciaCantidad(cantidad + getMovimientoNuevo().getMovimientoCantidad());
            getExistenciasFacade().edit(existenciaEditar);
            movimientoNuevo.setMovimientoFechaCreacion(new Date());
            movimientoNuevo.setMovimientoUsuarioCreacion("Nombre Usuario");
            movimientoNuevo.setExistenciaId(new Existencias(existenciaEditar.getExistenciaId()));
            getMovimientosFacade().create(movimientoNuevo);
            movimientoNuevo = new Movimientos();
            mensajeConfirmacion("La entrada de insumo se ha guardado.");
        } catch (Exception e) {
            mensajeError("Se detuvo el proceso en el método: cargarEntradaExistencia.");
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
    
    //Método para cargar existencia seleccionada para editar. (insumo_solicitud_control.xhtml)
    public void cargarExistenciaControl(){
        existenciaEditar = getExistenciasFacade().find(existenciaId);
    }
        
    //Método para inicializar objeto Movimientos (insumo_historial_editar.xhtml).
    public void cargarInsumoMovimiento(){
        movimientoEditar = getMovimientosFacade().find(movimientoId);
        sucursalId = movimientoEditar.getExistenciaId().getClinicaId().getClinicaId();
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