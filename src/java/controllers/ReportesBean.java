package controllers;

import dao.CitasFacade;
import dao.ConsultasFacade;
import dao.DetallesConsultasFacade;
import dao.ExistenciasFacade;
import dao.PromocionesFacade;
import java.io.Serializable;
import java.text.ParseException;
import java.util.Date;
import java.util.Map;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;
import javax.faces.bean.ViewScoped;
import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;
import util.AbstractBaseReportBean;
import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import org.primefaces.context.RequestContext;

@ManagedBean
@RequestScoped
public class ReportesBean extends AbstractBaseReportBean implements Serializable {

    
//****************************************************************************//
//                          DeclaraciÃ³n de variables                          //
//****************************************************************************//
    private Date fechaInicio;
    private Date fechaFin;
    private int clinicaId;
    private int medicoId;
    private int pacienteId;
    private int consultaId;
    private int citaEstado;

    //llamar el facade que tiene el metodo de la lista de promos demandadas
    @EJB
    private PromocionesFacade promocionesFacade;
    @EJB
    private DetallesConsultasFacade detallesConsultasFacade;
    @EJB
    private ExistenciasFacade existenciasFacade;
    @EJB
    private ConsultasFacade consultasFacade;
    @EJB
    private CitasFacade citasFacade;
     
    


    public ReportesBean() {
        reportDir = "/views/6_reportes/";
    }

    @Override
    protected Map<String, Object> getReportParameters() {
        return reportParameters;
    }

    @Override
    protected JRDataSource getJRDataSource() {
        return new JRBeanCollectionDataSource(objetosReporte);
    }

    public String execute() {
        try {
            super.prepareReport();
        } catch (Exception e) {
            // make your own exception handling
            e.printStackTrace();
        }
        return null;
    }

    public void addParametro(String key, Object valor) {
        reportParameters.put(key, valor);
    }

    public void setObjeto(Object objetos) {
        objetosReporte.clear();
        objetosReporte.add(objetos);
        execute();
    }

//****************************************************************************//
//                       Métodos para generar reportes                        //
//****************************************************************************//
    
    //Método para generar reporte Promociones Demandadas (rep_promociones_demandadas.xhtml).
    public void repPromociones() throws ParseException {
        try{
            if (getPromocionesFacade().findPromocionReport(getFechaInicio(), getFechaFin()).isEmpty()) { //es porque no se esta validando la misma consulta, sino validar si existe registros...
                mensajeReporteVacio("El reporte no contiene páginas.");
            }else{
                /*ExternalContext dir = FacesContext.getCurrentInstance().getExternalContext(); 
                String pathRelativo = "/views/5_reportes/"; 
                String directorio = dir.getRealPath(pathRelativo);*/
                this.setReportDir("/views/5_reportes/");
                this.addParametro("fechaInicio", getFechaInicio());
                this.addParametro("fechaFin", getFechaFin());
                execute();
                RequestContext.getCurrentInstance().execute("window.open('../../servlets/report/PDF','_blank')");
            }
        } catch (Exception e) {
            mensajeError("Se detuvo el proceso en el método: repPromociones.");
        }
    }

    //Método para generar reporte Tratamientos Demandados (rep_tratamientos_demandados.xhtml).
    public void repTratamientos() {
        try{
            if (getDetallesConsultasFacade().findTratamientoDemandaReport(getFechaInicio(), getFechaFin()).isEmpty()) {
                mensajeReporteVacio("El reporte no contiene páginas.");
            }else{
                this.setReportDir("/views/5_reportes/");
                this.addParametro("fechaInicio", getFechaInicio());
                this.addParametro("fechaFin", getFechaFin());
                execute();
                RequestContext.getCurrentInstance().execute("window.open('../../servlets/report/PDF','_blank')");
            }
        } catch (Exception e) {
            mensajeError("Se detuvo el proceso en el método: repTratamientos.");
        }
    }

    //Método para generar reporte Listado de Insumos Médicos (rep_listado_insumos.xhtml).
    public void repInsumos() {
        try{
            if (false) {
                mensajeReporteVacio("El reporte no contiene páginas.");
            }else{
                this.setReportDir("/views/5_reportes/");
                execute();
                RequestContext.getCurrentInstance().execute("window.open('../../servlets/report/PDF','_blank')");
            }
        } catch (Exception e) {
            mensajeError("Se detuvo el proceso en el método: repInsumos.");
        }
    }

    //Método para generar reporte Listado de Insumos Médicos por Agotarse (rep_listadoinsumos_agotados.xhtml).
    public void repInsumosAgotados() {
        try{
            if (getExistenciasFacade().InsumosPorAgotarseReport(getClinicaId()).isEmpty()) {
                mensajeReporteVacio("El reporte no contiene páginas.");
            }else{
                this.setReportDir("/views/5_reportes/");
                this.addParametro("clinicaId", getClinicaId());
                execute();
                RequestContext.getCurrentInstance().execute("window.open('../../servlets/report/PDF','_blank')");
            }
        } catch (Exception e) {
            mensajeError("Se detuvo el proceso en el método: repInsumosAgotados.");
        }
    }

    //Método para generar reporte Listado de Pacientes por Médico (rep_listadopacientes_xmedico.xhtml).
    public void repPacientesxMedico() {
        try{
            if (getConsultasFacade().findPacientesPorMedicoReport(getMedicoId()).isEmpty()) {
                mensajeReporteVacio("El reporte no contiene páginas.");
            }else{
                this.setReportDir("/views/5_reportes/");
                this.addParametro("medicoId", getMedicoId());
                execute();
                RequestContext.getCurrentInstance().execute("window.open('../../servlets/report/PDF','_blank')");
            }
        } catch (Exception e) {
            mensajeError("Se detuvo el proceso en el método: repPacientesxMedico.");
        }
    }
    
    //Método para generar reporte Listado Tratamientos realizados a paciente (rep_tratamientos_apacientes.xhtml).
    public void repTratamientosaPaciente() {
        try{
            if (false) {
                mensajeReporteVacio("El reporte no contiene páginas.");
            }else{
                this.setReportDir("/views/5_reportes/");
                this.addParametro("pacienteId", getPacienteId());
                execute();
                RequestContext.getCurrentInstance().execute("window.open('../../servlets/report/PDF','_blank')");
            }
        } catch (Exception e) {
            mensajeError("Se detuvo el proceso en el método: repTratamientosaPaciente.");
        }
    }

    //Método para generar reporte Listado de Pacientes por Clínica (rep_listadopacientes_xclinica.xhtml).
    public void repCitasxClinica() {
        
        try{
            if (getCitasFacade().findCitasPorSucursalReport(getFechaInicio(), getFechaFin(), getClinicaId(), getCitaEstado()).isEmpty()) {
                mensajeReporteVacio("El reporte no contiene páginas.");
            }else{
                this.setReportDir("/views/5_reportes/");
                this.addParametro("clinicaId", getClinicaId());
                this.addParametro("fechaInicio", getFechaInicio());
                this.addParametro("fechaFin", getFechaFin());
                this.addParametro("citaEstado", getCitaEstado());
                System.out.println("reporte entra"+getCitaEstado());
                execute();
                RequestContext.getCurrentInstance().execute("window.open('../../servlets/report/PDF','_blank')");
            }
        } catch (Exception e) {
            mensajeError("Se detuvo el proceso en el método: repTratamientosaPaciente.");
        }
    }

    //Método para generar reporte de Receta (consultas_gestionar.xhtml).
    public void repReceta() {
        this.setReportDir("/views/5_reportes/");
        this.addParametro("consultaId", getConsultaId());
        execute();
        RequestContext.getCurrentInstance().execute("window.open('../../servlets/report/PDF','_blank')");
    }

    //Método para mostrar mensaje de reporte vacío.
    public void mensajeReporteVacio(String mensaje) {
        FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_WARN, "mensaje", mensaje);
        RequestContext.getCurrentInstance().showMessageInDialog(message);
    }
    
    //Método para mostrar mensaje de error en el sistema.
    public void mensajeError(String mensaje) {
        FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_ERROR, "¡Error!", mensaje);
        RequestContext.getCurrentInstance().showMessageInDialog(message);
    }
    
//****************************************************************************//
//                             Métodos Get y SET                              //
//****************************************************************************//
    public Date getFechaInicio() {
        return fechaInicio;
    }
    public void setFechaInicio(Date fechaInicio) {
        this.fechaInicio = fechaInicio;
    }

    public Date getFechaFin() {
        return fechaFin;
    }
    public void setFechaFin(Date fechaFin) {
        this.fechaFin = fechaFin;
    }

    public int getClinicaId() {
        return clinicaId;
    }
    public void setClinicaId(int clinicaId) {
        this.clinicaId = clinicaId;
    }

    public int getMedicoId() {
        return medicoId;
    }
    public void setMedicoId(int medicoId) {
        this.medicoId = medicoId;
    }

    public int getPacienteId() {
        return pacienteId;
    }
    public void setPacienteId(int pacienteId) {
        this.pacienteId = pacienteId;
    }

    public int getConsultaId() {
        return consultaId;
    }
    public void setConsultaId(int consultaId) {
        this.consultaId = consultaId;
    }

    public PromocionesFacade getPromocionesFacade() {
        return promocionesFacade;
    }
    public DetallesConsultasFacade getDetallesConsultasFacade() {
        return detallesConsultasFacade;
    }

    public int getCitaEstado() {
        return citaEstado;
    }

    public void setCitaEstado(int citaEstado) {
        this.citaEstado = citaEstado;
    }

    public ExistenciasFacade getExistenciasFacade() {
        return existenciasFacade;
    }

    public ConsultasFacade getConsultasFacade() {
        return consultasFacade;
    }

    public CitasFacade getCitasFacade() {
        return citasFacade;
    }
}
