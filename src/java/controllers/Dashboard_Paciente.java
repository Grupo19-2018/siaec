package controllers;

import dao.CitasFacade;
import entities.Citas;
import java.io.Serializable;
import java.util.List;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.SessionScoped;

@ManagedBean(name = "dashboardPaciente")
@SessionScoped
public class Dashboard_Paciente implements Serializable {

//****************************************************************************//
//                          Declaración de variables                          //
//****************************************************************************//
    @EJB
    private CitasFacade citasfacade;

    @ManagedProperty(value = "#{appSession}")
    private AppSession appSession;

//****************************************************************************//
//                         Métodos para obtener entidades                     //
//****************************************************************************//
    //Citas activas: Estado reservadas o pendiente (1) y confirmadas (2)
    //Usado en Dashboard_Paciente.xhtml.
    //Estado: En uso. 
    public List<Citas> citaActiva() {
        if (appSession.getUsuario() != null) {
            if(appSession.getUsuario().getPacienteId() != null){
                return getCitasfacade().citaActiva(appSession.getUsuario().getPacienteId().getPacienteId());
            }
            return getCitasfacade().citaActiva(appSession.getUsuario().getUsuarioUsuario());
        }
        System.err.println("Metodo: citasActiva() de Dashboard paciente null");
        return null;
    }

//****************************************************************************//
//                 Métodos Get para obtener datos de entidades                //
//****************************************************************************//
    public CitasFacade getCitasfacade() {
        return citasfacade;
    }

//****************************************************************************//
//                             Métodos Get y SET                              //
//****************************************************************************//  
    //Variable appSession.
    public AppSession getAppSession() {
        return appSession;
    }

    public void setAppSession(AppSession appSession) {
        this.appSession = appSession;
    }

//****************************************************************************//
//                                   Métodos                                  //
//****************************************************************************//    
    //Metodo para encontrar meses, metodo similar al de ExpedientesBean.
    //Usado en: paciente.xhtml
    //Estado: En uso. 
    public String mesCita(Integer mesNumero) {
        String mes = "";
        switch (mesNumero) {
            case 0:
                mes = "Enero";
                break;
            case 1:
                mes = "Febrero";
                break;
            case 2:
                mes = "Marzo";
                break;
            case 3:
                mes = "Abril";
                break;
            case 4:
                mes = "Mayo";
                break;
            case 5:
                mes = "Junio";
                break;
            case 6:
                mes = "Julio";
                break;
            case 7:
                mes = "Agosto";
                break;
            case 8:
                mes = "Septiembre";
                break;
            case 9:
                mes = "Octubre";
                break;
            case 10:
                mes = "Noviembre";
                break;
            case 11:
                mes = "Diciembre";
                break;
        }
        return mes;
    }

    //Metodo para mostrar si tiene citas o no tiene citas
    //Desplegara el mensaje del tipo de cita que es.
    //Usado en: paciente.xhtml
    //Estado: En uso. 
    public String dashboardCita() {
        if (appSession.getUsuario() != null) {
            //Validar de cualquier forma que se envie la sentencia regrese
            //solo una cita.
            List<Citas> c = citaActiva();
            if (c.size() > 0) {
                Integer tipo = 0;
                for (Citas citas : c) {
                    tipo = citas.getCitaEstado();
                }
                switch (tipo) {
                    case 1:
                        return "Tiene una cita pendiente.";
                    case 2:
                        return "Tiene una cita confirmada.";
                    default:
                        return "Tiene que verificar la cita.";
                }
            } else {
                return "No tiene ninguna cita registrada.";
            }
        }
        return "";
    }
    
    //Metodo para habilitar o deshabilitar, el boton de registrar Cita. 
    //Usado en: paciente.xhtml  
    //Estado: En uso. 
    public Boolean registrarBoton(){
        if(getCitasfacade().citaActiva(appSession.getUsuario().getUsuarioUsuario()).size()!=0){
            return true;
        }
        if(appSession.getUsuario().getPacienteId() !=null){
            if(getCitasfacade().citaActiva(appSession.getUsuario().getPacienteId().getPacienteId()).size() !=0){
                return true;
            }
        }
        return false;
    }
}
