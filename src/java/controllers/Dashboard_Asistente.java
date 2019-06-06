package controllers;

import dao.CitasFacade;
import dao.ClinicasFacade;
import dao.PacientesFacade;
import entities.Clinicas;
import entities.Pacientes;
import entities.Usuarios;
import java.io.Serializable;
import java.util.List;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.SessionScoped;
import javax.faces.view.ViewScoped;

@ManagedBean(name = "dashboardAsistente")
//@SessionScoped
@ViewScoped
public class Dashboard_Asistente implements Serializable {

//****************************************************************************//
//                          Declaración de variables                          //
//****************************************************************************//
    @EJB
    private CitasFacade citasfacade;

    @EJB
    private ClinicasFacade clinicasFacade;

    @EJB
    private PacientesFacade pacienteFacade;                 //Facade para buscar al Paciente teniendo el usuario .

    @ManagedProperty(value = "#{appSession}")
    private AppSession appSession;

//****************************************************************************//
//                         Métodos para obtener entidades                     //
//****************************************************************************//
//Todas clinicas utilizado.
//Usado en: asistente.xhtml
    public List<Clinicas> todasClinicas() {
        return getClinicasFacade().findAll();
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

    public PacientesFacade getPacienteFacade() {
        return pacienteFacade;
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

//****************************************************************************//
//                                   Métodos                                  //
//****************************************************************************//  

//Usado en: asistente.xhtml
    public Integer usuarioPacienteExiste(Usuarios usuario, Pacientes paciente) {
        //Retorno 1 si tiene solo expediente, se puede asociar un usuario existente.
        //Retorno 2 si tiene solo un usuario, se puede asociar un expediente o crear expediente. 
        //Retorno 3 si tiene expediente y usuario. 
        //Retorno 0 si no tiene nada, error al guardar la cita.
        //Verifica los parametros de la cita.
        if (usuario != null && paciente != null) {
            return 3;
        } else if (usuario != null) {
            return 2;
        } else if (paciente != null) {
            return 1;
        }
        return 0;
    }
}
