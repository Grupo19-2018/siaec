package controllers;

import dao.CitasFacade;
import dao.ClinicasFacade;
import dao.ConsultasFacade;
import dao.DetallesConsultasFacade;
import dao.ExistenciasFacade;
import dao.MedicosFacade;
import dao.PacientesFacade;
import dao.PromocionesFacade;
import entities.Clinicas;
import entities.Medicos;
import entities.Pacientes;
import entities.Submenus;
import java.io.IOException;
import java.io.Serializable;
import java.text.ParseException;
import java.util.Date;
import java.util.List;
import java.util.Map;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.RequestScoped;
import javax.faces.bean.ViewScoped;
import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;
import javax.servlet.http.HttpServletRequest;
import util.AbstractBaseReportBean;
import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import org.primefaces.context.RequestContext;

@ManagedBean
@RequestScoped
public class ReportesBean extends AbstractBaseReportBean implements Serializable {
    
//****************************************************************************//
//                          Declaración de variables                          //
//****************************************************************************//
    
    private Date fechaInicio;
    private Date fechaFin;
    private int clinicaId;
    private int medicoId;
    private int pacienteId;
    private int consultaId;
    private int citaEstado;

    @EJB
    private PacientesFacade pacientesFacade;
    
    @EJB
    private ClinicasFacade clinicasFacade;
    
    @EJB
    private MedicosFacade medicosFacade;
    
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
     
    //Session
    @ManagedProperty(value = "#{appSession}")
    private AppSession appSession;
    
    public ReportesBean() {
        reportDir = "/views/6_reportes/";
    }

//****************************************************************************//
//                  Métodos para obtener listas por entidades                 //
//****************************************************************************//
    
    public List<Submenus> todosSubmenusDisponibles(){
        return appSession.getUsuario().getRolId().getSubmenusList();
    }
    
    public List<Pacientes> todosPacientesDisponibles() {
        return getPacientesFacade().pacientesDisponibles(Boolean.TRUE);
    }
    
    public List<Clinicas> todasSucursalesDisponibles(){
        return getClinicasFacade().clinicasDisponibles(Boolean.TRUE);
    }
    
    public List<Medicos> todosMedicosDisponibles() {
        return getMedicosFacade().medicosDisponibles(Boolean.TRUE);
    }
    
//****************************************************************************//
//                  Métodos para obtener listas por entidades                 //
//****************************************************************************//

    public ExistenciasFacade getExistenciasFacade() {
        return existenciasFacade;
    }

    public ConsultasFacade getConsultasFacade() {
        return consultasFacade;
    }

    public CitasFacade getCitasFacade() {
        return citasFacade;
    }
    
    public PromocionesFacade getPromocionesFacade() {
        return promocionesFacade;
    }
    
    public DetallesConsultasFacade getDetallesConsultasFacade() {
        return detallesConsultasFacade;
    }

    public PacientesFacade getPacientesFacade() {
        return pacientesFacade;
    }

    public ClinicasFacade getClinicasFacade() {
        return clinicasFacade;
    }

    public MedicosFacade getMedicosFacade() {
        return medicosFacade;
    }
       
//****************************************************************************//
//                 Métodos Get para obtener datos de entidades                //
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
    
    public int getCitaEstado() {
        return citaEstado;
    }
    public void setCitaEstado(int citaEstado) {
        this.citaEstado = citaEstado;
    }

    public AppSession getAppSession() {
        return appSession;
    }
    public void setAppSession(AppSession appSession) {
        this.appSession = appSession;
    }
    
//****************************************************************************//
//                                  Métodos                                   //
//****************************************************************************//
    
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
    public void repPromocionesDemandadas() throws ParseException {
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
            mensajeError("Se detuvo el proceso en el método: repPromocionesDemandadas.");
        }
    }

    //Método para generar reporte Tratamientos Demandados (rep_tratamientos_demandados.xhtml).
    public void repTratamientosDemandados() {
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
            mensajeError("Se detuvo el proceso en el método: repTratamientosDemandados.");
        }
    }

    //Método para generar reporte Listado de Insumos Médicos (rep_listado_insumos.xhtml).
    public void repListadoInsumos() {
        try{
            if (false) {
                mensajeReporteVacio("El reporte no contiene páginas.");
            }else{
                this.setReportDir("/views/5_reportes/");
                execute();
                RequestContext.getCurrentInstance().execute("window.open('../../servlets/report/PDF','_blank')");
            }
        } catch (Exception e) {
            mensajeError("Se detuvo el proceso en el método: repListadoInsumos.");
        }
    }

    //Método para generar reporte Listado de Insumos Médicos por Agotarse (rep_listadoinsumos_agotados.xhtml).
    public void repSolicitudInsumos() {
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
            mensajeError("Se detuvo el proceso en el método: repSolicitudInsumos.");
        }
    }

    //Método para generar reporte Listado de Pacientes por Médico (rep_listadopacientes_xmedico.xhtml).
    public void repPacientesPorMedico() {
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
            mensajeError("Se detuvo el proceso en el método: repPacientesPorMedico.");
        }
    }
    
    //Método para generar reporte Listado Tratamientos realizados a paciente (rep_tratamientos_apacientes.xhtml).
    public void repTratamientosPaciente() {
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
            mensajeError("Se detuvo el proceso en el método: repTratamientosPaciente.");
        }
    }

    //Método para generar reporte Listado de Pacientes por Clínica (rep_listadopacientes_xclinica.xhtml).
    public void repCitasPorClinica() {
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
            mensajeError("Se detuvo el proceso en el método: repCitasPorClinica.");
        }
    }

    //Método para generar reporte de Receta (consultas_gestionar.xhtml).
    public void repReceta() {
        try{
            this.setReportDir("/views/5_reportes/");
            this.addParametro("consultaId", getConsultaId());
            execute();
            RequestContext.getCurrentInstance().execute("window.open('../../servlets/report/PDF','_blank')");
        } catch (Exception e) {
            mensajeError("Se detuvo el proceso en el método: repReceta.");
        }
    }

    //Método para verificar si el usuario tiene acceso a la página consultada. (Todas las páginas)
    public void verificaAcceso(String pagina){
        //System.out.println("Entra al método del usuario.");
        boolean acceso = false;
        try{
            FacesContext context = FacesContext.getCurrentInstance();
            HttpServletRequest origRequest = (HttpServletRequest) context.getExternalContext().getRequest();
            String contextPath = origRequest.getContextPath();

            if(appSession.getUsuario() == null){
                FacesContext.getCurrentInstance().getExternalContext().redirect(contextPath+"/login.xhtml");
            }
            else{
                if(!(appSession.getUsuario().getRolId().getSubmenusList().isEmpty())){
                    for (Submenus submenu : todosSubmenusDisponibles()){
                        //System.out.println("Submenu: " + submenu.getSumbenuNombre());
                        if(submenu.getSumbenuNombre().equals(pagina)){
                            acceso = true;
                        }
                    }
                }
            }
            if(!acceso){
                FacesContext.getCurrentInstance().getExternalContext().redirect(contextPath+"/login.xhtml");
            }
        } catch(IOException e){
            System.out.println("La variable appSession es nula.");
        }
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
   
}