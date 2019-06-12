package controllers;

import dao.CitasFacade;
import dao.ClinicasFacade;
import dao.PacientesFacade;
import entities.Citas;
import entities.Clinicas;
import entities.Pacientes;
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
public class DashboardView implements Serializable {

//****************************************************************************//
//                          Declaración de variables                          //
//****************************************************************************//
    @EJB
    private CitasFacade citasfacade;

    @EJB
    private PacientesFacade pacientefacade;

    @EJB
    private ClinicasFacade clinicaFacade;

    private PieChartModel graficoCircularPaciente;                      //Grafico circular de pacientes por sexo. 
    private LineChartModel sucursalModelo;                              //Grafico lineal de citasGrafico. 
    private List<Citas> citasGrafico = new ArrayList<>();               //Usado por metodo: consultaPorSucursal()
    private Integer citasSeleccionable = 3;                             //Utilizada para seleccionar el tipo de estadisticas. 
    
    public DashboardView() {
    }

//****************************************************************************//
//                  Métodos para obtener listas por entidades                 //
//****************************************************************************//
//Usado en:  graficoLinealCitas() 
    private List<Clinicas> todasClinicas() {
        return getClinicaFacade().findAll();
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
            LineChartSeries clinicaSerie = new LineChartSeries();
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
    private String tituloGraficoCitas(){
    Calendar fecha = Calendar.getInstance();
    int anyo = fecha.get(Calendar.YEAR);
    switch(citasSeleccionable){
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
        //citasGrafico = getCitasfacade().citasAtendidasPorSucursal(idSucursal, citasSeleccionable);
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
                    sucursal1.set("Enero", contador[i]);
                    break;
                case 1:
                    sucursal1.set("Febrero", contador[i]);
                    break;
                case 2:
                    sucursal1.set("Marzo", contador[i]);
                    break;
                case 3:
                    sucursal1.set("Abril", contador[i]);
                    break;
                case 4:
                    sucursal1.set("Mayo", contador[i]);
                    break;
                case 5:
                    sucursal1.set("Junio", contador[i]);
                    break;
                case 6:
                    sucursal1.set("Julio", contador[i]);
                    break;
                case 7:
                    sucursal1.set("Agosto", contador[i]);
                    break;
                case 8:
                    sucursal1.set("Septiember", contador[i]);
                    break;
                case 9:
                    sucursal1.set("Octubre", contador[i]);
                    break;
                case 10:
                    sucursal1.set("Noviembre", contador[i]);
                    break;
                case 11:
                    sucursal1.set("Diciembre", contador[i]);
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
}
