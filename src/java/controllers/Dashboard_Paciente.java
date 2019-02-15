/*
Controlador para el Dashboard del Paciente 
Opciones:
-Crear una cita de forma rápida. 
-Informar de si tiene citas para el día. 
 */
package controllers;

import dao.CitasFacade;
import entities.Citas;
import java.io.Serializable;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.SessionScoped;

/**
 *
 * @author user Limpiada: 31/enero/2019 Encargado: Erick
 */

/*
Notas de actualizacion.
********************************************************************************
Fecha: 31/enero/2019
Encargado: Erick
-Se limpio las librerias de Calendar, Date y otras. 
-Se cambio de Named a ManagedBean
-Se cambio de ViewScoped a SessionScoped
-Se elimino variable String usuario.
-Se elimino metodo de Public List<Citas> citasDelDia() se descarto logica. 
-Se descarto el metodo Public Boolean exiteCita() dependia de citasDelDia() y renderizaba un elemento. 
-Se descarta metodo Public Citas citaDelDia(){} rescataba una cita con get(0).
-Se descarto método Public List<Citas> citasMes(), se tendra una sola cita para cada paciente activa. 
-Se agrego la variable appSession para extraer el usuario logeado. 
-Se agrego los get y set de appSession. 
-Se agrego método mesCita(?), para desplegar el nombre del mes. 
-Se agrego método dashboardCita(), desplega un mensaje personalizado del tipo de cita activa.
-Se agrego méetodo registrarBoton(), habilita o deshabilita el boton de registrar cita.

 */
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
    //Metodo para determinar las citas activas del paciente.
    //Citas activas: Estado reservadas o pendiente (1) y confirmadas (2)
    //Usado en Dashboard_Paciente.xhtml.
    //Estado: En uso. 
    //Nota: Se tendran que jugar con las validaciones, para que no permita el ingreso de  mas de una cita. 
    public List<Citas> citaActiva() {
        if (appSession.getUsuario() != null) {
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
    
    //Metodo para habilitar o deshabilitar, el boton. 
    //De registrar cita.
    //Usado en: paciente.xhtml  
    //Estado: Prueba. 
    public Boolean registrarBoton(){
        if(getCitasfacade().citaActiva(appSession.getUsuario().getUsuarioUsuario()).size()!=0){
             System.out.println("Si, al metodo registrarBoton.");
            return true;
        }
         System.out.println("No, al metodo registrarBoton");
        return false;
    }

}
