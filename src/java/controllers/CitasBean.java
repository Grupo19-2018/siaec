package controllers;

import com.sun.mail.smtp.SMTPAddressFailedException;
import util.Horario;
import util.Mensajes;
import dao.CitasFacade;
import dao.ClinicasFacade;
import dao.ConfiguracionesFacade;
import dao.MedicosFacade;
import dao.PacientesFacade;
import entities.Citas;
import entities.Clinicas;
import entities.Configuraciones;
import entities.Medicos;
import entities.Pacientes;
import entities.Usuarios;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.ViewScoped;
import javax.mail.MessagingException;
import javax.mail.SendFailedException;
import util.CorreoBasico;

@ManagedBean(name = "citasBean")
@ViewScoped
public class CitasBean implements Serializable {

//****************************************************************************//
//                          Declaración de variables                          //
//****************************************************************************//
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
//Usada en: cita_clinica_listado_aprobadas.xhtml
//Estado: En uso.
    public List<Citas> todasCitasConfirmadas() {
        System.err.println("Todas citas " + clinicaSeleccionada);
        if (clinicaSeleccionada != 0) {
            return getCitasFacade().citasConfirmadas(clinicaSeleccionada);
        }
        return getCitasFacade().citasConfirmadas();
    }
    
//Metodo para mostrar las citas aprobadas del dia. 
//Usada en: asistente.xhtml
//Estado: En uso.
public List<Citas> todasCitasConfirmadasHoy(){
    if(clinicaSeleccionada != 0){
        return getCitasFacade().citasConfirmadasHoy(clinicaSeleccionada);
    }
    return getCitasFacade().citasConfirmadasHoy();
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

//Metodo para cargar todos los expedientes.
//Usado en:cita_clinica_nueva.xhtml
//Estado:Prueba
    public List<Pacientes> todosPacientes() {
        return getPacienteFacade().findAll();
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

    public PacientesFacade getPacienteFacade() {
        return pacienteFacade;
    }

    public ConfiguracionesFacade getConfiguracionFacade() {
        return configuracionFacade;
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

//****************************************************************************//
//                                  Métodos                                   //
//****************************************************************************//
//Cargar paciente
//Usado en: cita_clinica_nuevo.xhtml
//Estado: Prueba
    public void resetearPaciente() {
        citaNuevo = new Citas();
        Pacientes p = getPacienteFacade().find(pacienteId);
        citaNuevo.setCitaNombres(p.getPacientePrimerNombre() + " " + p.getPacienteSegundoNombre());
        citaNuevo.setCitaApellidos(p.getPacientePrimerApellido() + " " + p.getPacienteSegundoApellido());
        citaNuevo.setCitaTelefono(p.getPacienteTelefonoCasa());
        citaNuevo.setCitaCorreo(p.getPacienteCorreo());
    }

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
                System.err.println("Sucursal" + citaEditar.getClinicaId().getClinicaNombre());
                if (citaEditar.getMedicoId() != null) {
                    System.err.println("Doctor" + citaEditar.getMedicoId().getMedicoPrimerNombre());
                    medico = citaEditar.getMedicoId().getMedicoId();
                    hayMedico = true;
                }
            }

        }

        if (clinicaSeleccionada != 0 && (getCitapantalla() == 1 || getCitapantalla() == 2)) {
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
                System.out.println("Medico seleccionado " + hayMedico);

                if (i < 13) {
                    s = i + ":00 AM";
                } else {
                    s = (i - 12) + ":00 PM";
                }

                //Problema la sucursal  1 muestra la hora la sucursal 2 no
                //Si se esta editando una cita. 
                if (getCitapantalla() == 2 && citaEditarFecha.get(Calendar.YEAR) == citaPreguntar.get(Calendar.YEAR)
                        && citaEditarFecha.get(Calendar.MONTH) == citaPreguntar.get(Calendar.MONTH)
                        && citaEditarFecha.get(Calendar.DAY_OF_MONTH) == citaPreguntar.get(Calendar.DAY_OF_MONTH)
                        && citasEditarSucursal.getClinicaId() == citaEditar.getClinicaId().getClinicaId()) {
                    if (citaEditarHora.get(Calendar.HOUR_OF_DAY) == i) {
                        horaE = citaEditarHora.get(Calendar.HOUR_OF_DAY);
                        horarios.add(new Horario(i, s));
                    } else if (cantidadCitas < modulos) {
                        if (hayMedico == false) {
                            //System.out.println("Entra siempre");
                            horarios.add(new Horario(i, s));
                        } else {
                            //Buscar medico y horario, si tiene ocupado no poner. 
                            //Puedo usar variables como 
                            //Para dia cita.getTime()
                            //Para hora citaPreguntar.getTime()
                            List<Citas> medicoC = getCitasFacade().citasReservadoSucursal(cita.getTime(), citaPreguntar.getTime(), medico);
                            /**
                             * for (Citas citas : medicoC) { //
                             * System.out.println("Cita " + citas.getCitaId());
                             * System.out.println("Cita Sucursal" +
                             * citas.getClinicaId().getClinicaNombre());
                             * System.out.println("Cita hora " +
                             * citas.getCitaHora()); }/* /
                             */
                            //System.out.println("Medico antes de entrar" + s);
                            if (medicoC.isEmpty()) {
                                //System.out.println("Medico " + s);
                                horarios.add(new Horario(i, s));
                            }
                        }//Id del medico
                    }

                } else if (cantidadCitas < modulos) {
                    //Considerar que el medico solo tiene que tener un solo horario activo

                    //if (citaNuevo.getMedicoId() == null) {
                    //System.err.println("El medico con modulos disponible tiene " + hayMedico);
                    if (hayMedico == false) {
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
                        //System.out.println("Medico antes de entrar" + s);
                        if (medicoC.isEmpty()) {
                            //System.out.println("Medico " + s);
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
        citaNuevo.setPacienteId(new Pacientes(pacienteId));
        citaNuevo.setCitaEstado(2);
        getCitasFacade().create(citaNuevo);
        citaNuevo = new Citas();
        citaDia = new Date();
        clinicaSeleccionada = 0;
        pacienteId = 0;
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

//Hora no se utiliza partnerr por razones de que muestra otra hora diferente
    public String horacita(Date hora) {
        Calendar c = Calendar.getInstance();
        //System.out.println("Metodo horacita(), class Citas Bean" + c.get(Calendar.HOUR_OF_DAY));
        if (hora != null) {
            c.setTime(hora);
            if (c.get(Calendar.HOUR_OF_DAY) < 13) {
                if (c.get(Calendar.HOUR_OF_DAY) < 10) {
                    return "0" + (c.get(Calendar.HOUR_OF_DAY)) + ":00 AM";
                }
                return (c.get(Calendar.HOUR_OF_DAY)) + ":00 AM";
            } else {
                if (c.get(Calendar.HOUR_OF_DAY) < 22) {
                    return "0" + (c.get(Calendar.HOUR_OF_DAY) - 12) + ":00 PM";
                }
                return (c.get(Calendar.HOUR_OF_DAY) - 12) + ":00 PM";
            }
        }
        return "";
    }

    // Hora no se utiliza partner por error al mostrar horas, en formato de 24 horas. 
    public String horacita24(Date hora) {
        Calendar c = Calendar.getInstance();
        if (hora != null) {
            c.setTime(hora);
            if (c.get(Calendar.HOUR_OF_DAY) < 10) {
                return "0" + (c.get(Calendar.HOUR_OF_DAY)) + ":00";
            } else {
                return (c.get(Calendar.HOUR_OF_DAY)) + ":00";
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
        System.err.println("clina seleccionata " + clinicaSeleccionada);
        citaDia = citaEditar.getCitaFecha();
        Calendar horaSeleccionada = Calendar.getInstance();
        horaSeleccionada.setTime(citaEditar.getCitaHora());
        citaEditarFecha.setTime(citaEditar.getCitaFecha());
        citaEditarHora.setTime(citaEditar.getCitaHora());
        citasEditarSucursal = citaEditar.getClinicaId();
        //horaE = citaEditar.getCitaHora().getHours();
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
        //Notificacion de correo. 
        //Calendar cal= Calendar.getInstance()
        String notificacion = "";
        String mensaje = "<div>\n"
                + "           <h1>Su cita a sido confirmada</h1>\n"
                + "           <p>\n"
                + "            Lo esperamos el dia " + citaEditar.getCitaFecha().toString() + "<br/>\n"
                + "            Hora: " + citaEditar.getCitaHora().toString() + "<br/>\n"
                + "            En la sucursal:  " + citaEditar.getClinicaId().getClinicaNombre() + "<br/>\n"
                + "              \n"
                + "           </p>\n"
                + "       </div> ";
        //Solo cuando cambie a confirmada 
        //1. Si la cita se confirma
        if (citaEditar.getCitaEstado() == 2) {
            //2. Si la cita lo manda un usuario.
            if (citaEditar.getUsuarioUsuario() != null) {
                //2.1 Y el usuario tiene expediente
                if (citaEditar.getPacienteId() != null) {
                    //2.1.1 Leo su expediente y verifico si puedo notificarle por correo. 
                    Pacientes pn = getPacienteFacade().find(citaEditar.getPacienteId());
                    if (pn.getPacienteNotificarCorreo() == true) {
                        //2.1.1.1 Mando correo
                        enviarCorreo(mensaje, citaEditar.getCitaCorreo(), "CITA CONFIRMADA");
                    }
                    
                } else {
                    //2.2.1 No tiene expediente mando correo
                    enviarCorreo(mensaje, citaEditar.getCitaCorreo(), "CITA CONFIRMADA");
                }
             //3. Si la cita fue creada desde un expediente
             //4. Verifico el expediente por precaucion. 
            }else if (citaEditar.getPacienteId() != null){
                //4.1 Verifico si puedo notificarle por correo. 
                Pacientes pn = getPacienteFacade().find(citaEditar.getPacienteId());
                    if (pn.getPacienteNotificarCorreo() == true) {
                        //4.1.1 Mando correo
                        enviarCorreo(mensaje, citaEditar.getCitaCorreo(), "CITA CONFIRMADA");
                    }
            }
        }

        citaDia = citaEditar.getCitaFecha();
        citaEditarHora.setTime(citaEditar.getCitaHora());
        citaEditarFecha.setTime(citaEditar.getCitaFecha());
        citasEditarSucursal = citaEditar.getClinicaId();
        horaE = hora.get(Calendar.HOUR_OF_DAY);
        msj.mensajeGuardado("Su cita a sido modificada.");
    }

    //Correo Notificacion 
    public void enviarCorreo(String mensaje, String correo, String asunto) {
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
                                + "    " + mensaje
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
                        enviarHtml.sendMailHTML(correo, asunto, body);
                        msj.mensajeConfirmacion("Mensaje enviado.");
                    } else {
                        msj.mensajeError("Limite de envios superados.");
                    }
                } else {
                    msj.mensajeError("Verifique la cuenta del correo.");
                }
            } else {
                msj.mensajeError("Correo desactivado.");
            }
        } catch (SMTPAddressFailedException me) {
            msj.mensajeError("Mensaje no enviado");
        } catch (SendFailedException me) {
            msj.mensajeError("Mensaje no enviado");
        } catch (MessagingException me) {
            msj.mensajeError("Mensaje no enviado");
        } catch (Exception e) {
            msj.mensajeError("Mensaje no enviado");
        }

    }

//Metodo para cargar la informacion del usuario logeado en paciente.
//Usado en: paciente.xhtml (dashboard), citas_paciente_nueva.xhtml
//Estado: En uso.
    public void cargarPaciente() {
        if (appSession.getUsuario() != null) {
            citaNuevo.setCitaNombres(appSession.getUsuario().getUsuarioPrimerNombre() + " " + appSession.getUsuario().getUsuarioSegundoNombre());
            citaNuevo.setCitaApellidos(appSession.getUsuario().getUsuarioPrimerApellido() + " " + appSession.getUsuario().getUsuarioSegundoApellido());
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

}
