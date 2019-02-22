package controllers;

import dao.ClinicasFacade;
import dao.DepartamentosFacade;
import dao.DireccionesFacade;
import dao.ExistenciasFacade;
import dao.InsumosFacade;
import dao.MunicipiosFacade;
import dao.MedicosFacade;
import dao.PatologiasFacade;
import dao.TiposInsumosFacade;
import dao.TratamientosFacade;
import dao.UnidadesMedidasFacade;
import entities.Clinicas;
import entities.Departamentos;
import entities.Direcciones;
import entities.Existencias;
import entities.Insumos;
import entities.Municipios;
import entities.Medicos;
import entities.Patologias;
import entities.Submenus;
import entities.TiposInsumos;
import entities.Tratamientos;
import entities.UnidadesMedidas;
import java.io.IOException;
import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;
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
public class CatalogosBean implements Serializable {

//****************************************************************************//
//                          Declaración de variables                          //
//****************************************************************************//

    @EJB
    private InsumosFacade insumosFacade;

    @EJB
    private ExistenciasFacade existenciasFacade;
    private Existencias existenciaNuevo = new Existencias();
    
    @EJB
    private MunicipiosFacade municipiosFacade;

    @EJB
    private DepartamentosFacade departamentosFacade;

    @EJB
    private DireccionesFacade direccionesFacade;
    private Direcciones direccionNuevo = new Direcciones();
    private Direcciones direccionConsultar = new Direcciones();
    private Direcciones direccionEditar = new Direcciones();

    @EJB
    private PatologiasFacade patologiasFacade;
    private Patologias patologiaNuevo = new Patologias();
    private Patologias patologiaEditar = new Patologias();
    
    @EJB
    private ClinicasFacade clinicasFacade;
    private Clinicas sucursalNuevo = new Clinicas();
    private Clinicas sucursalEditar = new Clinicas();
    private Clinicas sucursalConsultar = new Clinicas();
    
    @EJB
    private TratamientosFacade tratamientosFacade;
    private Tratamientos tratamientoNuevo = new Tratamientos();
    private Tratamientos tratamientoEditar = new Tratamientos();

    @EJB
    private UnidadesMedidasFacade unidadesMedidasFacade;
    private UnidadesMedidas unidadMedidaNuevo = new UnidadesMedidas();
    private UnidadesMedidas unidadMedidaEditar = new UnidadesMedidas();

    @EJB
    private TiposInsumosFacade tiposInsumosFacade;
    private TiposInsumos tipoInsumoNuevo = new TiposInsumos();
    private TiposInsumos tipoInsumoEditar = new TiposInsumos();
    
    @EJB
    private MedicosFacade medicosFacade;
    private Medicos medicoNuevo = new Medicos();
    private Medicos medicoConsultar = new Medicos();
    private Medicos medicoEditar = new Medicos();

    private Integer tabIndex = 0;
    private int departamentoId;
    private int municipioId;
    private Date fechaActual = new Date();
    
    private int usuarioId;
    private int sucursalId;
    private int medicoId;
    private int tratamientoId;
    private int patologiaId;
    private int tipoInsumoId;
    private int unidadMedidaId;
    
    //Session
    @ManagedProperty(value = "#{appSession}")
    private AppSession appSession;
        
    public CatalogosBean() {
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

    public List<Tratamientos> todosTratamientosDisponibles(){
        return getTratamientosFacade().tratamientosDisponibles(Boolean.TRUE);
    }

    public List<Clinicas> todosSucursalesDisponibles(){
        return getClinicasFacade().clinicasDisponibles(Boolean.TRUE);
    }

    public List<Patologias> todosPatologiasDisponibles(){
        return getPatologiasFacade().patologiasDisponibles(Boolean.TRUE);
    }
        
    public List<Departamentos> todosDepartamentos(){
        return getDepartamentosFacade().findAll();
    }
    
    public List<Municipios> todosMunicipiosPorDepartamento(){
        return getMunicipiosFacade().municipioPorDepartamentos(departamentoId);
    }
    
    public List<Municipios> todosMunicipiosPorDepartamentoEditar(){
        return getMunicipiosFacade().municipioPorDepartamentos(direccionEditar.getMunicipioId().getDepartamentoId().getDepartamentoId());
    }
    
    public List<Medicos> todosMedicosDisponibles() {
        return getMedicosFacade().medicosDisponibles(Boolean.TRUE);
    }
    
    public List<Insumos> todosInsumosDisponibles(){
        return getInsumosFacade().insumosDisponibles(Boolean.TRUE);
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

    public ExistenciasFacade getExistenciasFacade() {
        return existenciasFacade;
    }
    
    public PatologiasFacade getPatologiasFacade() {
        return patologiasFacade;
    }
    
    public TiposInsumosFacade getTiposInsumosFacade() {
        return tiposInsumosFacade;
    }

    public UnidadesMedidasFacade getUnidadesMedidasFacade() {
        return unidadesMedidasFacade;
    }

    public ClinicasFacade getClinicasFacade() {
        return clinicasFacade;
    }

    public TratamientosFacade getTratamientosFacade() {
        return tratamientosFacade;
    }

    public MunicipiosFacade getMunicipiosFacade() {
        return municipiosFacade;
    }

    public DepartamentosFacade getDepartamentosFacade() {
        return departamentosFacade;
    }

    public DireccionesFacade getDireccionesFacade() {
        return direccionesFacade;
    }
    
    public MedicosFacade getMedicosFacade() {
        return medicosFacade;
    }
    
//****************************************************************************//
//                             Métodos Get y SET                              //
//****************************************************************************//

    public UnidadesMedidas getUnidadMedidaNuevo() {
        return unidadMedidaNuevo;
    }
    public void setUnidadMedidaNuevo(UnidadesMedidas unidadMedidaNuevo) {
        this.unidadMedidaNuevo = unidadMedidaNuevo;
    }

    public UnidadesMedidas getUnidadMedidaEditar() {
        return unidadMedidaEditar;
    }
    public void setUnidadMedidaEditar(UnidadesMedidas unidadMedidaEditar) {
        this.unidadMedidaEditar = unidadMedidaEditar;
    }

    public TiposInsumos getTipoInsumoNuevo() {
        return tipoInsumoNuevo;
    }
    public void setTipoInsumoNuevo(TiposInsumos tipoInsumoNuevo) {
        this.tipoInsumoNuevo = tipoInsumoNuevo;
    }

    public TiposInsumos getTipoInsumoEditar() {
        return tipoInsumoEditar;
    }
    public void setTipoInsumoEditar(TiposInsumos tipoInsumoEditar) {
        this.tipoInsumoEditar = tipoInsumoEditar;
    }

    public Tratamientos getTratamientoNuevo() {
        return tratamientoNuevo;
    }
    public void setTratamientoNuevo(Tratamientos tratamientoNuevo) {
        this.tratamientoNuevo = tratamientoNuevo;
    }

    public Tratamientos getTratamientoEditar() {
        return tratamientoEditar;
    }
    public void setTratamientoEditar(Tratamientos tratamientoEditar) {
        this.tratamientoEditar = tratamientoEditar;
    }

    public Patologias getPatologiaNuevo() {
        return patologiaNuevo;
    }
    public void setPatologiaNuevo(Patologias patologiaNuevo) {
        this.patologiaNuevo = patologiaNuevo;
    }

    public Patologias getPatologiaEditar() {
        return patologiaEditar;
    }
    public void setPatologiaEditar(Patologias patologiaEditar) {
        this.patologiaEditar = patologiaEditar;
    }

    public Clinicas getSucursalNuevo() {
        return sucursalNuevo;
    }
    public void setSucursalNuevo(Clinicas sucursalNuevo) {
        this.sucursalNuevo = sucursalNuevo;
    }

    public Clinicas getSucursalConsultar() {
        return sucursalConsultar;
    }
    public void setSucursalConsultar(Clinicas sucursalConsultar) {
        this.sucursalConsultar = sucursalConsultar;
    }

    public Direcciones getDireccionNuevo() {
        return direccionNuevo;
    }
    public void setDireccionNuevo(Direcciones direccionNuevo) {
        this.direccionNuevo = direccionNuevo;
    }

    public int getDepartamentoId() {
        return departamentoId;
    }
    public void setDepartamentoId(int departamentoId) {
        this.departamentoId = departamentoId;
    }

    public int getMunicipioId() {
        return municipioId;
    }
    public void setMunicipioId(int municipioId) {
        this.municipioId = municipioId;
    }
    
    public Direcciones getDireccionConsultar() {
        return direccionConsultar;
    }
    public void setDireccionConsultar(Direcciones direccionConsultar) {
        this.direccionConsultar = direccionConsultar;
    }
    
    public Clinicas getSucursalEditar() {
        return sucursalEditar;
    }
    public void setSucursalEditar(Clinicas sucursalEditar) {
        this.sucursalEditar = sucursalEditar;
    }

    public Direcciones getDireccionEditar() {
        return direccionEditar;
    }
    public void setDireccionEditar(Direcciones direccionEditar) {
        this.direccionEditar = direccionEditar;
    }
       
    public Medicos getMedicoNuevo() {
        return medicoNuevo;
    }
    public void setMedicoNuevo(Medicos medicoNuevo) {
        this.medicoNuevo = medicoNuevo;
    }

    public Integer getTabIndex() {
        return tabIndex;
    }
    public void setTabIndex(Integer tabIndex) {
        this.tabIndex = tabIndex;
    }
    
    public Medicos getMedicoConsultar() {
        return medicoConsultar;
    }
    public void setMedicoConsultar(Medicos medicoConsultar) {
        this.medicoConsultar = medicoConsultar;
    }
    
    public Medicos getMedicoEditar() {
        return medicoEditar;
    }
    public void setMedicoEditar(Medicos medicoEditar) {
        this.medicoEditar = medicoEditar;
    }

    public Date getFechaActual() {
        return fechaActual;
    }
    public void setFechaActual(Date fechaActual) {
        this.fechaActual = fechaActual;
    }
        
    public Existencias getExistenciaNuevo() {
        return existenciaNuevo;
    }

    public void setExistenciaNuevo(Existencias existenciaNuevo) {
        this.existenciaNuevo = existenciaNuevo;
    }

    public AppSession getAppSession() {
        return appSession;
    }
    public void setAppSession(AppSession appSession) {
        this.appSession = appSession;
    }
    
    public int getPatologiaId() {
        return patologiaId;
    }
    public void setPatologiaId(int patologiaId) {
        this.patologiaId = patologiaId;
    }

    public int getUsuarioId() {
        return usuarioId;
    }
    public void setUsuarioId(int usuarioId) {
        this.usuarioId = usuarioId;
    }

    public int getSucursalId() {
        return sucursalId;
    }
    public void setSucursalId(int sucursalId) {
        this.sucursalId = sucursalId;
    }

    public int getMedicoId() {
        return medicoId;
    }
    public void setMedicoId(int medicoId) {
        this.medicoId = medicoId;
    }

    public int getTratamientoId() {
        return tratamientoId;
    }
    public void setTratamientoId(int tratamientoId) {
        this.tratamientoId = tratamientoId;
    }

    public int getTipoInsumoId() {
        return tipoInsumoId;
    }
    public void setTipoInsumoId(int tipoInsumoId) {
        this.tipoInsumoId = tipoInsumoId;
    }

    public int getUnidadMedidaId() {
        return unidadMedidaId;
    }
    public void setUnidadMedidaId(int unidadMedidaId) {
        this.unidadMedidaId = unidadMedidaId;
    }
    
//****************************************************************************//
//                                  Métodos                                   //
//****************************************************************************//
    
    //Método para guardar un nuevo Tipo de Insumo (cat_tipoinsumos_nuevo.xhtml)
    public void guardarTipoInsumo(){
        try{
            tipoInsumoNuevo.setTipoinsumoEstado(Boolean.TRUE);
            getTiposInsumosFacade().create(tipoInsumoNuevo);
            tipoInsumoNuevo = new TiposInsumos();
            mensajeConfirmacion("El tipo de insumo se ha guardado.");
        } catch (Exception e) {
            mensajeError("Se detuvo el proceso en el método: guardarTipoInsumo.");
        }
    }
     
    //Método para editar un Tipo de Insumo (cat_tipoinsumos_editar.xhtml)
    public void editarTipoInsumo(){
        try{
            getTiposInsumosFacade().edit(tipoInsumoEditar);
            mensajeConfirmacion("El tipo de insumo se ha actualizado.");
        } catch (Exception e) {
            mensajeError("Se detuvo el proceso en el método: editarTipoInsumo.");
        }
    }
     
    //Método para eliminar un Tipo de Insumo (cat_tipoinsumos_listado.xhtml)
    public void eliminarTipoInsumo(){
        try{
            tipoInsumoEditar.setTipoinsumoEstado(Boolean.FALSE);
            getTiposInsumosFacade().edit(tipoInsumoEditar);
            mensajeConfirmacion("El tipo de insumo se ha eliminado.");
        } catch (Exception e) {
            mensajeError("Se detuvo el proceso en el método: eliminarTipoInsumo.");
        }
    }
    
    //Método para guardar una Nueva Unidad de Medida (cat_unidadmedidas_nuevo.xhtml)
    public void guardarUnidadMedida(){
        try{
            unidadMedidaNuevo.setUnidadmedidaEstado(Boolean.TRUE);
            getUnidadesMedidasFacade().create(unidadMedidaNuevo);
            unidadMedidaNuevo = new UnidadesMedidas();
            mensajeConfirmacion("La unidad de medida se ha guardado.");
        } catch (Exception e) {
            mensajeError("Se detuvo el proceso en el método: guardarUnidadMedida.");
        }
    }
    
    //Método para editar una Unidad de Medida (cat_unidadmedidas_editar.xhtml)
    public void editarUnidadMedida(){
        try{
            getUnidadesMedidasFacade().edit(unidadMedidaEditar);
            mensajeConfirmacion("La unidad de medida se ha actualizado.");
        } catch (Exception e) {
            mensajeError("Se detuvo el proceso en el método: editarUnidadMedida.");
        }
    }
    
    //Método para eliminar una Unidad de Medida (cat_unidadmedidas_listado.xhtml)
    public void eliminarUnidadMedida(){
        try{
            unidadMedidaEditar.setUnidadmedidaEstado(Boolean.FALSE);
            getUnidadesMedidasFacade().edit(unidadMedidaEditar);
            mensajeConfirmacion("La unidad de medida se ha eliminado.");
        } catch (Exception e) {
            mensajeError("Se detuvo el proceso en el método: eliminarUnidadMedida.");
        }
    }
     
    //Método para guardar un nuevo Tratamiento (cat_tratamientos_nuevo.xhtml)
    public void guardarTratamiento(){
        try{
            tratamientoNuevo.setTratamientoUsuarioCreacion(appSession.getUsuario().getUsuarioUsuario());
            tratamientoNuevo.setTratamientoFechaCreacion(new Date());
            tratamientoNuevo.setTratamientoEstado(Boolean.TRUE);
            getTratamientosFacade().create(tratamientoNuevo);
            tratamientoNuevo = new Tratamientos();
            mensajeConfirmacion("El tratamiento se ha guardado.");
        } catch (Exception e) {
            mensajeError("Se detuvo el proceso en el método: guardarTratamiento.");
        }
    }
     
    //Método para editar un Tratamiento (cat_tratamientos_editar.xhtml)
    public void editarTratamiento(){
        try{
            tratamientoEditar.setTratamientoUsuarioModificacio(appSession.getUsuario().getUsuarioUsuario());
            tratamientoEditar.setTratamientoFechaModificacion(new Date());
            getTratamientosFacade().edit(tratamientoEditar);
            mensajeConfirmacion("El tratamiento se ha actualizado.");
        } catch (Exception e) {
            mensajeError("Se detuvo el proceso en el método: editarTratamiento.");
        }
    }
     
    //Método para eliminar un Tratamiento (cat_tratamientos_listado.xhtml)
    public void eliminarTratamiento(){
        try{
            tratamientoEditar.setTratamientoUsuarioModificacio(appSession.getUsuario().getUsuarioUsuario());
            tratamientoEditar.setTratamientoFechaModificacion(new Date());
            tratamientoEditar.setTratamientoEstado(Boolean.FALSE);
            getTratamientosFacade().edit(tratamientoEditar);
            mensajeConfirmacion("El tratamiento se ha eliminado.");
        } catch (Exception e) {
            mensajeError("Se detuvo el proceso en el método: eliminarTratamiento.");
        }
    }
    
    //Método para guardar una nueva Sucursal (cat_sucursales_nuevo.xhtml)
    public void guardarSucursal(){
        try{
            sucursalNuevo.setClinicaUsuarioCreacion(appSession.getUsuario().getUsuarioUsuario());
            sucursalNuevo.setClinicaFechaCreacion(new Date());
            sucursalNuevo.setClinicaEstado(Boolean.TRUE);
            getClinicasFacade().create(sucursalNuevo);
            direccionNuevo.setClinicaId(new Clinicas(sucursalNuevo.getClinicaId()));
            getDireccionesFacade().create(direccionNuevo);
            for (Insumos insu : todosInsumosDisponibles()){
                existenciaNuevo.setClinicaId(new Clinicas(sucursalNuevo.getClinicaId()));
                existenciaNuevo.setInsumoId(new Insumos(insu.getInsumoId()));
                existenciaNuevo.setExistenciaCantidad(0.0);
                getExistenciasFacade().create(existenciaNuevo);
                existenciaNuevo = new Existencias();
            }
            sucursalNuevo = new Clinicas();
            direccionNuevo = new Direcciones();
            departamentoId = 0;
            tabIndex = 0;
            mensajeConfirmacion("La sucursal se ha guardado.");
        } catch (Exception e) {
            mensajeError("Se detuvo el proceso en el método: guardarSucursal.");
        }
    }
     
    //Método para editar una Sucursal (cat_sucursales_editar.xhtml)
    public void editarSucursal(){
        try{
            System.out.println("Entra al método");
            sucursalEditar.setClinicaUsuarioModificacion(appSession.getUsuario().getUsuarioUsuario());
            sucursalEditar.setClinicaFechaModificacion(new Date());
            getClinicasFacade().edit(sucursalEditar);
            System.out.println("Entra al método y actualiza");
            mensajeConfirmacion("La sucursal se ha actualizado.");
        } catch (Exception e) {
            mensajeError("Se detuvo el proceso en el método: editarSucursal.");
        }
    }
     
    //Método para editar una Dirección (cat_sucursales_editar.xhtml)
    public void editarDireccion(){
        try{
            getDireccionesFacade().edit(direccionEditar);
            mensajeConfirmacion("La direccion se ha actualizado.");
        } catch (Exception e) {
            mensajeError("Se detuvo el proceso en el método: editarDireccion.");
        }
    }
     
    //Método para eliminar una Sucursal (cat_sucursales_listado.xhtml)
    public void eliminarSucursal(){
        try{
            sucursalEditar.setClinicaUsuarioModificacion(appSession.getUsuario().getUsuarioUsuario());
            sucursalEditar.setClinicaFechaModificacion(new Date());
            sucursalEditar.setClinicaEstado(Boolean.FALSE);
            getClinicasFacade().edit(sucursalEditar);
            mensajeConfirmacion("La sucursal se ha eliminado.");
        } catch (Exception e) {
            mensajeError("Se detuvo el proceso en el método: eliminarSucursal.");
        }
    }
    
    //Método para guardar una nueva Patologia (cat_patologias_nuevo.xhtml)
    public void guardarPatologia(){
        try{
            patologiaNuevo.setPatologiaUsuarioCreacion(appSession.getUsuario().getUsuarioUsuario());
            patologiaNuevo.setPatologiaFechaCreacion(new Date());
            patologiaNuevo.setPatologiaEstado(Boolean.TRUE);
            getPatologiasFacade().create(patologiaNuevo);
            patologiaNuevo = new Patologias();
            mensajeConfirmacion("La patología se ha guardado.");
        } catch (Exception e) {
            mensajeError("Se detuvo el proceso en el método: guardarPatologia.");
        }
    }
     
    //Método para editar una Patologia (cat_patologias_editar.xhtml)
    public void editarPatologia(){
        try{
            patologiaEditar.setPatologiaUsuarioModificacio(appSession.getUsuario().getUsuarioUsuario());
            patologiaEditar.setPatologiaFechaModificacion(new Date());
            getPatologiasFacade().edit(patologiaEditar);
            mensajeConfirmacion("La patologia se ha actualizado.");
        } catch (Exception e) {
            mensajeError("Se detuvo el proceso en el método: editarPatologia.");
        }
    }
     
    //Método para eliminar una Patologia (cat_patologias_listado.xhtml)
    public void eliminarPatologia(){
        try{
            patologiaEditar.setPatologiaUsuarioModificacio(appSession.getUsuario().getUsuarioUsuario());
            patologiaEditar.setPatologiaFechaModificacion(new Date());
            patologiaEditar.setPatologiaEstado(Boolean.FALSE);
            getPatologiasFacade().edit(patologiaEditar);
            mensajeConfirmacion("La patologia se ha eliminado.");
        } catch (Exception e) {
            mensajeError("Se detuvo el proceso en el método: eliminarPatologia.");
        }
    }
    
    //Método para guardar un nuevo medico y su dirección (cat_medicos_nuevo.xhtml)
    public void guardarMedico() {
        try{
            medicoNuevo.setMedicoUsuarioCreacion(appSession.getUsuario().getUsuarioUsuario());
            medicoNuevo.setMedicoFechaCreacion(new Date());
            medicoNuevo.setMedicoEstado(Boolean.TRUE);
            getMedicosFacade().create(medicoNuevo);
            direccionNuevo.setMedicoId(new Medicos(medicoNuevo.getMedicoId()));
            getDireccionesFacade().create(direccionNuevo);
            medicoNuevo = new Medicos();
            direccionNuevo = new Direcciones();
            departamentoId = 0;
            tabIndex = 0;
            mensajeConfirmacion("El medico se ha guardado.");
        } catch (Exception e) {
            mensajeError("Se detuvo el proceso en el método: guardarMedico.");
        }
    }
    
    //Método para editar un Médico (cat_medicos_editar.xhtml)
    public void editarMedico(){
        try{
            medicoEditar.setMedicoUsuarioModificacion(appSession.getUsuario().getUsuarioUsuario());
            medicoEditar.setMedicoFechaModificacion(new Date());
            getMedicosFacade().edit(medicoEditar);
            mensajeConfirmacion("El médico se ha actualizado.");
        } catch (Exception e) {
            mensajeError("Se detuvo el proceso en el método: editarMedico.");
        }
    }
     
    //Método para eliminar un Médico (cat_medicos_listado.xhtml)
    public void eliminarMedico() {
        try{
            medicoEditar.setMedicoUsuarioModificacion(appSession.getUsuario().getUsuarioUsuario());
            medicoEditar.setMedicoFechaModificacion(new Date());
            medicoEditar.setMedicoEstado(Boolean.FALSE);
            getMedicosFacade().edit(medicoEditar);
            mensajeConfirmacion("El médico se ha eliminado.");
        } catch (Exception e) {
            mensajeError("Se detuvo el proceso en el método: eliminarMedico.");
        }
    }
    
    // Método para extraer el teléfono de los medicos (cat_medicos_listado.xhtml)
    public String telefonoMedico(Medicos medico) {
        
        if(medico.getMedicoTelefonoMovil() != null){
            return medico.getMedicoTelefonoMovil();
        }
        if(medico.getMedicoTelefonoCasa() != null){
            return medico.getMedicoTelefonoCasa();
        }
        return "Sin teléfono";
    }
    
    // Método para extraer el teléfono de las sucursales (cat_sucursales_listado.xhtml)
    public String telefonoSucursal(Clinicas clinica) {
        
        if(clinica.getClinicaTelefonoFijo() != null){
            return clinica.getClinicaTelefonoFijo();
        }
        if(clinica.getClinicaTelefonoMovil() != null){
            return clinica.getClinicaTelefonoMovil();
        }
        return "Sin teléfono";
    }
    
    //Método para cargar sucursal seleccionada para consultar. (cat_sucursales_consultar.xhtml)
    public void cargarSucursalConsultar(){
        sucursalConsultar = getClinicasFacade().find(sucursalId);
        this.direccionConsultar = getDireccionesFacade().direccionPorSucursal(sucursalConsultar.getClinicaId());
    }
        
    //Método para cargar sucursal seleccionada para editar. (cat_sucursales_editar.xhtml)
    public void cargarSucursalEditar(){
        sucursalEditar = getClinicasFacade().find(sucursalId);
        this.direccionEditar = getDireccionesFacade().direccionPorSucursal(sucursalEditar.getClinicaId());
        //this.departamentoId = direccionEditar.getMunicipioId().getDepartamentoId().getDepartamentoId();
        //this.municipioId = direccionEditar.getMunicipioId().getMunicipioId();
    }
        
    //Método para cargar médico seleccionado para consultar. (cat_medicos_consultar.xhtml)
    public void cargarMedicoConsultar(){
        medicoConsultar = getMedicosFacade().find(medicoId);
        this.direccionConsultar = getDireccionesFacade().direccionPorMedico(medicoConsultar.getMedicoId());
    }
        
    //Método para cargar médico seleccionado para editar. (cat_medicos_ediltar.xhtml)
    public void cargarMedicoEditar(){
        medicoEditar = getMedicosFacade().find(medicoId);
        this.direccionEditar = getDireccionesFacade().direccionPorMedico(medicoEditar.getMedicoId());
    }
        
    //Método para cargar tratamiento seleccionado para editar. (cat_tratamientos_editar.xhtml)
    public void cargarTratamiento(){
        tratamientoEditar = getTratamientosFacade().find(tratamientoId);
    }
        
    //Método para cargar patología seleccionada para editar. (cat_patologias_editar.xhtml)
    public void cargarPatologia(){
        patologiaEditar = getPatologiasFacade().find(patologiaId);
    }
        
    //Método para cargar tipo de insumo seleccionado para editar. (cat_tipoinsumos_editar.xhtml)
    public void cargarTipoInsumo(){
        tipoInsumoEditar = getTiposInsumosFacade().find(tipoInsumoId);
    }
        
    //Método para cargar unidad de medida seleccionada para editar. (cat_unidadesmedidas_editar.xhtml)
    public void cargarUnidadMedida(){
        unidadMedidaEditar = getUnidadesMedidasFacade().find(unidadMedidaId);
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
    
    //Método para mostrar hora local (cat_sucursales_listado.xhtml)
    public TimeZone getHoraLocal() {
        return TimeZone.getDefault();
    }
    
}