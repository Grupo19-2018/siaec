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
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import javax.ejb.EJB;
import javax.faces.view.ViewScoped;
import javax.inject.Named;
import org.primefaces.model.DashboardModel;
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

    private DashboardModel model;
    private LineChartModel lineModel1 = new LineChartModel();
    private PieChartModel pieModel;
    private LineChartModel sucursalModelo;
    private List<LineChartSeries> sucursales = new ArrayList<>();
    private Integer citasSeleccionable = 3;
    private String citasSeleccionableS = "1";
    List<Citas> citas = new ArrayList<>();

    public DashboardView() {
    }

//****************************************************************************//
//                  Métodos para obtener listas por entidades                 //
//****************************************************************************//
//Usado en:  createLineModels3() 
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
    public DashboardModel getModel() {
        return model;
    }

    public LineChartModel getLineModel1() {
        return lineModel1;
    }

    public PieChartModel getPieModel() {
        return pieModel;
    }

    public void setPieModel(PieChartModel pieModel) {
        this.pieModel = pieModel;
    }

    public Integer getCitasSeleccionable() {
        return citasSeleccionable;
    }

    public void setCitasSeleccionable(Integer citasSeleccionable) {
        this.citasSeleccionable = citasSeleccionable;
    }

    public String getCitasSeleccionableS() {
        return citasSeleccionableS;
    }

    public void setCitasSeleccionableS(String citasSeleccionableS) {
        this.citasSeleccionableS = citasSeleccionableS;
    }

//****************************************************************************//
//                                Métodos                                     //
//****************************************************************************//    
//Carga grafica lineal. 
//Usuado en: estadisticas.xhtml
    public LineChartModel createLineModels3() {
        sucursalModelo = new LineChartModel();
        for (Clinicas c : todasClinicas()) {
            LineChartSeries clinicaSerie = new LineChartSeries();
            clinicaSerie = sucursalEstadistica(c.getClinicaId());
            clinicaSerie.setLabel(c.getClinicaNombre());
            sucursalModelo.addSeries(clinicaSerie);
        }
        sucursalModelo.setTitle("Total de Pacientes Atendidos");
        sucursalModelo.setLegendPosition("e");
        sucursalModelo.setShowPointLabels(true);
        sucursalModelo.getAxes().put(AxisType.X, new CategoryAxis("Mes"));
        Axis yAxis = sucursalModelo.getAxis(AxisType.Y);
        yAxis.setLabel("Paciente");
        yAxis.setTickFormat("%d");
        return sucursalModelo;
    }

//Usado en metodo: sucursalEstadistica(Integer idSucursal)
    private int[] consultasAtendidasPorSucursal(Integer idSucursal) {
        //System.err.println("citasSeleccionable " + citasSeleccionable);
        //System.out.println("controllers.DashboardView.consultasAtendidasPorSucursal()");
        //System.out.println("String de s " + citasSeleccionableS);
        //Integer s = Integer.parseInt(citasSeleccionableS);
        citas = getCitasfacade().citasAtendidasPorSucursal(idSucursal, citasSeleccionable);
        // citas = getCitasfacade().findAll();
        Integer month = 13;
        int contador[] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
        for (Iterator<Citas> iterator = citas.iterator(); iterator.hasNext();) {
            Citas next = iterator.next();
            month = next.getCitaFecha().getMonth();
            String monthString = "";
            switch (month) {
                case 0:
                    contador[0] += 1;
                    monthString = "January";
                    break;
                case 1:
                    contador[1] += 1;
                    monthString = "February";
                    break;
                case 2:
                    contador[2] += 1;
                    monthString = "March";
                    break;
                case 3:
                    contador[3] += 1;
                    monthString = "April";
                    break;
                case 4:
                    contador[4] += 1;
                    monthString = "May";
                    break;
                case 5:
                    contador[5] += 1;
                    monthString = "June";
                    break;
                case 6:
                    contador[6] += 1;
                    monthString = "July";
                    break;
                case 7:
                    contador[7] += 1;
                    monthString = "August";
                    break;
                case 8:
                    contador[8] += 1;
                    monthString = "September";
                    break;
                case 9:
                    contador[9] += 1;
                    monthString = "October";
                    break;
                case 10:
                    contador[10] += 1;
                    monthString = "November";
                    break;
                case 11:
                    contador[11] += 1;
                    monthString = "December";
                    break;
                default:
                    monthString = "Invalid month";
                    break;
            }//Fin Switch 
        }// Fin de iterador Citas
        return contador;
    }

//Usado en metodo: createLineModels3()
    private LineChartSeries sucursalEstadistica(Integer idSucursal) {
        //LineChartModel model2 = new LineChartModel();
        int contador[] = consultasAtendidasPorSucursal(idSucursal);
        LineChartSeries sucursal1 = new LineChartSeries();
        //sucursal1.setLabel("Sucursal 1");
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
        //model2.addSeries(sucursal1);
        return sucursal1;
    }


//Usado en: estadisticas.xhtml
    public PieChartModel createPieModel() {
        pieModel = new PieChartModel();
        pieModel.setData(datosPieModel());
        pieModel.setTitle("Total de pacientes registrados por sexo");
        pieModel.setLegendPosition("w");
        pieModel.setShadow(false);
        return pieModel;
    }

//Usado en: createPieModel
    private Map datosPieModel() {
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
