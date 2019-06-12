package controllers;

import dao.CitasFacade;
import dao.MedicosFacade;
import entities.Citas;
import entities.Medicos;
import java.io.Serializable;
import java.util.List;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.SessionScoped;

//@Named(value = "dashboardView")
@ManagedBean(name = "dashboardMedico")
//@ViewScoped
@SessionScoped
public class Dashboard_Medico implements Serializable {

//****************************************************************************//
//                          Declaración de variables                          //
//****************************************************************************//
    @EJB
    private CitasFacade citasfacade;

    @EJB
    private MedicosFacade medicosFacade;
    private Medicos medico;

    @ManagedProperty(value = "#{appSession}")
    private AppSession appSession;

//****************************************************************************//
//                         Métodos para obtener entidades                     //
//****************************************************************************//
//****************************************************************************//
//                 Métodos Get para obtener datos de entidades                //
//****************************************************************************//
    public CitasFacade getCitasfacade() {
        return citasfacade;
    }

    public MedicosFacade getMedicosFacade() {
        return medicosFacade;
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

    public Medicos getMedico() {
        return medico;
    }

    public void setMedico(Medicos medico) {
        this.medico = medico;
    }

//****************************************************************************//
//                                   Métodos                                  //
//****************************************************************************//  
//Mostrar citas a atende en el Dia. 
//Usado en: medico.xhtml
    public List<Citas> citasDelDia() {
        if (appSession.getUsuario() != null) {
            medico = usuarioMedico();
            return getCitasfacade().citasDelDiaMedico(medico.getMedicoId());
        }
        return null;
    }

//Mostrar citas en el Dia.
//Usado en: medico.xhtml
    public String cantidadCitasDia() {
        if (!agendaMedico().isEmpty()) {
            if (citasDelDia().size() == 1) {
                return "Tiene " + agendaMedico().size() + " cita agendada";
            } else {
                return "Tiene " + agendaMedico().size() + " citas agendadas";
            }
        } else {
            return "No tiene citas agendadas";
        }
    }

//Metodo para mostrar agenda.
//Usado en: cita_clinica_agenda.xhtml
    public List<Citas> agendaMedico() {
        return getCitasfacade().agendaMedico(getAppSession().getUsuario().getMedicoId().getMedicoId());
    }

//Metodo para encontrar al medico 
//Usado en metodo: citasDelDia()
    private Medicos usuarioMedico() {
        if (appSession.getUsuario() != null) {
            return getMedicosFacade().find(appSession.getUsuario().getMedicoId().getMedicoId());
        }
        return null;
    }
}
