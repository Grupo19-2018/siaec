package controllers;

import util.Horario;
import util.Mensajes;
import dao.CitasFacade;
import dao.ClinicasFacade;
import dao.MedicosFacade;
import entities.Citas;
import entities.Clinicas;
import entities.Medicos;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.ViewScoped;

@ManagedBean(name = "citasBean")
@ViewScoped
public class CitasBean implements Serializable {

//****************************************************************************//
//                          Declaración de variables                          //
//****************************************************************************//
    @EJB
    private CitasFacade citasFacade;

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

    private Date fechaActual = new Date();
    private Date citaDia = new Date();
    private Integer horaE;
    private int citaEditarId;                     //Varible para recibir en url
    private int citaConsultarId;                  //Varible para recibir en url
    private int citapantalla = 0;                 //Varible para recibir en url
    private int retorno = 0;                      //Varible para recibir en url
    private final Mensajes msj = new Mensajes();

    //Session
    @ManagedProperty(value = "#{appSession}")
    private AppSession appSession;

//****************************************************************************//
//                  Métodos para obtener listas por entidades                 //
//****************************************************************************//
    public List<Clinicas> todasClinicas() {
        return getClinicasFacade().findAll();
    }

    public List<Medicos> todoOdontologos() {
        return getOdontologosFacade().findAll();
    }

//Metodos para mostrar las citas aprobadas, solo se mostraran las que no esten vencidas.
//Usada en: asistente.xhtml
//Estado: En uso.
    public List<Citas> todasCitasAprobadas() {
        if (clinicaSeleccionada != 0) {
            return getCitasFacade().citasAprobadas(clinicaSeleccionada);
        }
        return getCitasFacade().citasAprobadas();
    }

//Metodo para mostrar las citas pendientes. Estado 1.
//Usado en: cita_clinica_listado_pendiente.xhtml
//Estado : En uso. 
    public List<Citas> todasCitasPendientes() {
        if (clinicaSeleccionada != 0) {
            return getCitasFacade().citasPendientes(clinicaSeleccionada);
        }
        return getCitasFacade().citasPendientes();
    }

//Metodo similar a  todasCitasPendientes(). 
//Usado en:
//Estado:
    public List<Citas> todasCitasReservadas() {
        return getCitasFacade().citasReservadas();
    }

//Metodo para cargar todas las citas por paciente.
//Usado en: cita_paciente_historico.
//Estado: En uso.
    public List<Citas> todasCitasPorPaciente() {
        if (appSession.getUsuario() != null) {
            return citasFacade.citasTodas(appSession.getUsuario().getUsuarioUsuario(), appSession.getUsuario().getUsuarioCorreo());
        }
        return null;
    }

//Metodo para cargar todas las citas de la clinica.
//Usado en: cita_clinica_historico.xhtml
//Estado: En uso.
    public List<Citas> todasCitas() {
        if (clinicaSeleccionada != 0) {
            return getCitasFacade().historicoPorClinica(clinicaSeleccionada);
        }
        return getCitasFacade().findAll();
    }

//****************************************************************************//
//                 Métodos Get para obtener datos de entidades                //
//****************************************************************************//
    public CitasFacade getCitasFacade() {
        return citasFacade;
    }

    public ClinicasFacade getClinicasFacade() {
        return clinicasFacade;
    }

    public MedicosFacade getOdontologosFacade() {
        return odontologosFacade;
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

//****************************************************************************//
//                                  Métodos                                   //
//****************************************************************************//
//Carga la cita seleccionada a la variable consulta. 
//Metodo usado en cita_clinica_consultar.xhtml
//Estado: En uso
    public void cargarCitaConsultar() {
        citaConsultar = getCitasFacade().find(citaConsultarId);
    }

//Metodo para cargar los horarios disponibles para el paciente.
//Usado en: cita_paciente_nueva.xhtml
//Estado: En uso.
    public List<Horario> horariosDisponibleSucursalPaciente() {
        List<Horario> horarios = new ArrayList<>();
        horarios.clear();
        Calendar cita = Calendar.getInstance();
        cita.setTime(citaDia);
        String s;
        Boolean hayMedico = false;
        Date inicioClinica = new Date();
        Date finClinica = new Date();
        Integer medico = 0;
        Integer modulos = 0;
        System.out.println("Entra metodo horariosDisponibleSucursalPaciente()");
        if (clinicaSeleccionada != 0) {

            if (getCitapantalla() == 1) {
                citaNuevo.setClinicaId(getClinicasFacade().find(clinicaSeleccionada));
                inicioClinica = citaNuevo.getClinicaId().getClinicaHorarioApertura();
                finClinica = citaNuevo.getClinicaId().getClinicaHorarioCierre();
                modulos = citaNuevo.getClinicaId().getClinicaModulo();
                if (citaNuevo.getMedicoId() != null) {
                    medico = citaNuevo.getMedicoId().getMedicoId();
                    hayMedico = true;
                }

            }
            if (getCitapantalla() == 2) {
                citaEditar.setClinicaId(getClinicasFacade().find(clinicaSeleccionada));
                inicioClinica = citaEditar.getClinicaId().getClinicaHorarioApertura();
                finClinica = citaEditar.getClinicaId().getClinicaHorarioCierre();
                modulos = citaEditar.getClinicaId().getClinicaModulo();
                if (citaEditar.getMedicoId() != null) {
                    medico = citaEditar.getMedicoId().getMedicoId();
                    hayMedico = true;
                }
            }

        }

        if (clinicaSeleccionada != 0 && (getCitapantalla() == 1 || getCitapantalla() == 2)) {
            System.out.println("controllers.CitasBean.horariosDisponibleSucursalPaciente() entra con una sucursal fija");
            Calendar clinicaInicio = Calendar.getInstance();
            Calendar clinicaFin = Calendar.getInstance();
            clinicaInicio.setTime(inicioClinica);
            clinicaFin.setTime(finClinica);

            for (int i = clinicaInicio.get(Calendar.HOUR_OF_DAY); i < clinicaFin.get(Calendar.HOUR_OF_DAY); i++) {
                Calendar citaPreguntar = Calendar.getInstance();
                citaPreguntar.setTime(citaDia);
                citaPreguntar.set(Calendar.HOUR_OF_DAY, i);
                citaPreguntar.set(Calendar.MINUTE, 0);
                citaPreguntar.set(Calendar.SECOND, 0);

                //Actualmente solo son reservadas estado 1, falta comprender a las confirmadas estado 2
                List<Citas> reservadasSucursal = getCitasFacade().citasReservadoSucursal(cita.getTime(), clinicaSeleccionada, citaPreguntar.getTime());
                int cantidadCitas = reservadasSucursal.size();

                if (i < 13) {
                    s = i + ":00 AM";
                } else {
                    s = (i - 12) + ":00 PM";
                }

                //Considerar que el medico solo tiene que tener un solo horario activo
                if (cantidadCitas < modulos) {
                    //if (citaNuevo.getMedicoId() == null) {
                    if (hayMedico) {
                        horarios.add(new Horario(i, s));
                    } else {
                        //Buscar medico y horario, si tiene ocupado no poner. 
                        //Puedo usar variables como 
                        //Para dia cita.getTime()
                        //Para hora citaPreguntar.getTime()
                        List<Citas> medicoC = getCitasFacade().citasReservadoSucursal(cita.getTime(), citaPreguntar.getTime(), medico);
                        /**
                         * for (Citas citas : medicoC) { //
                         * System.out.println("Cita " + citas.getCitaId()); }/*
                         */
                        if (medicoC.isEmpty()) {
                            horarios.add(new Horario(i, s));
                        }
                    }//Id del medico 
                }//Fin de citaNuevo.getClinicaId().getClinicaModulo()
            }
            return horarios;
        } else {
            System.out.println("Citas nuevo paciente apunta a null en sucursal");
            horarios.clear();
            return horarios;
        }
    }

//Metodo para guardar la cita del paciente. 
//Usado en: cita_paciente_nueva.xhtml
//Estado: En uso.
//-Temporalmente se preguntara por el usuario, recordad que esta parte no esta completamente definida,
//que crea la cita, si tiene una con estado 1 o 2, se impedira crear una cita. 
//-Se pregunta si el usuario sigue activo en sesion. 
    public void guardarCitaPaciente() {
        try {
            if (appSession.getUsuario() != null) {
                if (getCitasFacade().citaActiva(appSession.getUsuario().getUsuarioUsuario()).isEmpty()) {
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

//Metodo para guardar cita utilizado en cita_nueva.html
//Estado:
    public void guardarCita() {
        citaNuevo.setCitaFecha(citaDia);
        Calendar hora = Calendar.getInstance();
        hora.set(Calendar.HOUR_OF_DAY, horaE);
        hora.set(Calendar.MINUTE, 0);
        hora.set(Calendar.SECOND, 0);
        citaNuevo.setCitaHora(hora.getTime());
        citaNuevo.setCitaFechaCreacion(new Date());
        citaNuevo.setCitaHoraCreacion(new Date());
        getCitasFacade().create(citaNuevo);
        citaNuevo = new Citas();
        citaDia = new Date();
        msj.mensajeGuardado("Su cita a sido guardada.");
    }

//Metodo para eliminar cita del paciente.
//Usado en: paciente.xhtml, cita_clinica_listado_pendiente.xhtml
//Estado: En uso.
    public void eliminarCita() {
        try {
            citaEditar.setCitaUsuarioModificacion(appSession.getUsuario().getUsuarioUsuario());
            citaEditar.setCitaFechaModificacion(new Date());
            citaEditar.setCitaEstado(4);
            getCitasFacade().edit(citaEditar);
            msj.mensajeGuardado("La cita ha sido eliminado.");
        } catch (Exception e) {
            System.out.println("controllers.CitasBean.eliminarCita()" + e);
            msj.mensajeError("Error al eliminar la cita.");
        }
    }

//Método para refrescar los valores utilizado en cita_nueva.xhtml.
//Estado: En uso
    public void refrescar() {
        citaDia = new Date();
        citaNuevo = new Citas();
        horaE = null;
    }

//Método usado para cargar las proximas citas desde fecha actual, usado en cita_lista_proximas.xhtml
    public List<Citas> citasProximas() {
        Calendar c = Calendar.getInstance();
        c.set(Calendar.HOUR_OF_DAY, 0);
        //System.out.println("Fecha actual " + c.getTime());
        return getCitasFacade().citasProximas(c.getTime());
    }

//Método para mostrar los estados de las citas. 
    public String estadoCita(Integer estado) {
        switch (estado) {
            case 1:
                return "Reservado";
            case 2:
                return "Confirmado";
            case 3:
                return "Atendido";
            case 4:
                return "Cancelado";
            default:
                return "";
        }
    }

//Método para mostrar los estados de las citas. 
//Usado en: cita_paciente_historico.
//Estado: En uso.
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

//Hora no se utiliza partnerr por razones de error con en compilaciond e sesionbean
    public String horacita(Date hora) {
        Calendar c = Calendar.getInstance();
        //System.out.println("Metodo horacita(), class Citas Bean" + c.get(Calendar.HOUR_OF_DAY));
        if (hora != null) {
            c.setTime(hora);
            if (c.get(Calendar.HOUR_OF_DAY) < 13) {
                return (c.get(Calendar.HOUR_OF_DAY)) + ":00 AM";
            } else {
                return (c.get(Calendar.HOUR_OF_DAY) - 12) + ":00 PM";
            }
        }
        return "";
    }

//Retornando medico dentro de la tabla usado en cita_lista_proximas.xhtml
    public String nombreMedico(Integer id) {
        if (id != null) {
            Medicos m = getOdontologosFacade().find(id);
            if (m.getMedicoSexo() == true) {
                return "Dr." + m.getMedicoPrimerNombre() + m.getMedicoPrimerApellido();
            } else {
                return "Dra." + m.getMedicoPrimerNombre() + m.getMedicoPrimerApellido();
            }
        }
        return "";
    }

//Retornar si es Dr. o Dra. 
    public String abreviatura(Boolean s) {
        if (s != null) {
            return (s) ? "Dr." : "Dra.";
        }
        return "";
    }

//Colocar la hora y cita en editarcITA
//Usado en cita_clinica_editar_pendiente.xhtml
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

public void actualizarCita() {
        citaEditar.setCitaFecha(citaDia);
        Calendar hora = Calendar.getInstance();
        hora.set(Calendar.HOUR_OF_DAY, horaE);
        hora.set(Calendar.MINUTE, 0);
        hora.set(Calendar.SECOND, 0);
        citaEditar.setCitaHora(hora.getTime());
        citaEditar.setCitaFechaModificacion(new Date());
        getCitasFacade().edit(citaEditar);
        citaDia = citaEditar.getCitaFecha();
        citaEditarHora.setTime(citaEditar.getCitaHora());
        citaEditarFecha.setTime(citaEditar.getCitaFecha());
        citasEditarSucursal = citaEditar.getClinicaId();
        horaE = hora.get(Calendar.HOUR_OF_DAY);
        msj.mensajeGuardado("Su cita a sido modificada.");
    }

//Metodo para cargar la informacion del usuario logeado en paciente.
//Usado en: paciente.xhtml (dashboard), citas_paciente_nueva.xhtml
//Estado: En uso.
    public void cargarPaciente() {
        if (appSession.getUsuario() != null) {
            citaNuevo.setCitaNombres(appSession.getUsuario().getUsuarioPrimerNombre());
            citaNuevo.setCitaApellidos(appSession.getUsuario().getUsuarioPrimerApellido());
            citaNuevo.setCitaTelefono(appSession.getUsuario().getUsuarioTelefono());
            citaNuevo.setCitaCorreo(appSession.getUsuario().getUsuarioCorreo());
            citaNuevo.setCitaUsuarioCreacion(appSession.getUsuario().getUsuarioUsuario());
            citaNuevo.setUsuarioUsuario(appSession.getUsuario());
        } else {
            System.err.println("Metodo cargar paciente, Usuario Null");
        }

    }

//Metodo para actualizar la cita si el paciente se encuentra en sala. 
    public void enSala() {
        if (citaEditar != null) {
            try {
                getCitasFacade().edit(citaEditar);
            } catch (Exception e) {
                System.err.println("Metodo enSala: No actualizado");
            }
        }
    }

    public void enSala(Integer cita, Boolean enSala) {
        System.out.println("controllers.CitasBean.enSala()");
        try {
            citaEditar = getCitasFacade().find(cita);
            citaEditar.setCitaEnsala(enSala);
            getCitasFacade().edit(citaEditar);
            System.out.println("Actualizado");
        } catch (Exception e) {
            System.out.println("Metodo enSala: No actualizado");
        }

    }

    public Boolean panelCitaClinica() {
        System.out.println("controllers.CitasBean.panelCitaClinica() " + clinicaSeleccionada);
        if (clinicaSeleccionada == 0) {
            return true;
        } else {
            return false;
        }
    }

//Identifica que variable se esta usando y le asigna los valores 
//Usada en: citas_paciente_nuevo.xhtml, citas_clinica_editar.xhtml 
//Estado: En uso.
    public void pantallaCita(int pantalla) {
        setCitapantalla(pantalla);
    }

//Metodo dinamico para redireccionar el cancel
//Usado en: cita_clinita_editar.xhtml
    public String redireccionCitaEditar2() {
        switch (retorno) {
            case 1:
                return "Dashboard";
            case 2:
                return "CitasListaPendientes";
            case 3:
                return "CitasListaAprobadas";
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
        }
        return "Dashboard";
    }

}