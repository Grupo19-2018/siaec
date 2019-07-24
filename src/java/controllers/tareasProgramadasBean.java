package controllers;

import dao.ConfiguracionesFacade;
import dao.PacientesFacade;
import dao.PromocionesFacade;
import entities.Configuraciones;
import entities.Pacientes;
import entities.Promociones;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.ejb.EJB;
import javax.ejb.Schedule;
import javax.ejb.Singleton;
import javax.ejb.Startup;
import javax.ejb.Stateless;
import util.CorreoBasico;
import util.CorreoPlantilla;

@Stateless
public class tareasProgramadasBean {

//****************************************************************************//
//                          Declaración de variables                          //
//****************************************************************************//
    @EJB
    private PacientesFacade pacientesFacade;

    @EJB
    private PromocionesFacade promocionesFacade;
    
    @EJB
    private ConfiguracionesFacade configuracionFacade;

//****************************************************************************//
//                  Métodos para obtener listas por entidades                 //
//****************************************************************************//
    private List<Pacientes> pacientesEnviarPromocion(Boolean promocionGeneral) {
        return getPacientesFacade().pacientesEnvioPromocion(promocionGeneral);
    }

    private List<Pacientes> pacientesCumpleanyerosMes(String mes, Boolean promocionCumpleanyos) {
        return getPacientesFacade().pacienteCumpleanyero(mes, promocionCumpleanyos);
    }

    private List<Promociones> promocionesCumpleanyosMes() {
        return getPromocionesFacade().promocionesFechaMes();
    }

    private List<Promociones> promocionesGenerales() {
        return getPromocionesFacade().promocionesEspeciales();
    }

//****************************************************************************//
//                 Métodos Get para obtener datos de entidades                //
//****************************************************************************//
    public PacientesFacade getPacientesFacade() {
        return pacientesFacade;
    }

    public PromocionesFacade getPromocionesFacade() {
        return promocionesFacade;
    }

    public ConfiguracionesFacade getConfiguracionFacade() {
        return configuracionFacade;
    }

//****************************************************************************//
//                   Métodos para tareas programas                            //
//****************************************************************************//
    //@Schedule(dayOfMonth = "*", hour = "*", minute = "*/4", persistent = false)
    @Schedule(dayOfMonth = "1,2,3,4,5", hour = "19", minute = "0", persistent = false)
    public void enviarPromocionesCumpleanyos() {
        try {
            Configuraciones correoConfiguracion = getConfiguracionFacade().find(1);
            if (correoConfiguracion != null) {
                if (correoConfiguracion.getConfiguracionCorreoActivo() && correoConfiguracion.getConfiguracionPromocionCumpleanyos()) {
                    CorreoPlantilla correoP = new CorreoPlantilla();
                    String cuerpo = "";
                    Integer enviadosMes = correoConfiguracion.getConfiguracionCorreoEnviadoMes();
                    Integer enviadosDia = correoConfiguracion.getConfiguracionCorreoEnviadoDia();
                    Integer limiteMes = correoConfiguracion.getConfiguracionCorreoMes();
                    Integer limiteDia = correoConfiguracion.getConfiguracionCorreoDia();
                    if (((enviadosMes < limiteMes && enviadosDia < limiteDia) || correoConfiguracion.getConfiguracionCorreoIlimitada())
                            && !correoConfiguracion.getConfiguracionCorreoCuenta().isEmpty()) {
                        List<Promociones> promocionesEnviar = promocionesCumpleanyosMes();
                        if (!promocionesEnviar.isEmpty()) {
                            List<Pacientes> pacientesEnviar = pacientesCumpleanyerosMes(mesCumpleanyosEnviar(), Boolean.FALSE);
                            if (!pacientesEnviar.isEmpty()) {
                                CorreoBasico enviar = new CorreoBasico(correoConfiguracion);
                                for (Pacientes p : pacientesEnviar) {
                                    if ((enviadosMes < limiteMes && enviadosDia < limiteDia) || correoConfiguracion.getConfiguracionCorreoIlimitada()) {
                                        System.out.println("El paciente: " + p.getPacientePrimerNombre() + " recibira.");
                                        enviadosDia++;
                                        enviadosMes++;
                                        for (Promociones promo : promocionesEnviar) {
                                            cuerpo = cuerpo + promo.getPromocionMensaje() + "<br/>";
                                        }
                                        System.out.println("Promociones " + cuerpo);
                                        String body = correoP.plantillaN2(cuerpo);
                                        if (promocionesEnviar.size() == 1) {
                                            enviar.sendMailHTML(p.getPacienteCorreo(), promocionesEnviar.get(0).getPromocionNombre(), body);
                                            System.out.println("se envio para uno");
                                        } else {
                                            enviar.sendMailHTML(p.getPacienteCorreo(), "Ven y descubre las promociones que tenemos en el mes de tu cumpleaños!", body);
                                            System.out.println("se envio para muchos");
                                        }
                                    }//Fin de if enviadosDia <= limiteDia
                                }//For paciente
                            }//Fin de for paciente
                        }//Fin del if promociones vacias 
                    }//Fin de correo ilimato y cuenta no null
                    correoConfiguracion.setConfiguracionCorreoEnviadoDia(enviadosDia);
                    correoConfiguracion.setConfiguracionCorreoEnviadoMes(enviadosMes);
                    getConfiguracionFacade().edit(correoConfiguracion);
                }//Fin de correo activo
            }
        } catch (Exception e) {
            System.err.println( new Date() + " Error en enviarPromocionesCumpleanyos");
        } finally {
            System.out.println(new Date() + " Se termino de mandar las promociones de cumpleañeros");
        }
    }

    //@Schedule(dayOfMonth = "*", hour = "*", minute = "*/5", persistent = false)
    @Schedule(dayOfMonth = "*", hour = "20", minute = "0", persistent = false)
    public void promocionesGeneralesEnviar() {
        try {
            Configuraciones correoConfiguracion = getConfiguracionFacade().find(1);
            if (correoConfiguracion != null) {
                if (correoConfiguracion.getConfiguracionCorreoActivo() && correoConfiguracion.getConfiguracionPromocionGeneral()) {
                    CorreoPlantilla correoP = new CorreoPlantilla();
                    String cuerpo = "";
                    Integer enviadosMes = correoConfiguracion.getConfiguracionCorreoEnviadoMes();
                    Integer enviadosDia = correoConfiguracion.getConfiguracionCorreoEnviadoDia();
                    Integer limiteMes = correoConfiguracion.getConfiguracionCorreoMes();
                    Integer limiteDia = correoConfiguracion.getConfiguracionCorreoDia();
                    if ((enviadosMes < limiteMes && enviadosDia < limiteDia) || correoConfiguracion.getConfiguracionCorreoIlimitada()) {
                        if (!correoConfiguracion.getConfiguracionCorreoCuenta().isEmpty()) {
                            List<Promociones> promocionesEnviar = promocionesGenerales();
                            if (!promocionesEnviar.isEmpty()) {
                                CorreoBasico enviar = new CorreoBasico(correoConfiguracion);
                                List<Pacientes> pacientesEnviar = pacientesEnviarPromocion(Boolean.FALSE);
                                for (Pacientes p : pacientesEnviar) {
                                    if ((enviadosMes < limiteMes && enviadosDia < limiteDia) || correoConfiguracion.getConfiguracionCorreoIlimitada()) {
                                        enviadosDia++;
                                        enviadosMes++;
                                        for (Promociones promo : promocionesEnviar) {
                                            cuerpo = cuerpo + promo.getPromocionMensaje() + "<br/>";
                                        }
                                        String body = correoP.plantillaN2(cuerpo);
                                        if (promocionesEnviar.size() == 1) {
                                            enviar.sendMailHTML(p.getPacienteCorreo(), promocionesEnviar.get(0).getPromocionNombre(), body);
                                            System.out.println("se envio para uno");
                                        } else {
                                            enviar.sendMailHTML(p.getPacienteCorreo(), "Aprovecha estas promociones especiales para ti!", body);
                                            System.out.println("se envio para muchos");
                                        }
                                    }//Fin de if enviadosDia <= limiteDia
                                }//Fin de for paciente
                            }//Fin de hay promociones
                        }//Fin de si cuenta esta vacia.  
                    }//Fin de mandar correos limitado o ilimitados
                    correoConfiguracion.setConfiguracionCorreoEnviadoDia(enviadosDia);
                    correoConfiguracion.setConfiguracionCorreoEnviadoMes(enviadosMes);
                    getConfiguracionFacade().edit(correoConfiguracion);
                }//Fin de correo activo.
            }
        } catch (Exception e) {
            System.err.println(new Date() + "Error con el metodo promocionesGeneralesEnviar(): " + e);
        }finally{
            System.out.println( new Date() + "Se termino de mandar las promociones generales.");
        }
    }

    //@Schedule(dayOfMonth = "*", hour = "*", minute = "*/3", persistent = false)
    @Schedule(dayOfMonth = "*", hour = "22", minute = "50", persistent = false)
    public void reiniciarMensajesDia() {
        try {
            System.out.println("reiniciando hora" + new Date());
            Configuraciones correoConfiguracion = getConfiguracionFacade().find(1);
            if (correoConfiguracion.getConfiguracionCorreoActivo() && !correoConfiguracion.getConfiguracionCorreoIlimitada()) {
                correoConfiguracion.setConfiguracionCorreoEnviadoDia(0);
                getConfiguracionFacade().edit(correoConfiguracion);
            }
        } catch (Exception e) {
            System.err.println(e);
        }
    }

    //@Schedule(dayOfMonth = "*", hour = "*", minute = "*/5", persistent = false)
    @Schedule(dayOfMonth = "Last", hour = "23", minute = "0", persistent = false)
    public void reiniciarMensajesMes() {
        try {
            System.out.println("reiniciando mes " + new Date());
            Configuraciones correoConfiguracion = getConfiguracionFacade().find(1);
            if (correoConfiguracion.getConfiguracionCorreoActivo() && !correoConfiguracion.getConfiguracionCorreoIlimitada()) {
                correoConfiguracion.setConfiguracionCorreoEnviadoMes(0);
                getConfiguracionFacade().edit(correoConfiguracion);
            }
        } catch (Exception e) {
            System.err.println(e);
        }
    }
    
    @Schedule(dayOfMonth = "1", hour = "1", minute = "0", persistent = false)
    public void reiniciarEnvioPromociones(){
        try {
            List<Pacientes> p = getPacientesFacade().findAll();
            for (Pacientes paciente : p ) {
                paciente.setPacientePromocionGeneral(Boolean.FALSE);
                paciente.setPacientePromocionCumpleanyos(Boolean.FALSE);
                getPacientesFacade().edit(paciente);
            }
        } catch (Exception e) {
            System.err.println("Error en el metodo reiniciarEnvioPromocionesGenerales, fecha: " + new Date());
            System.err.println(e);
        }
    }

//****************************************************************************//
//                   Métodos para tareas programas                            //
//****************************************************************************//
    //Utilizado en: enviarPromocionesCumpleanyos()
    private String mesCumpleanyosEnviar() {
        Calendar mesEvaluar = Calendar.getInstance();
        Integer m1 = mesEvaluar.get(Calendar.MONTH) + 1;
        if(m1<10){
         return "0"+Integer.toString(m1);
        }
        return Integer.toString(m1);
    }

}
