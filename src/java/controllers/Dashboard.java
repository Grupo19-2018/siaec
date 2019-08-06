package controllers;

import dao.BitacoraFacade;
import dao.CitasFacade;
import dao.ClinicasFacade;
import dao.MenusFacade;
import dao.PacientesFacade;
import dao.PrivilegiosFacade;
import dao.RolesFacade;
import dao.SubmenusFacade;
import dao.UsuariosFacade;
import entities.Bitacora;
import entities.Citas;
import entities.Clinicas;
import entities.Pacientes;
import entities.Usuarios;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.ejb.EJB;
import javax.faces.view.ViewScoped;
import javax.inject.Named;
import org.primefaces.model.chart.Axis;
import org.primefaces.model.chart.AxisType;
import org.primefaces.model.chart.CategoryAxis;
import org.primefaces.model.chart.LineChartModel;
import org.primefaces.model.chart.LineChartSeries;
import org.primefaces.model.chart.PieChartModel;

@Named(value = "dashboard")
@ViewScoped
public class Dashboard implements Serializable {

//****************************************************************************//
//                          Declaración de variables                          //
//****************************************************************************//
    @EJB
    private CitasFacade citasfacade;

    @EJB
    private PacientesFacade pacientefacade;

    @EJB
    private ClinicasFacade clinicaFacade;

    @EJB
    private RolesFacade rolesFacade;
    
    @EJB
    private MenusFacade menusFacade;
    
    @EJB
    private SubmenusFacade submenusFacade;

    @EJB
    private PrivilegiosFacade privilegiosFacade;
    
    @EJB 
    private UsuariosFacade usuariosFacade;
    
    @EJB
    private  BitacoraFacade bitacoraFacade;
            
    private PieChartModel graficoCircularPaciente;                      //Grafico circular de pacientes por sexo. 
    private LineChartModel sucursalModelo;                              //Grafico lineal de citasGrafico. 
    private List<Citas> citasGrafico = new ArrayList<>();               //Usado por metodo: consultaPorSucursal()
    private Integer citasSeleccionable = 3;                             //Utilizada para seleccionar el tipo de estadisticas. 

    public Dashboard() {
    }

//****************************************************************************//
//                  Métodos para obtener listas por entidades                 //
//****************************************************************************//
//Todas clinicas utilizado.
//Usado en: metodo[graficoLinealCitas()], vista[asistente.xhtml]
    public List<Clinicas> todasClinicas() {
        return getClinicaFacade().findAll();
    }

//Citas activas: Estado reservadas o pendiente (1) y confirmadas (2)
//Usado: Dashboard_Paciente.xhtml.
    public List<Citas> citaActiva(Usuarios usuario) {
        if (usuario != null) {
            if (usuario.getPacienteId() != null) {
                return getCitasfacade().citaActiva(usuario.getPacienteId().getPacienteId());
            }
            return getCitasfacade().citaActiva(usuario.getUsuarioUsuario());
        }
        System.err.println("Metodo: citasActiva() de Dashboard paciente null");
        return null;
    }

//Usado en: dashboard administracion.xhmlt
public Integer totalRoles(){
    return getRolesFacade().findAll().size();
}

//Usado en: dashboard administracion.xhmlt
public Integer totalMenus(){
    return getMenusFacade().findAll().size();
}

//Usado en: dashboard administracion.xhmlt
public Integer totalSubmenus(){
    return getSubmenusFacade().findAll().size();
}

//Usado en: dashboard administracion.xhmlt
public Integer totalPrivilegios(){
    return getPrivilegiosFacade().findAll().size();
}

//Usado en: dashboard administracion.xhmlt
public Integer totalUsuarios(){
    return getUsuariosFacade().findAll().size();
}

//Usado en: dashboard administracion.xhmlt
public Integer totalRegistroBitacora(){
    return getBitacoraFacade().findAll().size();
}

//Usado en: dashboard administracion.xhmlt
public List<Bitacora> todosRegistroBitacora(){
    return getBitacoraFacade().findAll();
}
//****************************************************************************//
//                 Métodos Get para obtener datos de entidades                //
//****************************************************************************//
    public CitasFacade getCitasfacade() {
        return citasfacade;
    }

    public PacientesFacade getPacientefacade() {
        return pacientefacade;
    }

    public ClinicasFacade getClinicaFacade() {
        return clinicaFacade;
    }

    public RolesFacade getRolesFacade() {
        return rolesFacade;
    }

    public MenusFacade getMenusFacade() {
        return menusFacade;
    }

    public SubmenusFacade getSubmenusFacade() {
        return submenusFacade;
    }

    public PrivilegiosFacade getPrivilegiosFacade() {
        return privilegiosFacade;
    }

    public UsuariosFacade getUsuariosFacade() {
        return usuariosFacade;
    }

    public BitacoraFacade getBitacoraFacade() {
        return bitacoraFacade;
    }
//****************************************************************************//
//                             Métodos Get y SET                              //
//****************************************************************************//
    public Integer getCitasSeleccionable() {
        return citasSeleccionable;
    }

    public void setCitasSeleccionable(Integer citasSeleccionable) {
        this.citasSeleccionable = citasSeleccionable;
    }

//****************************************************************************//
//                                Métodos                                     //
//****************************************************************************//    
//Carga grafica lineal de citas. 
//Usuado en: estadisticas.xhtml
    public LineChartModel graficoLinealCitas() {
        sucursalModelo = new LineChartModel();
        for (Clinicas c : todasClinicas()) {
            LineChartSeries clinicaSerie;// = new LineChartSeries();
            clinicaSerie = sucursalEstadistica(c.getClinicaId());
            clinicaSerie.setLabel(c.getClinicaNombre());
            sucursalModelo.addSeries(clinicaSerie);
        }
        sucursalModelo.setTitle(tituloGraficoCitas());
        sucursalModelo.setLegendPosition("e");
        sucursalModelo.setShowPointLabels(true);
        sucursalModelo.getAxes().put(AxisType.X, new CategoryAxis("Mes"));
        Axis yAxis = sucursalModelo.getAxis(AxisType.Y);
        yAxis.setLabel("Paciente");
        yAxis.setTickFormat("%d");
        return sucursalModelo;
    }

//Usado: graficoLinealCitas()
    private String tituloGraficoCitas() {
        Calendar fecha = Calendar.getInstance();
        int anyo = fecha.get(Calendar.YEAR);
        switch (citasSeleccionable) {
            case 1:
                return "Total de Citas Reservadas " + anyo;
            case 2:
                return "Total de Citas Confirmadas " + anyo;
            case 3:
                return "Total de Pacientes Atendidos " + anyo;
            case 4:
                return "Total de Citas Canceladas " + anyo;
        }
        return "";
    }

//Metodo para extraer las citasGrafico del anyo y dividirlas en meses segun el tipo. 
//Usado: metodo sucursalEstadistica(Integer idSucursal)
    private int[] consultasPorSucursal(Integer idSucursal) {
        Calendar fechaInicio = Calendar.getInstance();
        int year = fechaInicio.get(Calendar.YEAR);
        fechaInicio.set(year, Calendar.JANUARY, 1, 0, 0, 0);
        Calendar fechaFin = Calendar.getInstance();
        fechaFin.set(year + 1, Calendar.JANUARY, 1, 0, 0, 0);
        citasGrafico = getCitasfacade().findPacientesPorClinicaReporte(idSucursal, citasSeleccionable, fechaInicio.getTime(), fechaFin.getTime());
        Integer month = 13;
        int contador[] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
        for (Citas next : citasGrafico) {
            month = next.getCitaFecha().getMonth();
            switch (month) {
                case 0: //Enero
                    contador[0] += 1;
                    break;
                case 1: //Febrero
                    contador[1] += 1;
                    break;
                case 2: //Marzo
                    contador[2] += 1;
                    break;
                case 3: //Abril
                    contador[3] += 1;
                    break;
                case 4: //Mayo
                    contador[4] += 1;
                    break;
                case 5: //Junio
                    contador[5] += 1;
                    break;
                case 6: //Julio
                    contador[6] += 1;
                    break;
                case 7: //Agosto
                    contador[7] += 1;
                    break;
                case 8: //Septiembre
                    contador[8] += 1;
                    break;
                case 9: //Octubre
                    contador[9] += 1;
                    break;
                case 10: //Noviembre
                    contador[10] += 1;
                    break;
                case 11: //Diciembre
                    contador[11] += 1;
                    break;
                default:
                    break;
            }
        }
        return contador;
    }

//Carga al grafico lienal los 12 meses y las citasGrafico atendidas en esos meses. 
//Usado en metodo: graficoLinealCitas()
    private LineChartSeries sucursalEstadistica(Integer idSucursal) {
        int contador[] = consultasPorSucursal(idSucursal);
        LineChartSeries sucursal1 = new LineChartSeries();
        for (int i = 0; i < contador.length; i++) {
            switch (i) {
                case 0:
                    sucursal1.set("Ene", contador[i]);
                    break;
                case 1:
                    sucursal1.set("Feb", contador[i]);
                    break;
                case 2:
                    sucursal1.set("Mar", contador[i]);
                    break;
                case 3:
                    sucursal1.set("Abr", contador[i]);
                    break;
                case 4:
                    sucursal1.set("May", contador[i]);
                    break;
                case 5:
                    sucursal1.set("Jun", contador[i]);
                    break;
                case 6:
                    sucursal1.set("Jul", contador[i]);
                    break;
                case 7:
                    sucursal1.set("Ago", contador[i]);
                    break;
                case 8:
                    sucursal1.set("Sep", contador[i]);
                    break;
                case 9:
                    sucursal1.set("Oct", contador[i]);
                    break;
                case 10:
                    sucursal1.set("Nov", contador[i]);
                    break;
                case 11:
                    sucursal1.set("Dic", contador[i]);
                    break;
            }
        }
        return sucursal1;
    }

//Usado en: estadisticas.xhtml
    public PieChartModel graficoPacientesPorSexo() {
        graficoCircularPaciente = new PieChartModel();
        graficoCircularPaciente.setData(datosPacientesPorSexo());
        graficoCircularPaciente.setTitle("Total de pacientes registrados por sexo");
        graficoCircularPaciente.setLegendPosition("w");
        graficoCircularPaciente.setShadow(false);
        return graficoCircularPaciente;
    }

//Usado en:  graficoPacientesPorSexo()
    private Map datosPacientesPorSexo() {
        Map<String, Number> data = new HashMap<>();
        data.put("Hombres", getPacientefacade().todosPacientesPorSexo(true).size());
        data.put("Mujeres", getPacientefacade().todosPacientesPorSexo(false).size());
        return data;
    }

//Calcula la cantidad de pacientes registrados. 
//Usado en: estadisticas.xhtml
    public double totalPacientesRegistrado() {
        List<Pacientes> paciente = getPacientefacade().findAll();
        return paciente.size();
    }

//Calcula la cantidad de consultar realizadas. 
//Usado en: estadistica.xhtml
    public double totalConsultasRealizadas() {
        List<Citas> cita = getCitasfacade().citasAtendidasEstado(1);
        return cita.size();
    }

//Calcula la cantidad de consulta realizadas al mes.
//Usado en: estadistica.xhtml
    public double pacientesRegistradosMes() {
        Calendar fecha = Calendar.getInstance();
        int mes = fecha.get(Calendar.MONTH);
        int anyo = fecha.get(Calendar.YEAR);
        Calendar inicio = Calendar.getInstance();
        Calendar fin = Calendar.getInstance();
        inicio.set(anyo, mes, 1, 0, 0, 0);
        fin.set(anyo, mes + 1, 1, 23, 59, 60);
        fin.add(Calendar.DAY_OF_MONTH, -1);
        List<Pacientes> pacientes = getPacientefacade().pacientesFechaCreacionRango(inicio.getTime(), fecha.getTime());
        return pacientes.size();
    }

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

//Mostrar citas a atende en el Dia. 
//Usado en: medico.xhtml
    public List<Citas> citasDelDia(Usuarios usuario) {
        if (usuario != null) {
            return getCitasfacade().citasDelDiaMedico(usuario.getMedicoId().getMedicoId());
        }
        return null;
    }

//Mostrar citas en el Dia.
//Usado en: medico.xhtml
    public String cantidadCitasDia(Usuarios usuario) {
        if (!agendaMedico(usuario).isEmpty()) {
            if (citasDelDia(usuario).size() == 1) {
                return "Tiene " + agendaMedico(usuario).size() + " cita agendada";
            } else {
                return "Tiene " + agendaMedico(usuario).size() + " citas agendadas";
            }
        } else {
            return "No tiene citas agendadas";
        }
    }

//Metodo para mostrar agenda.
//Usado en: cita_clinica_agenda.xhtml
    public List<Citas> agendaMedico(Usuarios usuario) {
        if (usuario.getMedicoId() != null) {
            return getCitasfacade().agendaMedico(usuario.getMedicoId().getMedicoId());
        }
        return null;
    }

//Metodo para mostrar si tiene citas o no tiene citas
//Usado en: paciente.xhtml
    public String dashboardCita(Usuarios usuario) {
        if (usuario != null) {
            //Validar de cualquier forma que se envie la sentencia regrese
            //solo una cita.
            List<Citas> c = citaActiva(usuario);
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
    public Boolean registrarBoton(Usuarios usuario) {
        if (!getCitasfacade().citaActiva(usuario.getUsuarioUsuario()).isEmpty()) {
            return true;
        }
        if (usuario.getPacienteId() != null) {
            if (!getCitasfacade().citaActiva(usuario.getPacienteId().getPacienteId()).isEmpty()) {
                return true;
            }
        }
        return false;
    }

}
