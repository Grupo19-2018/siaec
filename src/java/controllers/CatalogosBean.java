package controllers;

import dao.BitacoraFacade;
import dao.CitasFacade;
import dao.ClinicasFacade;
import dao.DepartamentosFacade;
import dao.DireccionesFacade;
import dao.ExistenciasFacade;
import dao.InsumosFacade;
import dao.MunicipiosFacade;
import dao.MedicosFacade;
import dao.PacientesFacade;
import dao.PatologiasFacade;
import dao.RolesFacade;
import dao.TiposInsumosFacade;
import dao.TratamientosFacade;
import dao.UnidadesMedidasFacade;
import dao.UsuariosFacade;
import entities.Bitacora;
import entities.Citas;
import entities.Clinicas;
import entities.Departamentos;
import entities.Direcciones;
import entities.Existencias;
import entities.Insumos;
import entities.Municipios;
import entities.Medicos;
import entities.Pacientes;
import entities.Patologias;
import entities.Roles;
import entities.Submenus;
import entities.TiposInsumos;
import entities.Tratamientos;
import entities.UnidadesMedidas;
import entities.Usuarios;
import java.io.IOException;
import java.io.Serializable;
import java.sql.Timestamp;
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
import org.apache.commons.codec.digest.DigestUtils;
import org.primefaces.context.RequestContext;

/* @author Equipo 19-2018 FIA-UES */
@ManagedBean
@ViewScoped
public class CatalogosBean implements Serializable {

//****************************************************************************//
//                          Declaración de variables                          //
//****************************************************************************//
    @EJB
    private BitacoraFacade bitacoraFacade;
    private Bitacora bitacoraNueva = new Bitacora();

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
    private PacientesFacade pacientesFacade;
    private Pacientes pacienteSeleccionado = new Pacientes();

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
    private Medicos medicoSeleccionado = new Medicos();

    @EJB
    private UsuariosFacade usuariosFacade;
    private Usuarios usuarioNuevo = new Usuarios();
    private Usuarios usuarioConsultar = new Usuarios();
    private Usuarios usuarioEditar = new Usuarios();

    @EJB
    private RolesFacade rolesFacade;

    @EJB
    private CitasFacade citasFacade;
    private Citas citaEditar = new Citas();
    private int citaUsuario = 0;

    private Integer tabIndex = 0;
    private int departamentoId;
    private int municipioId;
    private Date fechaActual = new Date();

    private int usuarioId;
    private int rolId;
    private int sucursalId;
    private int medicoId;
    private int tratamientoId;
    private int patologiaId;
    private int tipoInsumoId;
    private int unidadMedidaId;
    private int pacienteId;
    private String usuarioUsuario;
    private int usuarios;

    //Session
    @ManagedProperty(value = "#{appSession}")
    private AppSession appSession;

    public CatalogosBean() {
    }

//****************************************************************************//
//                  Métodos para obtener listas por entidades                 //
//****************************************************************************//
    
    public List<UnidadesMedidas> todosUnidadesMedidasDisponibles() {
        return getUnidadesMedidasFacade().unidadesMedidasDisponibles(Boolean.TRUE);
    }

    public List<TiposInsumos> todosTiposInsumosDisponibles() {
        return getTiposInsumosFacade().tiposInsumosDisponibles(Boolean.TRUE);
    }

    public List<Tratamientos> todosTratamientosDisponibles() {
        return getTratamientosFacade().tratamientosDisponibles(Boolean.TRUE);
    }

    public List<Clinicas> todosSucursalesDisponibles() {
        return getClinicasFacade().clinicasDisponibles(Boolean.TRUE);
    }

    public List<Patologias> todosPatologiasDisponibles() {
        return getPatologiasFacade().patologiasDisponibles(Boolean.TRUE);
    }

    public List<Departamentos> todosDepartamentos() {
        return getDepartamentosFacade().findAll();
    }

    public List<Municipios> todosMunicipiosPorDepartamento() {
        return getMunicipiosFacade().municipioPorDepartamentos(departamentoId);
    }

    public List<Municipios> todosMunicipiosPorDepartamentoEditar() {
        return getMunicipiosFacade().municipioPorDepartamentos(direccionEditar.getMunicipioId().getDepartamentoId().getDepartamentoId());
    }

    public List<Medicos> todosMedicosDisponibles() {
        return getMedicosFacade().medicosDisponibles(Boolean.TRUE);
    }

    public List<Insumos> todosInsumosDisponibles() {
        return getInsumosFacade().insumosDisponibles(Boolean.TRUE);
    }

    public List<Pacientes> todosPacientesDisponibles() {
        return getPacientesFacade().pacientesDisponibles(Boolean.TRUE);
    }

    public List<Roles> todosRolesDisponibles() {
        return getRolesFacade().findAll();
    }

    public List<Submenus> todosSubmenusDisponibles() {
        return appSession.getUsuario().getRolId().getSubmenusList();
    }

    public List<Usuarios> todosUsuarios() {
        return getUsuariosFacade().findAll();
    }

    public List<Usuarios> todosUsuariosActivos() {
        switch (usuarios) {
            case 1:
                return getUsuariosFacade().todosUsuariosClinicas();
            case 2:
                return getUsuariosFacade().todosUsuariosPacientes();
            default:
                return getUsuariosFacade().todosUsuariosActivos();
        }
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

    public UsuariosFacade getUsuariosFacade() {
        return usuariosFacade;
    }

    public PacientesFacade getPacientesFacade() {
        return pacientesFacade;
    }

    public RolesFacade getRolesFacade() {
        return rolesFacade;
    }

    public CitasFacade getCitasFacade() {
        return citasFacade;
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

    public Pacientes getPacienteSeleccionado() {
        return pacienteSeleccionado;
    }
    public void setPacienteSeleccionado(Pacientes pacienteSeleccionado) {
        this.pacienteSeleccionado = pacienteSeleccionado;
    }

    public Medicos getMedicoSeleccionado() {
        return medicoSeleccionado;
    }
    public void setMedicoSeleccionado(Medicos medicoSeleccionado) {
        this.medicoSeleccionado = medicoSeleccionado;
    }

    public Usuarios getUsuarioNuevo() {
        return usuarioNuevo;
    }
    public void setUsuarioNuevo(Usuarios usuarioNuevo) {
        this.usuarioNuevo = usuarioNuevo;
    }

    public Usuarios getUsuarioConsultar() {
        return usuarioConsultar;
    }
    public void setUsuarioConsultar(Usuarios usuarioConsultar) {
        this.usuarioConsultar = usuarioConsultar;
    }

    public Usuarios getUsuarioEditar() {
        return usuarioEditar;
    }
    public void setUsuarioEditar(Usuarios usuarioEditar) {
        this.usuarioEditar = usuarioEditar;
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

    public int getRolId() {
        return rolId;
    }
    public void setRolId(int rolId) {
        this.rolId = rolId;
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

    public int getPacienteId() {
        return pacienteId;
    }
    public void setPacienteId(int pacienteId) {
        this.pacienteId = pacienteId;
    }

    public String getUsuarioUsuario() {
        return usuarioUsuario;
    }
    public void setUsuarioUsuario(String usuarioUsuario) {
        this.usuarioUsuario = usuarioUsuario;
    }

    public int getUsuarios() {
        return usuarios;
    }
    public void setUsuarios(int usuarios) {
        this.usuarios = usuarios;
    }

    public Bitacora getBitacoraNueva() {
        return bitacoraNueva;
    }
    public void setBitacoraNueva(Bitacora bitacoraNueva) {
        this.bitacoraNueva = bitacoraNueva;
    }

    public int getCitaUsuario() {
        return citaUsuario;
    }
    public void setCitaUsuario(int citaUsuario) {
        this.citaUsuario = citaUsuario;
    }

//****************************************************************************//
//                                  Métodos                                   //
//****************************************************************************//
    
    //Método para guardar en la Bitacora.
    public void guardarBitacora(String transaccion) {
        try {
            bitacoraNueva.setBitacoraFechaHora(fechaActual);
            bitacoraNueva.setBitacoraUsuario(appSession.getUsuario().getUsuarioUsuario());
            bitacoraNueva.setBitacoraTransaccion(transaccion);
            getBitacoraFacade().create(bitacoraNueva);
        } catch (Exception e) {
            mensajeError("Se detuvo el proceso en el método: guardarBitacora.");
        }
    }

    //Método para guardar un nuevo Tipo de Insumo (cat_tipoinsumos_nuevo.xhtml)
    public void guardarTipoInsumo() {
        try {
            for (TiposInsumos tipo : todosTiposInsumosDisponibles()) {
                if (tipo.getTipoinsumoNombre().equalsIgnoreCase(tipoInsumoNuevo.getTipoinsumoNombre())) {
                    mensajeError("El tipo de insumo ya existe.");
                    return;
                }
            }
            tipoInsumoNuevo.setTipoinsumoEstado(Boolean.TRUE);
            getTiposInsumosFacade().create(tipoInsumoNuevo);
            guardarBitacora("Registró un tipo de insumo (" + tipoInsumoNuevo.getTipoinsumoNombre() + ").");
            tipoInsumoNuevo = new TiposInsumos();
            mensajeConfirmacion("El tipo de insumo se ha guardado.");
        } catch (Exception e) {
            mensajeError("Se detuvo el proceso en el método: guardarTipoInsumo.");
        }
    }

    //Método para editar un Tipo de Insumo (cat_tipoinsumos_editar.xhtml)
    public void editarTipoInsumo() {
        try {
            for (TiposInsumos tipo : todosTiposInsumosDisponibles()) {
                if (tipo.getTipoinsumoNombre().equalsIgnoreCase(tipoInsumoEditar.getTipoinsumoNombre())) {
                    if(!(tipo.getTipoinsumoId().toString().equals(tipoInsumoEditar.getTipoinsumoId().toString()))){
                        mensajeError("El tipo de insumo ya existe.");
                        return;
                    }
                }
            }
            getTiposInsumosFacade().edit(tipoInsumoEditar);
            guardarBitacora("Editó un tipo de insumo (" + tipoInsumoEditar.getTipoinsumoNombre() + ").");
            mensajeConfirmacion("El tipo de insumo se ha actualizado.");
        } catch (Exception e) {
            mensajeError("Se detuvo el proceso en el método: editarTipoInsumo.");
        }
    }

    //Método para eliminar un Tipo de Insumo (cat_tipoinsumos_listado.xhtml)
    public void eliminarTipoInsumo() {
        try {
            tipoInsumoEditar.setTipoinsumoEstado(Boolean.FALSE);
            getTiposInsumosFacade().edit(tipoInsumoEditar);
            guardarBitacora("Eliminó un tipo de insumo (" + tipoInsumoEditar.getTipoinsumoNombre() + ").");
            mensajeConfirmacion("El tipo de insumo se ha eliminado.");
        } catch (Exception e) {
            mensajeError("Se detuvo el proceso en el método: eliminarTipoInsumo.");
        }
    }

    //Método para guardar una Nueva Unidad de Medida (cat_unidadmedidas_nuevo.xhtml)
    public void guardarUnidadMedida() {
        try {
            unidadMedidaNuevo.setUnidadmedidaEstado(Boolean.TRUE);
            for (UnidadesMedidas unidad : todosUnidadesMedidasDisponibles()) {
                if (unidad.getUnidadmedidaNombre().equalsIgnoreCase(unidadMedidaNuevo.getUnidadmedidaNombre())) {
                    mensajeError("La unidad de medida ya existe.");
                    return;
                }
            }
            getUnidadesMedidasFacade().create(unidadMedidaNuevo);
            guardarBitacora("Registró una unidad de medida (" + unidadMedidaNuevo.getUnidadmedidaNombre() + ").");
            unidadMedidaNuevo = new UnidadesMedidas();
            mensajeConfirmacion("La unidad de medida se ha guardado.");
        } catch (Exception e) {
            mensajeError("Se detuvo el proceso en el método: guardarUnidadMedida.");
        }
    }

    //Método para editar una Unidad de Medida (cat_unidadmedidas_editar.xhtml)
    public void editarUnidadMedida() {
        try {
            for (UnidadesMedidas unidad : todosUnidadesMedidasDisponibles()) {
                if (unidad.getUnidadmedidaNombre().equalsIgnoreCase(unidadMedidaEditar.getUnidadmedidaNombre())) {
                    if(!(unidad.getUnidadmedidaId().toString().equals(unidadMedidaEditar.getUnidadmedidaId().toString()))){
                        mensajeError("La unidad de medida ya existe.");
                        return;
                    }
                }
            }
            getUnidadesMedidasFacade().edit(unidadMedidaEditar);
            guardarBitacora("Editó una unidad de medida (" + unidadMedidaEditar.getUnidadmedidaNombre() + ").");
            mensajeConfirmacion("La unidad de medida se ha actualizado.");
        } catch (Exception e) {
            mensajeError("Se detuvo el proceso en el método: editarUnidadMedida.");
        }
    }

    //Método para eliminar una Unidad de Medida (cat_unidadmedidas_listado.xhtml)
    public void eliminarUnidadMedida() {
        try {
            unidadMedidaEditar.setUnidadmedidaEstado(Boolean.FALSE);
            getUnidadesMedidasFacade().edit(unidadMedidaEditar);
            guardarBitacora("Eliminó una unidad de medida (" + unidadMedidaEditar.getUnidadmedidaNombre() + ").");
            mensajeConfirmacion("La unidad de medida se ha eliminado.");
        } catch (Exception e) {
            mensajeError("Se detuvo el proceso en el método: eliminarUnidadMedida.");
        }
    }

    //Método para guardar un nuevo Tratamiento (cat_tratamientos_nuevo.xhtml)
    public void guardarTratamiento() {
        try {
            for (Tratamientos tratamiento : todosTratamientosDisponibles()) {
                if (tratamiento.getTratamientoNombre().equalsIgnoreCase(tratamientoNuevo.getTratamientoNombre())) {
                    mensajeError("El tratamiento ya existe.");
                    return;
                }
            }
            tratamientoNuevo.setTratamientoUsuarioCreacion(appSession.getUsuario().getUsuarioUsuario());
            tratamientoNuevo.setTratamientoFechaCreacion(new Date());
            tratamientoNuevo.setTratamientoEstado(Boolean.TRUE);
            getTratamientosFacade().create(tratamientoNuevo);
            guardarBitacora("Registró un tratamiento (" + tratamientoNuevo.getTratamientoNombre() + ").");
            tratamientoNuevo = new Tratamientos();
            mensajeConfirmacion("El tratamiento se ha guardado.");
        } catch (Exception e) {
            mensajeError("Se detuvo el proceso en el método: guardarTratamiento.");
        }
    }

    //Método para editar un Tratamiento (cat_tratamientos_editar.xhtml)
    public void editarTratamiento() {
        try {
            for (Tratamientos tratamiento : todosTratamientosDisponibles()) {
                if (tratamiento.getTratamientoNombre().equalsIgnoreCase(tratamientoEditar.getTratamientoNombre())) {
                    if(!(tratamiento.getTratamientoId().toString().equals(tratamientoEditar.getTratamientoId().toString()))){
                        mensajeError("El tratamiento ya existe.");
                        return;
                    }
                }
            }
            tratamientoEditar.setTratamientoUsuarioModificacio(appSession.getUsuario().getUsuarioUsuario());
            tratamientoEditar.setTratamientoFechaModificacion(new Date());
            getTratamientosFacade().edit(tratamientoEditar);
            guardarBitacora("Editó un tratamiento (" + tratamientoEditar.getTratamientoNombre() + ").");
            mensajeConfirmacion("El tratamiento se ha actualizado.");
        } catch (Exception e) {
            mensajeError("Se detuvo el proceso en el método: editarTratamiento.");
        }
    }

    //Método para eliminar un Tratamiento (cat_tratamientos_listado.xhtml)
    public void eliminarTratamiento() {
        try {
            tratamientoEditar.setTratamientoUsuarioModificacio(appSession.getUsuario().getUsuarioUsuario());
            tratamientoEditar.setTratamientoFechaModificacion(new Date());
            tratamientoEditar.setTratamientoEstado(Boolean.FALSE);
            getTratamientosFacade().edit(tratamientoEditar);
            guardarBitacora("Eliminó un tratamiento (" + tratamientoEditar.getTratamientoNombre() + ").");
            mensajeConfirmacion("El tratamiento se ha eliminado.");
        } catch (Exception e) {
            mensajeError("Se detuvo el proceso en el método: eliminarTratamiento.");
        }
    }

    //Método para guardar una nueva Sucursal (cat_sucursales_nuevo.xhtml)
    public void guardarSucursal() {
        try {
            for (Clinicas clinica : todosSucursalesDisponibles()) {
                if (clinica.getClinicaNombre().equalsIgnoreCase(sucursalNuevo.getClinicaNombre())) {
                    mensajeError("La sucursal ya existe.");
                    return;
                }
            }
            sucursalNuevo.setClinicaUsuarioCreacion(appSession.getUsuario().getUsuarioUsuario());
            sucursalNuevo.setClinicaFechaCreacion(new Date());
            sucursalNuevo.setClinicaEstado(Boolean.TRUE);
            getClinicasFacade().create(sucursalNuevo);
            direccionNuevo.setClinicaId(new Clinicas(sucursalNuevo.getClinicaId()));
            getDireccionesFacade().create(direccionNuevo);
            for (Insumos insu : todosInsumosDisponibles()) {
                existenciaNuevo.setClinicaId(new Clinicas(sucursalNuevo.getClinicaId()));
                existenciaNuevo.setInsumoId(new Insumos(insu.getInsumoId()));
                existenciaNuevo.setExistenciaCantidad(0.0);
                getExistenciasFacade().create(existenciaNuevo);
                existenciaNuevo = new Existencias();
            }
            guardarBitacora("Registró una sucursal (" + sucursalNuevo.getClinicaNombre() + ").");
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
    public void editarSucursal() {
        try {
            for (Clinicas clinica : todosSucursalesDisponibles()) {
                if (clinica.getClinicaNombre().equalsIgnoreCase(sucursalEditar.getClinicaNombre())) {
                    if(!(clinica.getClinicaId().toString().equals(sucursalEditar.getClinicaId().toString()))){
                        mensajeError("La sucursal ya existe.");
                        return;
                    }
                }
            }
            sucursalEditar.setClinicaUsuarioModificacion(appSession.getUsuario().getUsuarioUsuario());
            sucursalEditar.setClinicaFechaModificacion(new Date());
            getClinicasFacade().edit(sucursalEditar);
            guardarBitacora("Editó una sucursal (" + sucursalEditar.getClinicaNombre() + ").");
            mensajeConfirmacion("La sucursal se ha actualizado.");
        } catch (Exception e) {
            mensajeError("Se detuvo el proceso en el método: editarSucursal.");
        }
    }

    //Método para eliminar una Sucursal (cat_sucursales_listado.xhtml)
    public void eliminarSucursal() {
        try {
            sucursalEditar.setClinicaUsuarioModificacion(appSession.getUsuario().getUsuarioUsuario());
            sucursalEditar.setClinicaFechaModificacion(new Date());
            sucursalEditar.setClinicaEstado(Boolean.FALSE);
            getClinicasFacade().edit(sucursalEditar);
            guardarBitacora("Eliminó una sucursal (" + sucursalEditar.getClinicaNombre() + ").");
            mensajeConfirmacion("La sucursal se ha eliminado.");
        } catch (Exception e) {
            mensajeError("Se detuvo el proceso en el método: eliminarSucursal.");
        }
    }

    //Método para editar una Dirección (cat_sucursales_editar.xhtml)
    public void editarDireccion() {
        try {
            getDireccionesFacade().edit(direccionEditar);
            mensajeConfirmacion("La direccion se ha actualizado.");
        } catch (Exception e) {
            mensajeError("Se detuvo el proceso en el método: editarDireccion.");
        }
    }

    //Método para guardar una nueva Patologia (cat_patologias_nuevo.xhtml)
    public void guardarPatologia() {
        try {
            for (Patologias patologia : todosPatologiasDisponibles()) {
                if (patologia.getPatologiaNombre().equalsIgnoreCase(patologiaNuevo.getPatologiaNombre())) {
                    mensajeError("La patologia ya existe.");
                    return;
                }
            }
            patologiaNuevo.setPatologiaUsuarioCreacion(appSession.getUsuario().getUsuarioUsuario());
            patologiaNuevo.setPatologiaFechaCreacion(new Date());
            patologiaNuevo.setPatologiaEstado(Boolean.TRUE);
            getPatologiasFacade().create(patologiaNuevo);
            guardarBitacora("Registró una patología (" + patologiaNuevo.getPatologiaNombre() + ").");
            patologiaNuevo = new Patologias();
            mensajeConfirmacion("La patología se ha guardado.");
        } catch (Exception e) {
            mensajeError("Se detuvo el proceso en el método: guardarPatologia.");
        }
    }

    //Método para editar una Patologia (cat_patologias_editar.xhtml)
    public void editarPatologia() {
        try {
            for (Patologias patologia : todosPatologiasDisponibles()) {
                if (patologia.getPatologiaNombre().equalsIgnoreCase(patologiaEditar.getPatologiaNombre())) {
                    if(!(patologia.getPatologiaId().toString().equals(patologiaEditar.getPatologiaId().toString()))){
                        mensajeError("La patologia ya existe.");
                        return;
                    }
                }
            }
            patologiaEditar.setPatologiaUsuarioModificacio(appSession.getUsuario().getUsuarioUsuario());
            patologiaEditar.setPatologiaFechaModificacion(new Date());
            getPatologiasFacade().edit(patologiaEditar);
            guardarBitacora("Editó una patología (" + patologiaEditar.getPatologiaNombre() + ").");
            mensajeConfirmacion("La patologia se ha actualizado.");
        } catch (Exception e) {
            mensajeError("Se detuvo el proceso en el método: editarPatologia.");
        }
    }

    //Método para eliminar una Patologia (cat_patologias_listado.xhtml)
    public void eliminarPatologia() {
        try {
            patologiaEditar.setPatologiaUsuarioModificacio(appSession.getUsuario().getUsuarioUsuario());
            patologiaEditar.setPatologiaFechaModificacion(new Date());
            patologiaEditar.setPatologiaEstado(Boolean.FALSE);
            getPatologiasFacade().edit(patologiaEditar);
            guardarBitacora("Eliminó una patología (" + patologiaEditar.getPatologiaNombre() + ").");
            mensajeConfirmacion("La patologia se ha eliminado.");
        } catch (Exception e) {
            mensajeError("Se detuvo el proceso en el método: eliminarPatologia.");
        }
    }

    //Método para guardar un nuevo medico y su dirección (cat_medicos_nuevo.xhtml)
    public void guardarMedico() {
        try {
            for (Medicos medico : todosMedicosDisponibles()) {
                if (medico.getMedicoPrimerNombre().equalsIgnoreCase(medicoNuevo.getMedicoPrimerNombre()) && medico.getMedicoSegundoNombre().equalsIgnoreCase(medicoNuevo.getMedicoSegundoNombre()) && medico.getMedicoPrimerApellido().equalsIgnoreCase(medicoNuevo.getMedicoPrimerApellido()) && medico.getMedicoSegundoApellido().equalsIgnoreCase(medicoNuevo.getMedicoSegundoApellido())) {
                    mensajeError("El médico ya existe.");
                    return;
                }
            }
            medicoNuevo.setMedicoUsuarioCreacion(appSession.getUsuario().getUsuarioUsuario());
            medicoNuevo.setMedicoFechaCreacion(new Date());
            medicoNuevo.setMedicoEstado(Boolean.TRUE);
            getMedicosFacade().create(medicoNuevo);
            direccionNuevo.setMedicoId(new Medicos(medicoNuevo.getMedicoId()));
            getDireccionesFacade().create(direccionNuevo);
            guardarBitacora("Registró un médico (" + medicoNuevo.getMedicoPrimerNombre() + " " + medicoNuevo.getMedicoPrimerApellido() + ").");
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
    public void editarMedico() {
        try {
            for (Medicos medico : todosMedicosDisponibles()) {
                if (medico.getMedicoPrimerNombre().equalsIgnoreCase(medicoEditar.getMedicoPrimerNombre()) && medico.getMedicoSegundoNombre().equalsIgnoreCase(medicoEditar.getMedicoSegundoNombre()) && medico.getMedicoPrimerApellido().equalsIgnoreCase(medicoEditar.getMedicoPrimerApellido()) && medico.getMedicoSegundoApellido().equalsIgnoreCase(medicoEditar.getMedicoSegundoApellido())) {
                    if(!(medico.getMedicoId().toString().equals(medicoEditar.getMedicoId().toString()))){
                        mensajeError("El médico ya existe.");
                        return;
                    }
                }
            }
            medicoEditar.setMedicoUsuarioModificacion(appSession.getUsuario().getUsuarioUsuario());
            medicoEditar.setMedicoFechaModificacion(new Date());
            getMedicosFacade().edit(medicoEditar);
            guardarBitacora("Editó un médico (" + medicoEditar.getMedicoPrimerNombre() + " " + medicoEditar.getMedicoPrimerApellido() + ").");
            mensajeConfirmacion("El médico se ha actualizado.");
        } catch (Exception e) {
            mensajeError("Se detuvo el proceso en el método: editarMedico.");
        }
    }

    //Método para eliminar un Médico (cat_medicos_listado.xhtml)
    public void eliminarMedico() {
        try {
            medicoEditar.setMedicoUsuarioModificacion(appSession.getUsuario().getUsuarioUsuario());
            medicoEditar.setMedicoFechaModificacion(new Date());
            medicoEditar.setMedicoEstado(Boolean.FALSE);
            getMedicosFacade().edit(medicoEditar);
            guardarBitacora("Eliminó un médico (" + medicoEditar.getMedicoPrimerNombre() + " " + medicoEditar.getMedicoPrimerApellido() + ").");
            mensajeConfirmacion("El médico se ha eliminado.");
        } catch (Exception e) {
            mensajeError("Se detuvo el proceso en el método: eliminarMedico.");
        }
    }

    //Método para guardar un nuevo Usuario (cat_usuarios_nuevo.xhtml)
    public void guardarUsuario() {
        try {
            for (Usuarios usuario : todosUsuarios()) {
                if (usuarioNuevo.getUsuarioUsuario().equals(usuario.getUsuarioUsuario())) {
                    mensajeError("Ya existe una cuenta con el mismo nombre de usuario");
                    return;
                }
            }
            usuarioNuevo.setUsuarioFechaCreacion(new Date());
            usuarioNuevo.setRolId(new Roles(rolId));
            usuarioNuevo.setUsuarioIntentoFallido(0);
            usuarioNuevo.setUsuarioEstado(Boolean.TRUE);
            usuarioNuevo.setUsuarioBloqueado(Boolean.TRUE);
            usuarioNuevo.setUsuarioActivacion(Boolean.TRUE);
            usuarioNuevo.setUsuarioCodigo((int) (Math.random() * 999) + 999);
            usuarioNuevo.setUsuarioContrasenia(DigestUtils.md5Hex(usuarioNuevo.getUsuarioContrasenia()));
            if (rolId == 3) {
                usuarioNuevo.setMedicoId(new Medicos(medicoId));
                medicoSeleccionado = getMedicosFacade().find(medicoId);
            }
            if (rolId == 5) {
                usuarioNuevo.setPacienteId(new Pacientes(pacienteId));
                pacienteSeleccionado = getPacientesFacade().find(pacienteId);
            }
            getUsuariosFacade().create(usuarioNuevo);
            if (rolId == 2 || rolId == 3) {
                medicoSeleccionado.setMedicoUsuario(usuarioNuevo.getUsuarioUsuario());
                getMedicosFacade().edit(medicoSeleccionado);
            }
            //if(rolId == 5){
            //pacienteSeleccionado.setPacienteUsuarioUsuario(usuarioNuevo.getUsuarioUsuario());
            //  getPacientesFacade().edit(pacienteSeleccionado);
            //}
            guardarBitacora("Registró un usuario (" + usuarioNuevo.getUsuarioUsuario() + ").");
            usuarioNuevo = new Usuarios();
            medicoSeleccionado = new Medicos();
            pacienteSeleccionado = new Pacientes();
            pacienteId = 0;
            rolId = 0;
            //guardarBitacora("Guardó un usuario.");
            mensajeConfirmacion("Usuario creado.");
        } catch (Exception e) {
            mensajeError("Se detuvo el proceso en el método: guardarUsuario.");
        }
    }

    //Método para editar un Usuario (cat_usuarios_editar.xhtml)
    public void editarUsuario() {
        try {
            getUsuariosFacade().edit(usuarioEditar);
            guardarBitacora("Actualizó un usuario.");
            mensajeConfirmacion("Usuario guardado.");
        } catch (Exception e) {
            mensajeError("Se detuvo el proceso en el método: editarUsuario.");
        }
    }

    //Método para eliminar un Usuario (cat_usuarios_listado.xhtml)
    public void eliminarUsuario() {
        try {
            usuarioEditar.setUsuarioFechaModificacion(fechaActual);
            usuarioEditar.setUsuarioEstado(Boolean.FALSE);
            getUsuariosFacade().edit(usuarioEditar);
            guardarBitacora("Eliminó un usuario (" + usuarioEditar.getUsuarioUsuario() + ").");
            mensajeConfirmacion("El usuario se ha eliminado.");
        } catch (Exception e) {
            mensajeError("Se detuvo el proceso en el método: eliminarUsuario.");
        }
    }

    // Método para extraer el teléfono de los medicos (cat_medicos_listado.xhtml)
    public String telefonoMedico(Medicos medico) {

        if (medico.getMedicoTelefonoMovil() != null) {
            return medico.getMedicoTelefonoMovil();
        }
        if (medico.getMedicoTelefonoCasa() != null) {
            return medico.getMedicoTelefonoCasa();
        }
        return "Sin teléfono";
    }

    // Método para extraer el teléfono de las sucursales (cat_sucursales_listado.xhtml)
    public String telefonoSucursal(Clinicas clinica) {

        if (clinica.getClinicaTelefonoFijo() != null) {
            return clinica.getClinicaTelefonoFijo();
        }
        if (clinica.getClinicaTelefonoMovil() != null) {
            return clinica.getClinicaTelefonoMovil();
        }
        return "Sin teléfono";
    }

    //Método para cargar sucursal seleccionada para consultar. (cat_sucursales_consultar.xhtml)
    public void cargarSucursalConsultar() {
        sucursalConsultar = getClinicasFacade().find(sucursalId);
        this.direccionConsultar = getDireccionesFacade().direccionPorSucursal(sucursalConsultar.getClinicaId());
    }

    //Método para cargar sucursal seleccionada para editar. (cat_sucursales_editar.xhtml)
    public void cargarSucursalEditar() {
        sucursalEditar = getClinicasFacade().find(sucursalId);
        this.direccionEditar = getDireccionesFacade().direccionPorSucursal(sucursalEditar.getClinicaId());
        //this.departamentoId = direccionEditar.getMunicipioId().getDepartamentoId().getDepartamentoId();
        //this.municipioId = direccionEditar.getMunicipioId().getMunicipioId();
    }

    //Método para cargar médico seleccionado para consultar. (cat_medicos_consultar.xhtml)
    public void cargarMedicoConsultar() {
        medicoConsultar = getMedicosFacade().find(medicoId);
        this.direccionConsultar = getDireccionesFacade().direccionPorMedico(medicoConsultar.getMedicoId());
    }

    //Método para cargar médico seleccionado para editar. (cat_medicos_editar.xhtml)
    public void cargarMedicoEditar() {
        medicoEditar = getMedicosFacade().find(medicoId);
        this.direccionEditar = getDireccionesFacade().direccionPorMedico(medicoEditar.getMedicoId());
    }

    //Método para cargar tratamiento seleccionado para editar. (cat_tratamientos_editar.xhtml)
    public void cargarTratamiento() {
        tratamientoEditar = getTratamientosFacade().find(tratamientoId);
    }

    //Método para cargar usuario seleccionado para editar. (cat_usuarios_editar.xhtml)
    public void cargarUsuario() {
        usuarioEditar = getUsuariosFacade().find(usuarioUsuario);
    }

    //Método para cargar patología seleccionada para editar. (cat_patologias_editar.xhtml)
    public void cargarPatologia() {
        patologiaEditar = getPatologiasFacade().find(patologiaId);
    }

    //Método para cargar tipo de insumo seleccionado para editar. (cat_tipoinsumos_editar.xhtml)
    public void cargarTipoInsumo() {
        tipoInsumoEditar = getTiposInsumosFacade().find(tipoInsumoId);
    }

    //Método para cargar unidad de medida seleccionada para editar. (cat_unidadesmedidas_editar.xhtml)
    public void cargarUnidadMedida() {
        unidadMedidaEditar = getUnidadesMedidasFacade().find(unidadMedidaId);
    }

    //Método para cargar usuario seleccionado para consultar. (cat_usuarios_consultar.xhtml)
    public void cargarUsuarioConsultar() {
        usuarioConsultar = getUsuariosFacade().find(usuarioUsuario);
    }

    //Método para cargar usuario seleccionado para editar. (cat_usuarios_editar.xhtml)
    public void cargarUsuarioEditar() {
        usuarioEditar = getUsuariosFacade().find(usuarioUsuario);
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

    //Metodo que resetea valores en formulario de nuevo usuario (cat_usuarios_nuevo)
    public void resetearUsuario() {
        habilitarDeshabilitar();
        usuarioNuevo = new Usuarios();
        usuarioNuevo.setUsuarioContrasenia(getPassword());
        medicoId = 0;
        pacienteId = 0;
    }

    //Metodo que carga la información de un médico seleccionado (cat_usuarios_nuevo)
    public void cargarInformacionMedico() {
        medicoSeleccionado = getMedicosFacade().find(medicoId);
        usuarioNuevo.setUsuarioPrimerNombre(medicoSeleccionado.getMedicoPrimerNombre());
        usuarioNuevo.setUsuarioSegundoNombre(medicoSeleccionado.getMedicoSegundoNombre());
        usuarioNuevo.setUsuarioPrimerApellido(medicoSeleccionado.getMedicoPrimerApellido());
        usuarioNuevo.setUsuarioSegundoApellido(medicoSeleccionado.getMedicoSegundoApellido());
        usuarioNuevo.setUsuarioCorreo(medicoSeleccionado.getMedicoCorreo());
        usuarioNuevo.setUsuarioTelefono(medicoSeleccionado.getMedicoTelefonoCasa());
    }

    //Metodo que carga la información de un paciente seleccionado (cat_usuarios_nuevo)
    public void cargarInformacionPaciente() {
        pacienteSeleccionado = getPacientesFacade().find(pacienteId);
        usuarioNuevo.setUsuarioPrimerNombre(pacienteSeleccionado.getPacientePrimerNombre());
        usuarioNuevo.setUsuarioSegundoNombre(pacienteSeleccionado.getPacienteSegundoNombre());
        usuarioNuevo.setUsuarioPrimerApellido(pacienteSeleccionado.getPacientePrimerApellido());
        usuarioNuevo.setUsuarioSegundoApellido(pacienteSeleccionado.getPacienteSegundoApellido());
        usuarioNuevo.setUsuarioCorreo(pacienteSeleccionado.getPacienteCorreo());
        usuarioNuevo.setUsuarioTelefono(pacienteSeleccionado.getPacienteTelefonoCasa());
    }

    //Metodo que carga la informacion de un paciente seleccionado (cita_clinica_paciente_nuevo.xhtml)
    public void cargarInformacionPacienteDashboard() {
        rolId = 5;
        usuarioNuevo = new Usuarios();
        usuarioNuevo.setUsuarioContrasenia(getPassword());
        pacienteSeleccionado = getPacientesFacade().find(pacienteId);
        usuarioNuevo.setUsuarioPrimerNombre(pacienteSeleccionado.getPacientePrimerNombre());
        usuarioNuevo.setUsuarioSegundoNombre(pacienteSeleccionado.getPacienteSegundoNombre());
        usuarioNuevo.setUsuarioPrimerApellido(pacienteSeleccionado.getPacientePrimerApellido());
        usuarioNuevo.setUsuarioSegundoApellido(pacienteSeleccionado.getPacienteSegundoApellido());
        usuarioNuevo.setUsuarioCorreo(pacienteSeleccionado.getPacienteCorreo());
        usuarioNuevo.setUsuarioTelefono(pacienteSeleccionado.getPacienteTelefonoCasa());
    }

    //Método para habilitar/deshabilitar campo de nombre (cat_usuarios_nuevo)
    public void habilitarDeshabilitar() {
        if (rolId == 3) {
            banderaRol = true;
        } else {
            banderaRol = false;
        }
    }

    //Método para guardar un nuevo Usuario (cita_clinica_paciente_usuario.xhtml)
    public void guardarUsuarioSugerencia() {
        try {
            for (Usuarios usuario : todosUsuarios()) {
                if (usuarioNuevo.getUsuarioUsuario().equals(usuario.getUsuarioUsuario())) {
                    mensajeError("Ya existe una cuenta con el mismo nombre de usuario");
                    return;
                }
            }
            usuarioNuevo.setUsuarioFechaCreacion(new Date());
            usuarioNuevo.setRolId(new Roles(rolId));
            usuarioNuevo.setUsuarioIntentoFallido(0);
            usuarioNuevo.setUsuarioEstado(Boolean.TRUE);
            usuarioNuevo.setUsuarioBloqueado(Boolean.TRUE);
            usuarioNuevo.setUsuarioActivacion(Boolean.TRUE);
            System.out.println("controllers.CatalogosBean.guardarUsuarioSugerencia() rolId" + rolId);
            if (rolId == 5) {
                //Pacientes p = getPacientesFacade().find(pacienteId);
                //pacienteSeleccionado.setPacienteUsuarioUsuario(usuarioNuevo.getUsuarioUsuario());
                usuarioNuevo.setPacienteId(pacienteSeleccionado);
                //getPacientesFacade().edit(pacienteSeleccionado);
            }
            getUsuariosFacade().create(usuarioNuevo);

            if (rolId==5 && citaUsuario>0) {
                citaEditar = citasFacade.find(citaUsuario);
                citaEditar.setUsuarioUsuario(usuarioNuevo);
                citasFacade.edit(citaEditar);
            }
            guardarBitacora("Registró un usuario (" + usuarioNuevo.getUsuarioUsuario() + ").");
            usuarioNuevo = new Usuarios();
            pacienteId = 0;
            rolId = 0;
            mensajeConfirmacion("Usuario creado.");
        } catch (Exception e) {
            mensajeError("Se detuvo el proceso en el método: guardarUsuario.");
        }
    }

    private boolean banderaRol;
    private String usuarioNombre;

    public boolean isBanderaRol() {
        return banderaRol;
    }

    public void setBanderaRol(boolean banderaRol) {
        this.banderaRol = banderaRol;
    }

    public String getUsuarioNombre() {
        return usuarioNombre;
    }

    public void setUsuarioNombre(String usuarioNombre) {
        this.usuarioNombre = usuarioNombre;
    }

    //Método para generar contraseña de 8 dígitos (cat_usuarios_nuevo.xhtml)
    public static String NUMEROS = "0123456789";
    public static String MAYUSCULAS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    public static String MINUSCULAS = "abcdefghijklmnopqrstuvwxyz";
    public static String ESPECIALES = "ñÑ";

    public static String getPinNumber() {
        return getPassword(NUMEROS, 4);
    }

    public static String getPassword() {
        return getPassword(8);
    }

    public static String getPassword(int length) {
        return getPassword(NUMEROS + MAYUSCULAS + MINUSCULAS, length);
    }

    public static String getPassword(String key, int length) {
        String pswd = "";
        for (int i = 0; i < length; i++) {
            pswd += (key.charAt((int) (Math.random() * key.length())));
        }
        return pswd;
    }

    public Date fechaMaximaMedico(){
        Date fechaMaxima;
        int anio;
        fechaMaxima = new Date();
        anio = fechaMaxima.getYear();
        fechaMaxima.setYear(anio - 23);
        return fechaMaxima;
    }
    
    public Date fechaMinimaMedico(){
        Date fechaMinima;
        int anio;
        fechaMinima = new Date();
        anio = fechaMinima.getYear();
        fechaMinima.setYear(anio - 80);
        return fechaMinima;
    }
    
    public Date fechaMaximaMedicoEditar(){
        Date fechaMaxima;
        int anio;
        fechaMaxima = medicoEditar.getMedicoFechaCreacion();
        anio = fechaMaxima.getYear();
        fechaMaxima.setYear(anio + 57);
        return fechaMaxima;
    }
    
    public Date fechaMinimaMedicoEditar(){
        Date fechaMinima;
        int anio;
        fechaMinima = medicoEditar.getMedicoFechaCreacion();
        anio = fechaMinima.getYear();
        fechaMinima.setYear(anio - 80);
        return fechaMinima;
    }

}
