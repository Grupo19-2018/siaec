/*
Controlador para el Dashboard del Paciente 
Opciones:
-Crear una cita de forma rápida. 
-Informar de si tiene citas para el día. 
 */
package controllers;

import dao.CitasFacade;
import dao.MedicosFacade;
import dao.PacientesFacade;
import entities.Citas;
import entities.Medicos;
import java.io.Serializable;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.SessionScoped;
import javax.faces.view.ViewScoped;
import javax.inject.Named;

/**
 *
 * @author user
 */
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
    
    String usuario = "Diana";
    
    //Cargar al usuario que inicia sesion dentro del controlador vista. 
    //Esta Funciona conjunto con AppSession.java y SesionBean.java
    @ManagedProperty(value = "#{appSession}")
    private AppSession appSession;

//****************************************************************************//
//                         Métodos para obtener entidades                     //
//****************************************************************************//
    //Metodo para encontrar al medico 
    //Usado para saludar al medico
    //Usado en 
    private Medicos usuarioMedico(){
        if(appSession.getUsuario() != null){
            //return getMedicosFacade().medico(appSession.getUsuario().getUsuarioUsuario());
            return getMedicosFacade().find(appSession.getUsuario().getMedicoId().getMedicoId());
        }
        return null;
    }
    
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
    
    //Metodo para saludar a la doctora.
    //Usado en medico.xhtml
    public String medicoNombre(){
        if (appSession.getUsuario() != null) {
            medico = usuarioMedico();
            String nombre="";
            if(medico.getMedicoSexo()){
                //Masculino si es true.
                nombre = "BIENVENIDO Dr. "+ medico.getMedicoPrimerNombre()+" " + medico.getMedicoPrimerApellido();
                return nombre.toUpperCase();
            }else{
                //Femenino.
                nombre = "BIENVENIDA Dra. "+ medico.getMedicoPrimerNombre()+" " + medico.getMedicoPrimerApellido(); 
                return nombre.toUpperCase();
            }
        }
        return "";
    }
    
    //Mostrar citas a atende en el Dia. 
    //Usado en: medico.xhtml
    public List<Citas> citasDelDia(){
        if(appSession.getUsuario() !=  null){
            medico = usuarioMedico();
            return getCitasfacade().citasDelDiaMedico(medico.getMedicoId());
            //return getCitasfacade().agendaMedico(medico.getMedicoId());
        }
        return null;
    }
    //Mostrar citas en el Dia.
    //Usado en: medico.xhtml
    public String cantidadCitasDia(){
            if(!agendaMedico().isEmpty()){
                if(citasDelDia().size() == 1){
                    return "Tiene " + agendaMedico().size() + " cita agendada";
                }
                else{
                    return "Tiene " + agendaMedico().size() + " citas agendadas";
                }
            }else{
                return "No tiene citas agendadas";
            }
    }
    
    //Metodo para mostrar agenda.
    //Usado en: cita_clinica_agenda.xhtml
    public List<Citas>agendaMedico(){
        return getCitasfacade().agendaMedico(getAppSession().getUsuario().getMedicoId().getMedicoId());
    }
}
