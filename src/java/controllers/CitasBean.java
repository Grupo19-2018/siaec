package controllers;

import dao.BitacoraFacade;
import util.Horario;
import util.Mensajes;
import dao.CitasFacade;
import dao.ClinicasFacade;
import dao.ConfiguracionesFacade;
import dao.MedicosFacade;
import dao.PacientesFacade;
import dao.UsuariosFacade;
import entities.Bitacora;
import entities.Citas;
import entities.Clinicas;
import entities.Configuraciones;
import entities.Medicos;
import entities.Pacientes;
import entities.Submenus;
import entities.Usuarios;
import java.io.IOException;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Calendar;
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
import util.CorreoBasico;
import util.CorreoPlantilla;

@ManagedBean(name = "citasBean")
@ViewScoped
public class CitasBean implements Serializable {

//****************************************************************************//
//                          Declaración de variables                          //
//****************************************************************************//
    @EJB
    private BitacoraFacade bitacoraFacade;
    private Bitacora bitacoraNueva = new Bitacora();

    @EJB
    private CitasFacade citasFacade;

    @EJB
    private ConfiguracionesFacade configuracionFacade;
    private Configuraciones configuracionCorreo = new Configuraciones();

    private Citas citaNuevo = new Citas();
    private Citas citaConsultar = new Citas();
    private Citas citaEditar = new Citas();

    private Calendar citaEditarFecha = Calendar.getInstance();
    private Calendar citaEditarHora = Calendar.getInstance();

    private Clinicas citasEditarSucursal = new Clinicas();
    private int idEliminar;

    @EJB
    private ClinicasFacade clinicasFacade;
    private Integer clinicaSeleccionada = 0; //Seleccionar sucursal para la tabla. 

    @EJB
    private MedicosFacade odontologosFacade;

    @EJB
    private PacientesFacade pacienteFacade;
    private Integer pacienteId = 0;

    @EJB
    private UsuariosFacade usuarioFacade;

    private Date fechaActual = new Date();
    private Date citaDia = new Date();
    private Integer horaE;
    private int citaEditarId;                     // Varible para recibir en url
    private int citaConsultarId;                  // Varible para recibir en url
    private int citapantalla = 0;                 // Varible para recibir en url
    private int retorno = 0;                      // Varible para recibir en url
    private final Mensajes msj = new Mensajes();
    private String nombre = "";                   // Sustituyendo cita_nombres
    private String apellido = "";                 // Sustituyendo cita_apellidos
    private String telefono = "";                 // Sustituyendo cita_telefono
    private String correo = "";                   // Sustituyendo cita_correo

    @ManagedProperty(value = "#{appSession}")     // Sesion
    private AppSession appSession;

//****************************************************************************//
//                  Métodos para obtener listas por entidades                 //
//****************************************************************************//
//Usado en:
    public List<Clinicas> todasClinicas() {
        return getClinicasFacade().findAll();
    }

//Usado en:
    public List<Medicos> todoOdontologos() {
        return getOdontologosFacade().findAll();
    }

//Metodos para mostrar las citas aprobadas, solo se mostraran las que no esten vencidas.
//Usada en: cita_clinica_listado_aprobadas.xhtml
    public List<Citas> todasCitasConfirmadas() {
        if (clinicaSeleccionada != 0) {
            return getCitasFacade().citasConfirmadas(clinicaSeleccionada);
        }
        return getCitasFacade().citasConfirmadas();
    }

//Metodo para mostrar las citas aprobadas del dia. 
//Usada en: asistente.xhtml
    public List<Citas> todasCitasConfirmadasHoy() {
        if (clinicaSeleccionada != 0) {
            return getCitasFacade().citasConfirmadasHoy(clinicaSeleccionada);
        }
        return getCitasFacade().citasConfirmadasHoy();
    }

//Metodo para mostrar las citas pendientes. Estado 1.
//Usado en: cita_clinica_listado_pendiente.xhtml
    public List<Citas> todasCitasPendientes() {
        if (clinicaSeleccionada != 0) {
            return getCitasFacade().citasPendientes(clinicaSeleccionada);
        }
        return getCitasFacade().citasPendientes();
    }

//Metodo similar a  todasCitasPendientes(). 
//Usado en:
    public List<Citas> todasCitasReservadas() {
        return getCitasFacade().citasReservadas();
    }

//Metodo para cargar todas las citas por paciente.
//Usado en: cita_paciente_historico.
    public List<Citas> todasCitasPorPaciente() {
        if (appSession.getUsuario() != null) {
            if (appSession.getUsuario().getPacienteId() != null) {
                return citasFacade.citasUsuarioTodas(appSession.getUsuario().getUsuarioUsuario(), appSession.getUsuario().getPacienteId().getPacienteId());
            }
            return citasFacade.citasUsuarioTodas(appSession.getUsuario().getUsuarioUsuario());
        }
        return null;
    }

//Metodo para cargar todas las citas de la clinica.
//Usado en: cita_clinica_historico.xhtml
    public List<Citas> todasCitas() {
        if (clinicaSeleccionada != 0) {
            return getCitasFacade().historicoPorClinica(clinicaSeleccionada);
        }
        return getCitasFacade().findAll();
    }

//Metodo para cargar todos los expedientes.
//Usado en:cita_clinica_nueva.xhtml
    public List<Pacientes> todosPacientes() {
        return getPacienteFacade().findAll();
    }

//****************************************************************************//
//                 Métodos Get para obtener datos de entidades                //
//****************************************************************************//
    public BitacoraFacade getBitacoraFacade() {
        return bitacoraFacade;
    }

    public CitasFacade getCitasFacade() {
        return citasFacade;
    }

    public ClinicasFacade getClinicasFacade() {
        return clinicasFacade;
    }

    public MedicosFacade getOdontologosFacade() {
        return odontologosFacade;
    }

    public PacientesFacade getPacienteFacade() {
        return pacienteFacade;
    }

    public ConfiguracionesFacade getConfiguracionFacade() {
        return configuracionFacade;
    }

    public UsuariosFacade getUsuarioFacade() {
        return usuarioFacade;
    }
//****************************************************************************//
//                             Métodos Get y SET                              //
//****************************************************************************//

    public Date getCitaDia() {
        return citaDia;
    }

    public void setCitaDia(Date citaDia) {
        this.citaDia = citaDia;
    }

    public Citas getCitaNuevo() {
        return citaNuevo;
    }

    public void setCitaNuevo(Citas citaNuevo) {
        this.citaNuevo = citaNuevo;
    }

    public Integer getHoraE() {
        return horaE;
    }

    public void setHoraE(Integer horaE) {
        this.horaE = horaE;
    }

    public Date getFechaActual() {
        return fechaActual;
    }

    public void setFechaActual(Date fechaActual) {
        this.fechaActual = fechaActual;
    }

    public Citas getCitaConsultar() {
        return citaConsultar;
    }

    public void setCitaConsultar(Citas citaConsultar) {
        this.citaConsultar = citaConsultar;
    }

    public Citas getCitaEditar() {
        return citaEditar;
    }

    public void setCitaEditar(Citas citaEditar) {
        this.citaEditar = citaEditar;
    }

    public int getIdEliminar() {
        return idEliminar;
    }

    public void setIdEliminar(int idEliminar) {
        this.idEliminar = idEliminar;
    }

    public AppSession getAppSession() {
        return appSession;
    }

    public void setAppSession(AppSession appSession) {
        this.appSession = appSession;
    }

    public Integer getClinicaSeleccionada() {
        return clinicaSeleccionada;
    }

    public void setClinicaSeleccionada(Integer clinicaSeleccionada) {
        this.clinicaSeleccionada = clinicaSeleccionada;
    }

    public int getCitaEditarId() {
        return citaEditarId;
    }

    public void setCitaEditarId(int citaEditarId) {
        this.citaEditarId = citaEditarId;
    }

    public int getCitapantalla() {
        return citapantalla;
    }

    public void setCitapantalla(int citapantalla) {
        this.citapantalla = citapantalla;
    }

    public int getRetorno() {
        return retorno;
    }

    public void setRetorno(int retorno) {
        this.retorno = retorno;
    }

    public int getCitaConsultarId() {
        return citaConsultarId;
    }

    public void setCitaConsultarId(int citaConsultarId) {
        this.citaConsultarId = citaConsultarId;
    }

    public Integer getPacienteId() {
        return pacienteId;
    }

    public void setPacienteId(Integer pacienteId) {
        this.pacienteId = pacienteId;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
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

    //Método para mostrar mensaje de error en el sistema.
    public void mensajeError(String mensaje) {
        FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_ERROR, "¡Error!", mensaje);
        RequestContext.getCurrentInstance().showMessageInDialog(message);
    }

//Carga la cita seleccionada a la variable consulta. 
//Metodo usado en cita_clinica_consultar.xhtml
    public void cargarCitaConsultar() {
        citaConsultar = getCitasFacade().find(citaConsultarId);
    }

//Metodo para cargar los horarios disponibles para el paciente.
//Usado en: cita_paciente_nueva.xhtml,  cita_clinica_editar.xhtml, cita_clinica_nuevo.xhtml
    public List<Horario> horariosDisponibleSucursalPaciente() {
        List<Horario> horarios = new ArrayList<>();
        horarios.clear();
        String s;
        Boolean hayMedico = false;
        Calendar clinicaInicio = Calendar.getInstance();
        Calendar clinicaFin = Calendar.getInstance();
        Integer medico = 0;
        Integer modulos = 0;
        if (clinicaSeleccionada != 0) {
            if (getCitapantalla() == 1) {
                citaNuevo.setClinicaId(getClinicasFacade().find(clinicaSeleccionada));
                clinicaInicio.setTime(citaNuevo.getClinicaId().getClinicaHorarioApertura());
                clinicaFin.setTime(citaNuevo.getClinicaId().getClinicaHorarioCierre());
                modulos = citaNuevo.getClinicaId().getClinicaModulo();
                if (citaNuevo.getMedicoId() != null) {
                    medico = citaNuevo.getMedicoId().getMedicoId();
                    hayMedico = true;
                }
            }
            if (getCitapantalla() == 2) {
                citaEditar.setClinicaId(getClinicasFacade().find(clinicaSeleccionada));
                clinicaInicio.setTime(citaEditar.getClinicaId().getClinicaHorarioApertura());
                clinicaFin.setTime(citaEditar.getClinicaId().getClinicaHorarioCierre());
                modulos = citaEditar.getClinicaId().getClinicaModulo();
                if (citaEditar.getMedicoId() != null) {
                    medico = citaEditar.getMedicoId().getMedicoId();
                    hayMedico = true;
                }
            }
        }
        if (clinicaSeleccionada != 0 && (getCitapantalla() == 1 || getCitapantalla() == 2)) {
            Calendar citaPreguntar = Calendar.getInstance();
            citaPreguntar.setTime(citaDia);
            citaPreguntar.set(Calendar.MINUTE, 0);
            citaPreguntar.set(Calendar.SECOND, 0);
            for (int i = clinicaInicio.get(Calendar.HOUR_OF_DAY); i < clinicaFin.get(Calendar.HOUR_OF_DAY); i++) {
                citaPreguntar.set(Calendar.HOUR_OF_DAY, i);
                if (i < 13) {
                    s = i + ":00 AM";
                } else {
                    s = (i - 12) + ":00 PM";
                }
                List<Citas> reservadasSucursal = getCitasFacade().citasReservadoSucursal(citaPreguntar.getTime(), clinicaSeleccionada, citaPreguntar.getTime());
                int cantidadCitas = reservadasSucursal.size();
                //System.out.println("Medico seleccionado " + hayMedico);
                //Editando una cita: Mostrando el horario de la cita a editar. 
                if (getCitapantalla() == 2
                        && citaEditarFecha.get(Calendar.YEAR) == citaPreguntar.get(Calendar.YEAR)
                        && citaEditarFecha.get(Calendar.MONTH) == citaPreguntar.get(Calendar.MONTH)
                        && citaEditarFecha.get(Calendar.DAY_OF_MONTH) == citaPreguntar.get(Calendar.DAY_OF_MONTH)
                        && citasEditarSucursal.getClinicaId() == citaEditar.getClinicaId().getClinicaId()) {

                    if (citaEditarHora.get(Calendar.HOUR_OF_DAY) == i) {
                        horaE = citaEditarHora.get(Calendar.HOUR_OF_DAY);
                        horarios.add(new Horario(i, s));
                    } else if (cantidadCitas < modulos) {
                        if (hayMedico == false) {
                            horarios.add(new Horario(i, s));
                        } else {
                            //Buscar medico y horario, si tiene ocupado no poner. 
                            List<Citas> medicoC = getCitasFacade().citasReservadoSucursal(citaPreguntar.getTime(), citaPreguntar.getTime(), medico);
                            if (medicoC.isEmpty()) {
                                horarios.add(new Horario(i, s));
                            }
                        }//Id del medico
                    }
                } else if (cantidadCitas < modulos) {
                    if (hayMedico == false) {
                        horarios.add(new Horario(i, s));
                    } else {
                        //Buscar medico y horario, si tiene ocupado no poner. 
                        List<Citas> medicoC = getCitasFacade().citasReservadoSucursal(citaPreguntar.getTime(), citaPreguntar.getTime(), medico);
                        if (medicoC.isEmpty()) {
                            horarios.add(new Horario(i, s));
                        }
                    }//Id del medico 
                }//Fin de citaNuevo.getClinicaId().getClinicaModulo()
            }
            return horarios;
        } else {
            horarios.clear();
            return horarios;
        }
    }

//Usado en: cita_paciente_nueva.xhtml
    public void guardarCitaPaciente() {
        try {
            Boolean expedieteCita = true;
            if (appSession.getUsuario() != null) {
                if (appSession.getUsuario().getPacienteId() != null) {
                    expedieteCita = getCitasFacade().citaActiva(appSession.getUsuario().getPacienteId().getPacienteId()).isEmpty();
                }
                if (getCitasFacade().citaActiva(appSession.getUsuario().getUsuarioUsuario()).isEmpty() && expedieteCita) {
                    citaNuevo.setCitaFecha(citaDia);
                    Calendar hora = Calendar.getInstance();
                    hora.set(Calendar.HOUR_OF_DAY, horaE);
                    hora.set(Calendar.MINUTE, 0);
                    hora.set(Calendar.SECOND, 0);
                    citaNuevo.setCitaHora(hora.getTime());
                    citaNuevo.setCitaFechaCreacion(new Date());
                    citaNuevo.setCitaHoraCreacion(new Date());
                    citaNuevo.setCitaEstado(1);
                    getCitasFacade().create(citaNuevo);
                    msj.mensajeGuardado("Su cita a sido guardada.");
                } else {
                    msj.mensajeGuardado("Ya posee una cita.");
                }
            } else {
                System.err.println("guardarCitaPaciente(), usuario null");
            }
        } catch (Exception e) {
            msj.mensajeError("Error al guardar la cita.");
        }
    }

//Metodo para guardar cita con expediente. 
//Usado en: cita_clinica_nueva.html
    public void guardarCita() {
        try {
            if (getCitasFacade().citaActiva(pacienteId).isEmpty()) {
                citaNuevo.setCitaFecha(citaDia);
                Calendar hora = Calendar.getInstance();
                hora.set(Calendar.HOUR_OF_DAY, horaE);
                hora.set(Calendar.MINUTE, 0);
                hora.set(Calendar.SECOND, 0);
                citaNuevo.setCitaHora(hora.getTime());
                citaNuevo.setCitaFechaCreacion(new Date());
                citaNuevo.setCitaHoraCreacion(new Date());
                citaNuevo.setPacienteId(new Pacientes(pacienteId));
                citaNuevo.setCitaEstado(2);
                List<Usuarios> existe = usuarioFacade.usuarioPorPaciente(pacienteId);
                if (!existe.isEmpty()) {
                    citaNuevo.setUsuarioUsuario(existe.get(0));
                }
                getCitasFacade().create(citaNuevo);
                guardarBitacora("Registró una cita.");
                citaNuevo = new Citas();
                citaDia = new Date();
                clinicaSeleccionada = 0;
                pacienteId = 0;
                msj.mensajeGuardado("Su cita a sido guardada.");
            } else {
                msj.mensajeConfirmacion("Este paciente tiene una cita registrada.");
            }
        } catch (Exception e) {
            msj.mensajeError("Error al guardar la cita");
        }
    }

//Metodo para eliminar cita del paciente.
//Usado en: paciente.xhtml, cita_clinica_listado_pendiente.xhtml
    public void eliminarCita() {
        try {
            citaEditar.setCitaUsuarioModificacion(appSession.getUsuario().getUsuarioUsuario());
            citaEditar.setCitaFechaModificacion(new Date());
            citaEditar.setCitaEstado(4);
            getCitasFacade().edit(citaEditar);
            guardarBitacora("Canceló una cita.");
            msj.mensajeGuardado("La cita ha sido eliminado.");
        } catch (Exception e) {
            msj.mensajeError("Error al eliminar la cita.");
        }
    }

//Método para mostrar los estados de las citas. 
//Usado en: cita_paciente_historico, cita_clinica_agenda, cita_clinica_lista_confirmar, cita_clinica_lista_pendiente.
    public String estadoCitaPaciente(Integer estado) {
        switch (estado) {
            case 1:
                return "Pendiente";
            case 2:
                return "Confirmada";
            case 3:
                return "Atendida";
            case 4:
                return "Cancelada";
            case 5:
                return "Vencida";
            default:
                return "";
        }
    }

//Retornar si es Dr. o Dra.
//Usado en: asistente.xhtml, cita_paciente_historico.xhtml    
    public String abreviatura(Boolean s) {
        if (s != null) {
            return (s) ? "Dr." : "Dra.";
        }
        return "";
    }

//Colocar la hora y cita en editar cita.
//Usado en cita_clinica_editar.xhtml
    public void editarConsultaHoraCita() {
        citaEditar = getCitasFacade().find(citaEditarId);
        clinicaSeleccionada = citaEditar.getClinicaId().getClinicaId();
        citaDia = citaEditar.getCitaFecha();
        Calendar horaSeleccionada = Calendar.getInstance();
        horaSeleccionada.setTime(citaEditar.getCitaHora());
        citaEditarFecha.setTime(citaEditar.getCitaFecha());
        citaEditarHora.setTime(citaEditar.getCitaHora());
        citasEditarSucursal = citaEditar.getClinicaId();
        horaE = citaEditar.getCitaHora().getHours(); 
    }

//Usado en: cita_clinica_editar.xhtml
    public void actualizarCita() {
        citaEditar.setCitaFecha(citaDia);
        Calendar hora = Calendar.getInstance();
        hora.set(Calendar.HOUR_OF_DAY, horaE);
        hora.set(Calendar.MINUTE, 0);
        hora.set(Calendar.SECOND, 0);
        citaEditar.setCitaHora(hora.getTime());
        citaEditar.setCitaFechaModificacion(new Date());
        getCitasFacade().edit(citaEditar);
        guardarBitacora("Editó una cita.");
        CorreoPlantilla correoP = new CorreoPlantilla();
        String mensaje = correoP.msjCita(citaEditar.getCitaFecha(), citaEditar.getCitaHora(), citaEditar.getClinicaId().getClinicaNombre());
        //Solo cuando cambie a confirmada 
        if (citaEditar.getCitaEstado() == 2) {
            if (citaEditar.getPacienteId() != null) {
                if (citaEditar.getPacienteId().getPacienteNotificarCorreo() == true) {
                    enviarCorreoOptimizado(mensaje, citaEditar.getPacienteId().getPacienteCorreo(), "CITA CONFIRMADA");
                }
            } else {
                enviarCorreoOptimizado(mensaje, citaEditar.getUsuarioUsuario().getUsuarioCorreo(), "CITA CONFIRMADA");
            }
        }
        citaDia = citaEditar.getCitaFecha();
        citaEditarHora.setTime(citaEditar.getCitaHora());
        citaEditarFecha.setTime(citaEditar.getCitaFecha());
        citasEditarSucursal = citaEditar.getClinicaId();
        horaE = hora.get(Calendar.HOUR_OF_DAY);
        msj.mensajeGuardado("Su cita a sido modificada.");
    }

//Correo Notificacion Disminuye 2 seg del metodo anterior, depende de conexion a internet
    public void enviarCorreoOptimizado(String mensaje, String correo, String asunto) {
        try {
            configuracionCorreo = getConfiguracionFacade().find(1);
            if (configuracionCorreo.getConfiguracionCorreoActivo() && !configuracionCorreo.getConfiguracionCorreoCuenta().isEmpty()) {
                CorreoBasico enviarHtml = new CorreoBasico(configuracionCorreo);
                CorreoPlantilla correoP = new CorreoPlantilla();
                String body = correoP.plantillaN1(mensaje);
                enviarHtml.sendMailHTML(correo, asunto, body);
            }
        } catch (Exception e) {
        }
    }

//Usado en: citas_paciente_nueva.xhtml
    public void cargarPaciente() {
        if (appSession.getUsuario() != null) {
            if (appSession.getUsuario().getPacienteId() != null) {
                setNombre(appSession.getUsuario().getPacienteId().getPacientePrimerNombre() + " " + appSession.getUsuario().getPacienteId().getPacienteSegundoNombre());
                setApellido(appSession.getUsuario().getPacienteId().getPacientePrimerApellido() + " " + appSession.getUsuario().getPacienteId().getPacienteSegundoApellido());
                setTelefono(appSession.getUsuario().getPacienteId().getPacienteTelefonoMovil());
                setCorreo(appSession.getUsuario().getPacienteId().getPacienteCorreo());
                citaNuevo.setPacienteId(appSession.getUsuario().getPacienteId());
            } else {
                setNombre(appSession.getUsuario().getUsuarioPrimerNombre() + " " + appSession.getUsuario().getUsuarioSegundoNombre());
                setApellido(appSession.getUsuario().getUsuarioPrimerApellido() + " " + appSession.getUsuario().getUsuarioSegundoApellido());
                setTelefono(appSession.getUsuario().getUsuarioTelefono());
                setCorreo(appSession.getUsuario().getUsuarioCorreo());
            }
            citaNuevo.setCitaEnsala(Boolean.FALSE);
            citaNuevo.setCitaUsuarioCreacion(appSession.getUsuario().getUsuarioUsuario());
            citaNuevo.setUsuarioUsuario(appSession.getUsuario());
        } else {
            System.err.println("Metodo cargar paciente, Usuario Null");
        }
    }

//Metodo para actualizar la cita si el paciente se encuentra en sala. 
//Usado: asistente.xhtml
    public void enSala(Integer cita, Boolean enSala) {
        try {
            citaEditar = getCitasFacade().find(cita);
            citaEditar.setCitaEnsala(enSala);
            getCitasFacade().edit(citaEditar);
        } catch (Exception e) {
            System.out.println("Metodo enSala: No actualizado");
        }
    }

//Identifica que variable se esta usando y le asigna los valores 
//Usada en: citas_paciente_nuevo.xhtml, citas_clinica_editar.xhtml 
    public void pantallaCita(int pantalla) {
        setCitapantalla(pantalla);
    }

//Metodo dinamico para redireccionar el boton cancelar.
//Usado en: cita_clinita_editar.xhtml
    public String redireccionCitaEditar2() {
        switch (retorno) {
            case 1:
                return "Dashboard";
            case 2:
                return "CitasListaPendientes";
            case 3:
                return "CitasListaAprobadas";
            case 5:
                return "AgendaDoctor";
        }
        return "Dashboard";
    }

//Metodo dinamico para redireccionar url  del boton regresar
//Usado en : cita_clinica_consultar.xhtml
    public String redireccionarCitaConsultar() {
        switch (retorno) {
            case 2:
                return "CitasListaConsultarPendientes";
            case 3:
                return "CitasListaConsultarAprobadas";
            case 4:
                return "CitasListadoHistoricoClinica";
            case 5:
                return "AgendaDoctor";
        }
        return "Dashboard";
    }

//Cargar paciente
//Usado en: cita_clinica_nuevo.xhtml
    public void resetearPaciente() {
        citaNuevo = new Citas();
        Pacientes p = getPacienteFacade().find(pacienteId);
        setNombre(p.getPacientePrimerNombre() + " " + p.getPacienteSegundoNombre());
        setApellido(p.getPacientePrimerApellido() + " " + p.getPacienteSegundoApellido());
        setTelefono(p.getPacienteTelefonoMovil());
        setCorreo(p.getPacienteCorreo());
    }

    //Método para verificar si el usuario tiene acceso a la página consultada. (Todas las páginas)
    public void verificaAcceso(int pagina) {
        boolean acceso = false;
        try {
            FacesContext context = FacesContext.getCurrentInstance();
            HttpServletRequest origRequest = (HttpServletRequest) context.getExternalContext().getRequest();
            String contextPath = origRequest.getContextPath();

            if (appSession.getUsuario() == null) {
                FacesContext.getCurrentInstance().getExternalContext().redirect(contextPath + "/login.xhtml");
            } else {
                if (!(appSession.getUsuario().getRolId().getSubmenusList().isEmpty())) {
                    for (Submenus submenu : todosSubmenusDisponibles()) {
                        if (submenu.getSubmenuId() == pagina) {
                            acceso = true;
                        }
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

    public List<Submenus> todosSubmenusDisponibles() {
        return appSession.getUsuario().getRolId().getSubmenusList();
    }

    public String horariosAmPm(Integer i) {
        String s = "";
        if (i != null) {
            if (i > 0) {
                if (i < 13) {
                    s = i + ":00 AM";
                } else {
                    s = (i - 12) + ":00 PM";
                }
            }
        }
        return s;
    }

    public void resetHorarioE() {
        horaE = 0;
    }

    public String nombrePaciente(Usuarios u, Pacientes p) {
        if (p != null) {
            return p.getPacientePrimerNombre() + " " + p.getPacienteSegundoNombre() + " " + p.getPacientePrimerApellido() + " " + p.getPacienteSegundoApellido();
        } else if (u != null) {
            return u.getUsuarioPrimerNombre() + " " + u.getUsuarioSegundoNombre() + " " + u.getUsuarioPrimerApellido() + " " + u.getUsuarioSegundoApellido();
        }
        return "";
    }

    public Boolean cumplenieroDia(Pacientes cumpleaniero) {
        
        if (cumpleaniero != null) {
            Calendar fecha = Calendar.getInstance();
            fecha.setTime(cumpleaniero.getPacienteFechaNacimiento());
            Calendar hoy = Calendar.getInstance();
            if ((fecha.get(Calendar.MONTH) == hoy.get(Calendar.MONTH))
                    && (fecha.get(Calendar.DAY_OF_MONTH) == hoy.get(Calendar.DAY_OF_MONTH))) {
                return true; 
            }
        }
        return false;
    }
    
}
