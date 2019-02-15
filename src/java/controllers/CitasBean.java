/*Proyecto Actualizado: 30/enero/2018*/
package controllers;

import dao.CitasFacade;
import dao.ClinicasFacade;
import dao.MedicosFacade;
import entities.Citas;
import entities.Clinicas;
import entities.Medicos;
import java.io.IOException;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;
import javax.ejb.EJB;
//import javax.enterprise.context.SessionScoped;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;
import javax.inject.Named;
import javax.servlet.http.HttpServletRequest;
import org.primefaces.context.RequestContext;
import javax.faces.bean.SessionScoped;

/*
Notas de actualizacion:
Fecha: 11/febrero/2019
-Agregando todasCitasPorPaciente() para funcion de citas_paciente_historico.xhtml
-Agregando estadoCitaPaciente() para funcion de citas_paciente_historico.xhtml
-Relacionando el metodo eliminarCitaP a cita_clinica_listado_pendiente.xhtml boton eliminar.
********************************************************************************
Fecha: 06/febrero/2019
-Agregando metodo para actualizar estado de enSala.

********************************************************************************
Fecha: -3/febrero/2019
-Faltante metodo todasCitasPendientes() colapsando cita_clinica_listado_pendiente.xhtml, omitido por alguna razon. 
-Agregado metodo todasCitasPendientes().

********************************************************************************
Fecha: 01/febrero/2019
-Se agregado metodo faltante cargarPaciente().
-Se agrego variable faltante citasNuevoPaciente. 
-se agregaron los metodos get y set de la variable faltante citasNuevoPaciente.
-Se cambia Named a ManagenBean a la clase. 
-Cambio de citasBean1 a citasBean.
-Cambio de libreria de import javax.enterprise.context.SessionScoped a import javax.faces.bean.SessionScoped.
-Problema solucionado de dinamismo de los horarios por una importacion diferenet del sessionScoped. 
-Se agrego el metodo guardarCitaPaciente() faltante. 
-Se agrego el metodo todasCitasAprobadas() faltante.
-Se agrego la variable Integer clinicaSeleccionada, metodos que depende todasCitasAprobadas().
-Agregando metodos get y set de varibale clinicaSeleccionada. 

 */
//@Named(value = "citasBean1")
@ManagedBean(name = "citasBean")
@SessionScoped
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
    private Citas citaEliminar = new Citas();
    private int idEliminar;
    //Seleccionar sucursal para la tabla. 
    private Integer clinicaSeleccionada = 0;

    @EJB
    private ClinicasFacade clinicasFacade;

    @EJB
    private MedicosFacade odontologosFacade;

    private Date citaDia = new Date();
    private Integer horaE;
    private Date fechaActual = new Date();

    //Session
    @ManagedProperty(value = "#{appSession}")
    private AppSession appSession;

    //Paciente cuando ingrese.
    private Citas citasNuevoPaciente = new Citas();

//****************************************************************************//
//                  Métodos para obtener listas por entidades                 //
//****************************************************************************//
    public List<Clinicas> todasClinicas() {
        return getClinicasFacade().findAll();
    }

    public List<Medicos> todoOdontologos() {
        return getOdontologosFacade().findAll();
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

    //Metodo para cargar todas las citas por paciente.
    //Usado en: cita_paciente_historico.
    //Estado: En uso.
    //Fecha: 11/febrero/2019 
    public List<Citas> todasCitasPorPaciente() {
        if (appSession.getUsuario() != null) {
            return citasFacade.citasTodas(appSession.getUsuario().getUsuarioUsuario(), appSession.getUsuario().getUsuarioCorreo());
        }
        return null;
    }

    //Metodo para cargar todas las citas de la clinica.
    //Usado en: cita_clinica_historico.xhtml
    //Estado: En uso.
    //Fecha: 11/febrero/2019 
    public List<Citas> todasCitas() {
        if (clinicaSeleccionada != 0) {
            return getCitasFacade().historicoPorClinica(clinicaSeleccionada);
        }
        return getCitasFacade().findAll();
    }

    //Método para mostrar los estados de las citas. 
    //Usado en: cita_paciente_historico.
    //Estado: En uso.
    //Fecha: 11/febrero/2019 
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

//****************************************************************************//
//                             Métodos Get y SET                              //
//****************************************************************************//
    //Variable citaDia
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

    public Citas getCitaEliminar() {
        return citaEliminar;
    }

    public void setCitaEliminar(Citas citaEliminar) {
        this.citaEliminar = citaEliminar;
    }

    public int getIdEliminar() {
        return idEliminar;
    }

    public void setIdEliminar(int idEliminar) {
        this.idEliminar = idEliminar;
    }

    //Variable: citasNuevoPaciente. 
    public Citas getCitasNuevoPaciente() {
        return citasNuevoPaciente;
    }

    public void setCitasNuevoPaciente(Citas citasNuevoPaciente) {
        this.citasNuevoPaciente = citasNuevoPaciente;
    }

    //Variable appSession
    public AppSession getAppSession() {
        return appSession;
    }

    public void setAppSession(AppSession appSession) {
        this.appSession = appSession;
    }

    //Variable clinicaSeleccionada.
    public Integer getClinicaSeleccionada() {
        return clinicaSeleccionada;
    }

    public void setClinicaSeleccionada(Integer clinicaSeleccionada) {
        this.clinicaSeleccionada = clinicaSeleccionada;
    }

//****************************************************************************//
//                                  Métodos                                   //
//****************************************************************************//
    //Metodo para cargar los horarios disponibles para el paciente.
    //Metodos similares cambia solo por la variable.
    //Usado en: cita_paciente_nueva.xhtml
    //Estado: En uso.
    //Fecha: 01/febrero/2019 Actualizacion: 13/febrero/2019
    //Nota considerando el horario del doctor.
    //Considederar que el horario del doctor ocupado se propage a las demas sucursales
    public List<Horario> horariosDisponibleSucursalPaciente() {
        List<Horario> horarios = new ArrayList<>();
        horarios.clear();
        Calendar cita = Calendar.getInstance();
        cita.setTime(citaDia);
        String s;
        System.out.println("Entra metodo horariosDisponibleSucursalPaciente()");
        //System.out.println("sucursal " + citasNuevoPaciente.getClinicaId().getClinicaNombre());
        if (citasNuevoPaciente.getClinicaId() != null) {
            Calendar clinicaInicio = Calendar.getInstance();
            Calendar clinicaFin = Calendar.getInstance();
            clinicaInicio.setTime(citasNuevoPaciente.getClinicaId().getClinicaHorarioApertura());
            clinicaFin.setTime(citasNuevoPaciente.getClinicaId().getClinicaHorarioCierre());

            for (int i = clinicaInicio.get(Calendar.HOUR_OF_DAY); i < clinicaFin.get(Calendar.HOUR_OF_DAY); i++) {
                Calendar citaPreguntar = Calendar.getInstance();
                citaPreguntar.setTime(citaDia);
                citaPreguntar.set(Calendar.HOUR_OF_DAY, i);
                citaPreguntar.set(Calendar.MINUTE, 0);
                citaPreguntar.set(Calendar.SECOND, 0);

                //Actualmente solo son reservadas estado 1, falta comprender a las confirmadas estado 2
                //Fecha, clinica, hora 
                List<Citas> reservadasSucursal = getCitasFacade().citasReservadoSucursal(cita.getTime(), citasNuevoPaciente.getClinicaId().getClinicaId(), citaPreguntar.getTime());
                int cantidadCitas = reservadasSucursal.size();

                if (i < 13) {
                    s = i + ":00 AM";
                } else {
                    s = (i - 12) + ":00 PM";
                }

                //Considerar que el medico solo tiene que tener un solo horario activo
                if (cantidadCitas < citasNuevoPaciente.getClinicaId().getClinicaModulo()) {
                    //System.out.println("horarioDisponibleSucursalPaciente medico cuando se selecciona" + citasNuevoPaciente.getMedicoId().getMedicoId());
                    if (citasNuevoPaciente.getMedicoId() == null) {
                        System.out.println("controllers.CitasBean.horariosDisponibleSucursalPaciente() sin seleccionar medico");
                        horarios.add(new Horario(i, s));
                    } else {
                        //Buscar medico y horario, si tiene ocupado no poner. 
                        //Puedo usar variables como 
                        //Para medico citasNuevoPaciente.getMedicoId().getMedicoId()
                        //Para dia cita.getTime()
                        //Para hora citaPreguntar.getTime()
                        //List<Citas> medicoC = getCitasFacade().citasReservadoSucursal(cita.getTime(), citasNuevoPaciente.getClinicaId().getClinicaId(), citaPreguntar.getTime(), citasNuevoPaciente.getMedicoId().getMedicoId());
                        List<Citas> medicoC = getCitasFacade().citasReservadoSucursal(cita.getTime(),citaPreguntar.getTime(), citasNuevoPaciente.getMedicoId().getMedicoId());
                        for (Citas citas : medicoC) {
                            System.out.println("Cita " + citas.getCitaId());
                        }
                        if (medicoC.isEmpty()) {
                            horarios.add(new Horario(i, s));
                            System.out.println("Doctor seleccionado " + citasNuevoPaciente.getMedicoId().getMedicoId());
                        }

                    }//Id del medico 
                }//Fin de citasNuevoPaciente.getClinicaId().getClinicaModulo()
            }
            return horarios;
        } else {
            System.out.println("Citas nuevo paciente apunta a null en sucursal");
            return horarios;
        }
    }

    //Metodo para guardar la cita del paciente. 
    //Metodos similares, cambia solo por variables.
    //Usado en: cita_paciente_nueva.xhtml
    //Estado: En uso.
    //Fecha: 01/febrero/2019 Actualizado: 02/febrero/2019
    //Notas de actualizacion: 
    //Fecha: 02/febrero/ 2019
    //-Temporalmente se preguntara por el usuario, recordad que esta parte no esta completamente definida,
    //que crea la cita, si tiene una con estado 1 o 2, se impedira crear una cita. 
    //-Se pregunta si el usuario sigue activo en sesion. 
    public void guardarCitaPaciente() {
        try {

            if (appSession.getUsuario() != null) {
                if (getCitasFacade().citaActiva(appSession.getUsuario().getUsuarioUsuario()).isEmpty()) {
                    citasNuevoPaciente.setCitaFecha(citaDia);
                    Calendar hora = Calendar.getInstance();
                    hora.set(Calendar.HOUR_OF_DAY, horaE);
                    hora.set(Calendar.MINUTE, 0);
                    hora.set(Calendar.SECOND, 0);
                    citasNuevoPaciente.setCitaHora(hora.getTime());
                    citasNuevoPaciente.setCitaFechaCreacion(new Date());
                    citasNuevoPaciente.setCitaHoraCreacion(new Date());
                    citasNuevoPaciente.setCitaEstado(1);
                    getCitasFacade().create(citasNuevoPaciente);
                    //citasNuevoPaciente = new Citas();
                    //citaDia = new Date();
                    mensajeGuardado("Su cita a sido guardada.");
                } else {
                    mensajeGuardado("Ya posee una cita.");
                }
            } else {
                System.err.println("guardarCitaPaciente(), usuario null");
            }

        } catch (Exception e) {
            mensajeError("Error al guardar la cita.");
        }

    }

    //Metodo para eliminar cita del paciente.
    //Metodo similares, cambio solo de variable. 
    //Usado en: paciente.xhtml, cita_clinica_listado_pendiente.xhtml
    //Estado: En uso.
    //Fecha: 11/febrero/2019
    public void eliminarCitaP() {
        try {
            citaEditar.setCitaUsuarioModificacion(appSession.getUsuario().getUsuarioUsuario());
            citaEditar.setCitaFechaModificacion(new Date());
            citaEditar.setCitaEstado(4);
            getCitasFacade().edit(citaEditar);
            mensajeGuardado("La cita ha sido eliminado.");
        } catch (Exception e) {
            mensajeError("Error al eliminar la cita.");
        }
    }

    //Metodos para mostrar las citas aprobadas, solo se mostraran las que no esten vencidas.
    //Usada en: asistente.xhtml
    //Estado: En uso.
    //Fecha: 02/febrero/2019
    public List<Citas> todasCitasAprobadas() {
        if (clinicaSeleccionada != 0) {
            return getCitasFacade().citasAprobadas(clinicaSeleccionada);
        }
        return getCitasFacade().citasAprobadas();
    }

    //Metodo para mostrar las citas pendientes. Estado 1.
    //Usado en: cita_clinica_listado_pendiente.xhtml
    //Estado : En uso. 
    //Fecha: 03/febrero/2018
    public List<Citas> todasCitasPendientes() {
        if (clinicaSeleccionada != 0) {
            return getCitasFacade().citasPendientes(clinicaSeleccionada);
        }
        return getCitasFacade().citasPendientes();
    }

    //Obteniendo horarios disponible de odontologo usado en cita_nueva.html
    public List<Horario> horariosDisponibleSucursal() {
        List<Horario> horarios = new ArrayList<>();
        horarios.clear();
        Calendar cita = Calendar.getInstance();
        cita.setTime(citaDia);
        String s;
        System.out.println("Entra");
        if (citaNuevo.getClinicaId() != null) {
            Calendar clinicaInicio = Calendar.getInstance();
            Calendar clinicaFin = Calendar.getInstance();
            clinicaInicio.setTime(citaNuevo.getClinicaId().getClinicaHorarioApertura());
            clinicaFin.setTime(citaNuevo.getClinicaId().getClinicaHorarioCierre());

            for (int i = clinicaInicio.get(Calendar.HOUR_OF_DAY); i < clinicaFin.get(Calendar.HOUR_OF_DAY); i++) {
                Calendar citaPreguntar = Calendar.getInstance();
                citaPreguntar.setTime(citaDia);
                citaPreguntar.set(Calendar.HOUR_OF_DAY, i);
                citaPreguntar.set(Calendar.MINUTE, 0);
                citaPreguntar.set(Calendar.SECOND, 0);

                List<Citas> reservadasSucursal = getCitasFacade().citasReservadoSucursal(cita.getTime(), citaNuevo.getClinicaId().getClinicaId(), citaPreguntar.getTime());
                int cantidadCitas = reservadasSucursal.size();

                if (i < 13) {
                    s = i + ":00 AM";
                } else {
                    s = (i - 12) + ":00 PM";
                }

                if (cantidadCitas < citaNuevo.getClinicaId().getClinicaModulo()) {
                    horarios.add(new Horario(i, s));
                }
            }
            return horarios;
        } else {
            System.out.println("Solo yo me ejecuto");
            return horarios;
        }
    }

    //Metodo para obtener citas para editar cita
    //Usado en: cita_clinica_editar_dashboard.xhtml
    //Actualizado: 13/febrero/2019
    //Se debe de actualizar para que desaparescan horarios ocupados, y  quede seleccionado el que se tiene
    //Desaparecer el horario ocupado de la doctora en las demas sucursales
    public List<Horario> horariosDisponibleSucursalEditar() {
        horaE = null;
        List<Horario> horarios = new ArrayList<>();
        horarios.clear();
        Calendar cita = Calendar.getInstance();
        cita.setTime(citaDia);
        String s;
        if (citaEditar.getClinicaId() != null) {
            Calendar clinicaInicio = Calendar.getInstance();
            Calendar clinicaFin = Calendar.getInstance();
            clinicaInicio.setTime(citaEditar.getClinicaId().getClinicaHorarioApertura());
            clinicaFin.setTime(citaEditar.getClinicaId().getClinicaHorarioCierre());

            for (int i = clinicaInicio.get(Calendar.HOUR_OF_DAY); i < clinicaFin.get(Calendar.HOUR_OF_DAY); i++) {
                Calendar citaPreguntar = Calendar.getInstance();
                citaPreguntar.setTime(citaDia);
                citaPreguntar.set(Calendar.HOUR_OF_DAY, i);
                citaPreguntar.set(Calendar.MINUTE, 0);
                citaPreguntar.set(Calendar.SECOND, 0);

                List<Citas> reservadasSucursal = getCitasFacade().citasReservadoSucursal(cita.getTime(), citaEditar.getClinicaId().getClinicaId(), citaPreguntar.getTime());
                int cantidadCitas = reservadasSucursal.size();

                if (i < 13) {
                    s = i + ":00 AM";
                } else {
                    s = (i - 12) + ":00 PM";
                }

                //Si la cita que se tiene guardado es igua a la cita que se pregunta
                if (citaEditarFecha.get(Calendar.YEAR) == citaPreguntar.get(Calendar.YEAR) && citaEditarFecha.get(Calendar.MONTH) == citaPreguntar.get(Calendar.MONTH) && citaEditarFecha.get(Calendar.DAY_OF_MONTH) == citaPreguntar.get(Calendar.DAY_OF_MONTH) && citasEditarSucursal.getClinicaId() == citaEditar.getClinicaId().getClinicaId()) {
                    // if (citaEditarFecha.get(Calendar.YEAR) == citaPreguntar.get(Calendar.YEAR) && citaEditarFecha.get(Calendar.MONTH) == citaPreguntar.get(Calendar.MONTH) && citaEditarFecha.get(Calendar.DAY_OF_MONTH) == citaPreguntar.get(Calendar.DAY_OF_MONTH) && Objects.equals(citasEditarSucursal.getClinicaId(), citaEditar.getClinicaId().getClinicaId())) {

                    if (citaEditarHora.get(Calendar.HOUR_OF_DAY) == i) {
                        horaE = citaEditarHora.get(Calendar.HOUR_OF_DAY);
                        // System.out.println("cuantas veces entras" + horaE);
                        horarios.add(new Horario(i, s));
                    } else if (cantidadCitas < citaEditar.getClinicaId().getClinicaModulo()) {
                        //Si hay modulos disponibles, preguntar la disponibilidad del medico
                        //Insertando actualizacion
                        //******************************************************
                        //Busando medico 
                        if (citaEditar.getMedicoId() == null) {
                            //System.out.println("controllers.CitasBean.horariosDisponibleSucursalPaciente() sin seleccionar medico");
                            horarios.add(new Horario(i, s));
                        } else {
                            //Buscar medico y horario, si tiene ocupado no poner. 
                            //Puedo usar variables como 
                            //Para medico citasNuevoPaciente.getMedicoId().getMedicoId()
                            //Para dia cita.getTime()
                            //Para hora citaPreguntar.getTime()
                            //List<Citas> medicoC = getCitasFacade().citasReservadoSucursal(cita.getTime(), citaEditar.getClinicaId().getClinicaId(), citaPreguntar.getTime(), citaEditar.getMedicoId().getMedicoId());
                            List<Citas> medicoC = getCitasFacade().citasReservadoSucursal(cita.getTime(),citaPreguntar.getTime(), citaEditar.getMedicoId().getMedicoId());
                            for (Citas citas : medicoC) {
                                System.out.println("Cita " + citas.getCitaId());
                            }
                            if (medicoC.isEmpty()) {
                                horarios.add(new Horario(i, s));
                                // System.out.println("Doctor seleccionado " + citasNuevoPaciente.getMedicoId().getMedicoId());
                            }

                        }
                        //******************************************************
                        //Fin de actualizacion
                        //horarios.add(new Horario(i, s));
                    }

                } else if (cantidadCitas < citaEditar.getClinicaId().getClinicaModulo()) {
                    //horarios.add(new Horario(i, s));
                    //Si hay modulos disponibles, preguntar la disponibilidad del medico
                    //Insertando actualizacion
                    //******************************************************
                    if (citaEditar.getMedicoId() == null) {
                        //System.out.println("controllers.CitasBean.horariosDisponibleSucursalPaciente() sin seleccionar medico");
                        horarios.add(new Horario(i, s));
                    } else {
                        //Buscar medico y horario, si tiene ocupado no poner. 
                        //Puedo usar variables como 
                        //Para medico citasNuevoPaciente.getMedicoId().getMedicoId()
                        //Para dia cita.getTime()
                        //Para hora citaPreguntar.getTime()
                        //List<Citas> medicoC = getCitasFacade().citasReservadoSucursal(cita.getTime(), citaEditar.getClinicaId().getClinicaId(), citaPreguntar.getTime(), citaEditar.getMedicoId().getMedicoId());
                        List<Citas> medicoC = getCitasFacade().citasReservadoSucursal(cita.getTime(),citaPreguntar.getTime(), citaEditar.getMedicoId().getMedicoId());
                        for (Citas citas : medicoC) {
                            System.out.println("Cita " + citas.getCitaId());
                        }
                        if (medicoC.isEmpty()) {
                            horarios.add(new Horario(i, s));
                            // System.out.println("Doctor seleccionado " + citasNuevoPaciente.getMedicoId().getMedicoId());
                        }

                    }
                    //******************************************************
                    //Fin de actualizacion
                }

            }//Fin de for
            return horarios;
        } else {
            return horarios;
        }
    }

    //Metodo para guardar cita utilizado en cita_nueva.html
    public void guardarCita() {
        System.out.println("Se guardo la cita");
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
        mensajeGuardado("Su cita a sido guardada.");
    }

    //Método para refrescar los valores utilizado en cita_nueva.xhtml.
    public void refrescar() {
        citaDia = new Date();
        citaNuevo = new Citas();
        horaE = null;
    }

    //Método para recargar la pagina.
    public void reload() throws IOException {
        ExternalContext ec = FacesContext.getCurrentInstance().getExternalContext();
        ec.redirect(((HttpServletRequest) ec.getRequest()).getRequestURI());
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

    //Hora no se utiliza partnerr por razones de error con en compilaciond e sesionbean
    public String horacita(Date hora) {
        Calendar c = Calendar.getInstance();
        c.setTime(hora);
        //System.out.println("Metodo horacita(), class Citas Bean" + c.get(Calendar.HOUR_OF_DAY));
        if (c.get(Calendar.HOUR_OF_DAY) < 13) {
            return (c.get(Calendar.HOUR_OF_DAY)) + ":00 AM";
        } else {
            return (c.get(Calendar.HOUR_OF_DAY) - 12) + ":00 PM";
        }
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
    public void editarConsultaHoraCita() {
        citaDia = citaEditar.getCitaFecha();
        Calendar horaSeleccionada = Calendar.getInstance();
        horaSeleccionada.setTime(citaEditar.getCitaHora());
        citaEditarFecha.setTime(citaEditar.getCitaFecha());
        citaEditarHora.setTime(citaEditar.getCitaHora());
        citasEditarSucursal = citaEditar.getClinicaId();
    }

    //Metodo para el boton restabler permite resetear el dia que se pone en el calendario
    //Usado en: cita_clinica_editar_pendiente.xhtml
    //Estado: Removido
    //Motivo: Grupo dice: Hagamonos los majes con ese boton.
    //Fecha: 11/febrero/2019
    public void resertEditarCita() {
        citaEditar.setClinicaId(citasEditarSucursal);
        citaDia = citaEditar.getCitaFecha();
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
        //citaEditarHora.set(0, 0);
        citaEditarHora.setTime(citaEditar.getCitaHora());
        citaEditarFecha.setTime(citaEditar.getCitaFecha());
        citasEditarSucursal = citaEditar.getClinicaId();
        horaE = hora.get(Calendar.HOUR_OF_DAY);
        //System.out.println("hora de set cual sera" + horaE);
        mensajeGuardado("Su cita a sido modificada.");
    }

    public void eliminarCita() {
        // citaEliminar = getCitasFacade().find(idEliminar);
        citaEliminar.setCitaEstado(4);
        getCitasFacade().edit(citaEliminar);
        mensajeGuardado("La cita ha sido eliminado.");
    }

    //Metodo para cargar la informacion del usuario logeado en paciente.
    //Fecha: 31/enero/2019
    //Usado en: paciente.xhtml (dashboard), citas_paciente_nueva.xhtml
    //Estado: En uso.
    public void cargarPaciente() {
        if (appSession.getUsuario() != null) {
            citasNuevoPaciente.setCitaNombres(appSession.getUsuario().getUsuarioPrimerNombre());
            citasNuevoPaciente.setCitaApellidos(appSession.getUsuario().getUsuarioPrimerApellido());
            citasNuevoPaciente.setCitaTelefono(appSession.getUsuario().getUsuarioTelefono());
            citasNuevoPaciente.setCitaCorreo(appSession.getUsuario().getUsuarioCorreo());
            citasNuevoPaciente.setCitaUsuarioCreacion(appSession.getUsuario().getUsuarioUsuario());
            citasNuevoPaciente.setUsuarioUsuario(appSession.getUsuario());
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

//****************************************************************************//
//  Que despije en este controlador... Desde aqui comienzan mis cambios...    //
//****************************************************************************//
    //Metodo similar a  todasCitasPendientes(). 
    public List<Citas> todasCitasReservadas() {
        return getCitasFacade().citasReservadas();
    }

}
