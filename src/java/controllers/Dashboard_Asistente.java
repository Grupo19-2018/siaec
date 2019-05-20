package controllers;

import dao.CitasFacade;
import dao.ClinicasFacade;
import dao.PacientesFacade;
import entities.Citas;
import entities.Clinicas;
import entities.Pacientes;
import entities.Usuarios;
import java.io.Serializable;
import java.util.List;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.SessionScoped;

//@Named(value = "dashboardView")
@ManagedBean(name = "dashboardAsistente")
//@ViewScoped
@SessionScoped
public class Dashboard_Asistente implements Serializable {

//****************************************************************************//
//                          Declaración de variables                          //
//****************************************************************************//
    @EJB
    private CitasFacade citasfacade;

    @EJB
    private ClinicasFacade clinicasFacade;

    //Facade para buscar al Paciente teniendo el usuario .
    @EJB
    private PacientesFacade pacienteFacade;

    public PacientesFacade getPacienteFacade() {
        return pacienteFacade;
    }

    public void setPacienteFacade(PacientesFacade pacienteFacade) {
        this.pacienteFacade = pacienteFacade;
    }

    /*
     Nota Aclaratorio: 
     Se espera que este dashaboard sea un controlador tipo view el cual permita 
     liberar memoria, y agilizar el sistema sin tantas variables cargadas, por tal caso
     la varaible clinicaSeleccionada para actualizar la tabla de sucursales sera 
     similar al hecho en CitasBean.java
    
     Para mejorar este metodo se esperaria que el asistente por ser fijo en una 
     clinica se inicializara con dicha clinica, dicho campo o manera no esta contemplado 
     dentro de la base de datos. No hay forma actual de realizar dicha operacion. 
     */
    //Variable similar a la usada en CitasBean.java
    private Integer clinicaSeleccionada = 0;

    //Cargar al usuario que inicia sesion dentro del controlador vista. 
    //Esta Funciona conjunto con AppSession.java y SesionBean.java
    @ManagedProperty(value = "#{appSession}")
    private AppSession appSession;

    //probando variable boolean y un switch
    private Boolean enSala = true;

    public Boolean getEnSala() {
        return enSala;
    }

    public void setEnSala(Boolean enSala) {
        this.enSala = enSala;
    }

    public void pruebaT() {
        System.out.println("controllers.Dashboard_Asistente.pruebaT() " + enSala);
    }

    public void pruebaT(Integer cita) {
        System.out.println("controllers.Dashboard_Asistente.pruebaT() " + enSala);
        System.out.println("Es la cita numero " + cita);
    }

    //Metodo para encontrar el usuario del paciente
    //Estado: prueba
    //Fecha: 04/febrero/2019
    public String pacienteUsuario(String usuario) {
        //buscar usuario
        try {
            List<Pacientes> p = getPacienteFacade().pacienteUsuario(usuario);
            System.out.println("controllers.Dashboard_Asistente.pacienteUsuario()" + p.get(0).getPacienteExpediente());
            return p.get(0).getPacienteExpediente();
        } catch (Exception e) {
            System.err.println("pacienteUsuario():" + e);
            return "";
        }
    }

    //Metodo para verificar si el usuario esta relacionado a un paciente. 
    //Estado: prueba
    //Fecha: 08/febrero/2019
    public Boolean usuarioPacienteExiste(String usuario) {
        try {
            System.out.println("controllers.Dashboard_Asistente.usuarioPacienteExiste() usuarioe es" + usuario);
            if (!usuario.isEmpty()) {
                System.out.println("controllers.Dashboard_Asistente.usuarioPacienteExiste() entro con usuario" + usuario);
                List<Pacientes> p = getPacienteFacade().pacienteUsuario(usuario);
                if (!p.isEmpty()) {
                    return false;
                } else {
                    return true;
                }
            } else {
                return true;
            }

        } catch (Exception e) {
            System.out.println("controllers.Dashboard_Asistente.usuarioPacienteExiste()" + e);
            return true;
        }
    }

    //Usado en: asistente.xhtml
    //Estado: prueba.
    public Integer usuarioPacienteExiste(Usuarios usuario, Pacientes paciente) {
        //Retorno 1 si tiene solo expediente, se puede asociar un usuario existente.
        //Retorno 2 si tiene solo un usuario, se puede asociar un expediente o crear expediente. 
        //Retorno 3 si tiene expediente y usuario. 
        //Retorno 0 si no tiene nada, error al guardar la cita.
        //Verifica los parametros de la cita.
        if(usuario != null && paciente != null){
            return 3;
        }else if(usuario !=null){
            return 2;
        }else if (paciente !=null){
            return 1;
        }
        return 0;
    }
//****************************************************************************//
//                         Métodos para obtener entidades                     //
//****************************************************************************//
    //Todas clinicas utilizado en asistente.xhtml
    //Similar a CitasBean.java
    public List<Clinicas> todasClinicas() {
        return getClinicasFacade().findAll();
    }

    /*
     Definiendo los dierentes estados de una cita.
     Reservado o Pendiente (1) es cuando un usuario, solicita una cita via online. 
     Confirmado (2) cuando la asistente, realiza una llamada al paciente para confirmar la cita. 
     Atendido (3) una cita que fue atendida.
     Cancelada (4) una cita fue cancelada.
     Expirada (5) el paciente no llego a la consulta y no confirmo su ausencia.
     */
    //Metodo para listar las citas Confirmadas del dia en las diferentes clinica. 
    public List<Citas> citasDelDia() {
        if (clinicaSeleccionada != 0) {
            return getCitasfacade().citasDelDiaConfirmadasSucursal(clinicaSeleccionada);
        }
        return getCitasfacade().citasDelDiaConfirmadas();
    }

//****************************************************************************//
//                 Métodos Get para obtener datos de entidades                //
//****************************************************************************//
    public CitasFacade getCitasfacade() {
        return citasfacade;
    }

    public ClinicasFacade getClinicasFacade() {
        return clinicasFacade;
    }

//****************************************************************************//
//                             Métodos Get y SET                              //
//****************************************************************************// 
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

//****************************************************************************//
//                                   Métodos                                  //
//****************************************************************************//  
}
