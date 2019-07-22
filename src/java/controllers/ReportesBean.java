package controllers;

import dao.CitasFacade;
import dao.ClinicasFacade;
import dao.ConsultasFacade;
import dao.DetallesConsultasFacade;
import dao.ExistenciasFacade;
import dao.InsumosFacade;
import dao.MedicosFacade;
import dao.PacientesFacade;
import dao.PromocionesFacade;
import dao.TratamientosFacade;
import entities.Clinicas;
import entities.Insumos;
import entities.Medicos;
import entities.Pacientes;
import entities.Submenus;
import entities.Tratamientos;
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
    
    private Date fechaActual = new Date();
    private Date fechaInicio;
    private Date fechaFin;
    private Integer clinicaId;
    private Integer medicoId;
    private Integer tratamientoId;
    private Integer pacienteId;
    private Integer consultaId;
    private Integer estadoCita;
    private String citaEstado;

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
     
    @EJB
    private TratamientosFacade tratamientosFacade;
     
    @EJB
    private InsumosFacade insumosFacade;
     
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
    
    public List<Tratamientos> todosTratamientosDisponibles(){
        return getTratamientosFacade().tratamientosDisponibles(Boolean.TRUE);
    }
    
    public List<Medicos> todosMedicosDisponibles() {
        return getMedicosFacade().medicosDisponibles(Boolean.TRUE);
    }
    
    public List<Insumos> todosInsumosDisponibles() {
        return getInsumosFacade().insumosDisponibles(Boolean.TRUE);
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
    
    public TratamientosFacade getTratamientosFacade() {
        return tratamientosFacade;
    }
    
    public InsumosFacade getInsumosFacade() {
        return insumosFacade;
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

    public Integer getClinicaId() {
        return clinicaId;
    }
    public void setClinicaId(Integer clinicaId) {
        this.clinicaId = clinicaId;
    }

    public Integer getMedicoId() {
        return medicoId;
    }
    public void setMedicoId(Integer medicoId) {
        this.medicoId = medicoId;
    }

    public Integer getTratamientoId() {
        return tratamientoId;
    }
    public void setTratamientoId(Integer tratamientoId) {
        this.tratamientoId = tratamientoId;
    }

    public Integer getPacienteId() {
        return pacienteId;
    }
    public void setPacienteId(Integer pacienteId) {
        this.pacienteId = pacienteId;
    }

    public Integer getEstadoCita() {
        return estadoCita;
    }
    public void setEstadoCita(Integer estadoCita) {
        this.estadoCita = estadoCita;
    }

    public String getCitaEstado() {
        return citaEstado;
    }
    public void setCitaEstado(String citaEstado) {
        this.citaEstado = citaEstado;
    }

    public Integer getConsultaId() {
        return consultaId;
    }
    public void setConsultaId(Integer consultaId) {
        this.consultaId = consultaId;
    }
    
    public AppSession getAppSession() {
        return appSession;
    }
    public void setAppSession(AppSession appSession) {
        this.appSession = appSession;
    }

    public Date getFechaActual() {
        return fechaActual;
    }
    public void setFechaActual(Date fechaActual) {
        this.fechaActual = fechaActual;
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
    
    //Método para generar reporte Promociones Más Demandadas (rep_promociones_demandadas.xhtml).
    public void repPromocionesDemandadas() throws ParseException {
        try{
            if (getConsultasFacade().findPromocionesMasDemandadasReporte(getFechaInicio(), getFechaFin()).isEmpty()) { //es porque no se esta validando la misma consulta, sino validar si existe registros...
                mensajeReporteVacio("El reporte no contiene páginas.");
            }else{
                this.setReportDir("/views/5_reportes/");
                this.setNombreArchivo("rep_promociones_demandadas");
                this.addParametro("fechaInicio", getFechaInicio());
                this.addParametro("fechaFin", getFechaFin());
                execute();
                RequestContext.getCurrentInstance().execute("window.open('../../servlets/report/PDF','_blank')");
            }
        } catch (Exception e) {
            mensajeError("Se detuvo el proceso en el método: repPromocionesDemandadas.");
        }
    }

    //Método para generar reporte Tratamientos Más Demandados (rep_tratamientos_demandados.xhtml).
    public void repTratamientosDemandados() {
        try{
            if (getDetallesConsultasFacade().findTratamientosMasDemandadosReporte(getFechaInicio(), getFechaFin()).isEmpty()) {
                mensajeReporteVacio("El reporte no contiene páginas.");
            }else{
                this.setReportDir("/views/5_reportes/");
                this.setNombreArchivo("rep_tratamientos_demandados");
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
            if (getInsumosFacade().findListadoInsumosReporte(Boolean.TRUE).isEmpty()) {
                mensajeReporteVacio("El reporte no contiene páginas.");
            }else{
                this.setReportDir("/views/5_reportes/");
                this.setNombreArchivo("rep_listado_insumos");
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
            if(clinicaId == 0){
                if (getExistenciasFacade().findSolicitudInsumosTodasClinicasReporte(Boolean.TRUE).isEmpty()) {
                    mensajeReporteVacio("El reporte no contiene páginas.");
                }else{
                    this.setReportDir("/views/5_reportes/");
                    this.setEstadoCita(2);
                    this.setNombreArchivo("rep_solicitud_insumos_todos");
                    execute();
                    RequestContext.getCurrentInstance().execute("window.open('../../servlets/report/PDF','_blank')");
                }
            }
            else{
                if (getExistenciasFacade().findSolicitudInsumosPorClinicasReporte(Boolean.TRUE, getClinicaId()).isEmpty()) {
                    mensajeReporteVacio("El reporte no contiene páginas.");
                }else{
                    this.setReportDir("/views/5_reportes/");
                    this.setNombreArchivo("rep_solicitud_insumos");
                    this.setEstadoCita(2);
                    this.addParametro("clinicaId", getClinicaId());
                    execute();
                    RequestContext.getCurrentInstance().execute("window.open('../../servlets/report/PDF','_blank')");
                }
            }
        } catch (Exception e) {
            mensajeError("Se detuvo el proceso en el método: repSolicitudInsumos.");
        }
    }

    //Método para generar reporte Listado de Pacientes por Médico (rep_pacientes_por_medico.xhtml).
    public void repPacientesPorMedico() {
        try{
            if (getConsultasFacade().findPacientesPorMedicoReporte(getMedicoId(), getFechaInicio(), getFechaFin()).isEmpty()) {
                mensajeReporteVacio("El reporte no contiene páginas.");
            }else{
                this.setReportDir("/views/5_reportes/");
                this.setNombreArchivo("rep_pacientes_por_medico");
                this.addParametro("medicoId", getMedicoId());
                this.addParametro("fechaInicio", getFechaInicio());
                this.addParametro("fechaFin", getFechaFin());
                execute();
                RequestContext.getCurrentInstance().execute("window.open('../../servlets/report/PDF','_blank')");
            }
        } catch (Exception e) {
            mensajeError("Se detuvo el proceso en el método: repPacientesPorMedico.");
        }
    }
    
    //Método para generar reporte Listado Tratamientos realizados a Paciente (rep_tratamientos_por_pacientes.xhtml).
    public void repTratamientosPorPaciente() {
        try{
            if (getDetallesConsultasFacade().findTratamientosPorPacienteReporte(getPacienteId()).isEmpty()) {
                mensajeReporteVacio("El reporte no contiene páginas.");
            }else{
                this.setReportDir("/views/5_reportes/");
                this.setNombreArchivo("rep_tratamientos_por_paciente");
                this.addParametro("pacienteId", getPacienteId());
                execute();
                RequestContext.getCurrentInstance().execute("window.open('../../servlets/report/PDF','_blank')");
            }
        } catch (Exception e) {
            mensajeError("Se detuvo el proceso en el método: repTratamientosPorPaciente.");
        }
    }

    //Método para generar reporte Listado de Citas por Clínica (rep_citas_por_clinica.xhtml).
    public void repCitasPorClinica() {
        try{
            this.setEstadoCita(2);
            if(clinicaId == 0){
                if (getCitasFacade().findCitasPorTodasClinicasReporte(getEstadoCita(), getFechaInicio(), getFechaFin()).isEmpty()) {
                    mensajeReporteVacio("El reporte no contiene páginas.");
                }else{
                    this.setReportDir("/views/5_reportes/");
                    this.setNombreArchivo("rep_citas_por_clinica_todas");
                    this.addParametro("estadoCita", getEstadoCita());
                    this.addParametro("fechaInicio", getFechaInicio());
                    this.addParametro("fechaFin", getFechaFin());
                    execute();
                    RequestContext.getCurrentInstance().execute("window.open('../../servlets/report/PDF','_blank')");
                }
            }
            else{
                if (getCitasFacade().findCitasPorClinicaReporte(getClinicaId(), getEstadoCita(), getFechaInicio(), getFechaFin()).isEmpty()) {
                    mensajeReporteVacio("El reporte no contiene páginas.");
                }else{
                    this.setReportDir("/views/5_reportes/");
                    this.setNombreArchivo("rep_citas_por_clinica");
                    this.addParametro("estadoCita", getEstadoCita());
                    this.addParametro("clinicaId", getClinicaId());
                    this.addParametro("fechaInicio", getFechaInicio());
                    this.addParametro("fechaFin", getFechaFin());
                    execute();
                    RequestContext.getCurrentInstance().execute("window.open('../../servlets/report/PDF','_blank')");
                }
            }
        } catch (Exception e) {
            mensajeError("Se detuvo el proceso en el método: repCitasPorClinica.");
        }
    }

    //Método para generar reporte Listado de Citas por Médico (rep_citas_por_medico.xhtml).
    public void repCitasPorMedico() {
        try{
            this.setEstadoCita(2);
            if(medicoId == 0){
                if (getCitasFacade().findCitasPorTodosMedicosReporte(getEstadoCita(), getFechaInicio(), getFechaFin()).isEmpty()) {
                    mensajeReporteVacio("El reporte no contiene páginas.");
                }else{
                    this.setReportDir("/views/5_reportes/");
                    this.setNombreArchivo("rep_citas_por_medico_todos");
                    this.addParametro("estadoCita", getEstadoCita());
                    this.addParametro("fechaInicio", getFechaInicio());
                    this.addParametro("fechaFin", getFechaFin());
                    execute();
                    RequestContext.getCurrentInstance().execute("window.open('../../servlets/report/PDF','_blank')");
                }
            }
            else{
                if (getCitasFacade().findCitasPorMedicoReporte(getMedicoId(), getEstadoCita(), getFechaInicio(), getFechaFin()).isEmpty()) {
                    mensajeReporteVacio("El reporte no contiene páginas.");
                }else{
                    this.setReportDir("/views/5_reportes/");
                    this.setNombreArchivo("rep_citas_por_medico");
                    this.addParametro("medicoId", getMedicoId());
                    this.addParametro("estadoCita", getEstadoCita());
                    this.addParametro("fechaInicio", getFechaInicio());
                    this.addParametro("fechaFin", getFechaFin());
                    execute();
                    RequestContext.getCurrentInstance().execute("window.open('../../servlets/report/PDF','_blank')");
                }
            }
        } catch (Exception e) {
            mensajeError("Se detuvo el proceso en el método: repCitasPorMedico.");
        }
    }

    //Método para generar reporte Listado de Citas por Estado (rep_citas_por_estado.xhtml).
    public void repCitasPorEstado() {
        try{
            if(estadoCita == 1 || estadoCita == 4){
                if (getCitasFacade().findCitasPorEstadoReporte(getEstadoCita(), getFechaInicio(), getFechaFin()).isEmpty()) {
                    mensajeReporteVacio("El reporte no contiene páginas.");
                }else{
                    if(estadoCita == 1){
                        this.setCitaEstado("Reservadas");
                    } else{
                        this.setCitaEstado("Canceladas");
                    }
                    this.setReportDir("/views/5_reportes/");
                    this.setNombreArchivo("rep_citas_por_estado_sin_medico");
                    this.addParametro("estadoCita", getEstadoCita());
                    this.addParametro("citaEstado", getCitaEstado());
                    this.addParametro("fechaInicio", getFechaInicio());
                    this.addParametro("fechaFin", getFechaFin());
                    execute();
                    RequestContext.getCurrentInstance().execute("window.open('../../servlets/report/PDF','_blank')");
                }
            }
            else{
                if (getCitasFacade().findCitasPorEstadoReporte(getEstadoCita(), getFechaInicio(), getFechaFin()).isEmpty()) {
                    mensajeReporteVacio("El reporte no contiene páginas.");
                }else{
                    if(estadoCita == 2){
                        this.setCitaEstado("Confirmadas");
                    } 
                    if(estadoCita == 3){
                        this.setCitaEstado("Atendidas");
                    }
                    if(estadoCita == 5){
                        this.setCitaEstado("Expiradas");
                    }
                    this.setReportDir("/views/5_reportes/");
                    this.setNombreArchivo("rep_citas_por_estado");
                    this.addParametro("estadoCita", getEstadoCita());
                    this.addParametro("citaEstado", getCitaEstado());
                    this.addParametro("fechaInicio", getFechaInicio());
                    this.addParametro("fechaFin", getFechaFin());
                    execute();
                    RequestContext.getCurrentInstance().execute("window.open('../../servlets/report/PDF','_blank')");
                }
            }
        } catch (Exception e) {
            mensajeError("Se detuvo el proceso en el método: repCitasPorEstado.");
        }
    }

    //Método para generar reporte Listado de Pacientes por Clínica (rep_pacientes_por_clinica.xhtml).
    public void repPacientesPorClinica() {
        try{
            this.setEstadoCita(4);
            if (getCitasFacade().findPacientesPorClinicaReporte(getClinicaId(), getEstadoCita(), getFechaInicio(), getFechaFin()).isEmpty()) {
                mensajeReporteVacio("El reporte no contiene páginas.");
            }else{
                this.setReportDir("/views/5_reportes/");
                this.setNombreArchivo("rep_pacientes_por_clinica");
                this.addParametro("estadoCita", getEstadoCita());
                this.addParametro("clinicaId", getClinicaId());
                this.addParametro("fechaInicio", getFechaInicio());
                this.addParametro("fechaFin", getFechaFin());
                execute();
                RequestContext.getCurrentInstance().execute("window.open('../../servlets/report/PDF','_blank')");
            }
        } catch (Exception e) {
            mensajeError("Se detuvo el proceso en el método: repPacientesPorClinica.");
        }
    }
    
    //Método para generar reporte Listado de Pacientes por Tratamiento (rep_pacientes_por_tratamiento.xhtml).
    public void repPacientesPorTratamiento() {
        try{
            if(tratamientoId == 0){
                if (getDetallesConsultasFacade().findPacientesPorTodosTratamientoReporte(getFechaInicio(), getFechaFin()).isEmpty()) {
                    mensajeReporteVacio("El reporte no contiene páginas.");
                }else{
                    this.setReportDir("/views/5_reportes/");
                    this.setNombreArchivo("rep_pacientes_por_tratamiento_todos");
                    this.addParametro("fechaInicio", getFechaInicio());
                    this.addParametro("fechaFin", getFechaFin());
                    execute();
                    RequestContext.getCurrentInstance().execute("window.open('../../servlets/report/PDF','_blank')");
                }
            }
            else{
                if (getDetallesConsultasFacade().findPacientesPorTratamientoReporte(getTratamientoId(), getFechaInicio(), getFechaFin()).isEmpty()) {
                    mensajeReporteVacio("El reporte no contiene páginas.");
                }else{
                    this.setReportDir("/views/5_reportes/");
                    this.setNombreArchivo("rep_pacientes_por_tratamiento");
                    this.addParametro("tratamientoId", getTratamientoId());
                    this.addParametro("fechaInicio", getFechaInicio());
                    this.addParametro("fechaFin", getFechaFin());
                    execute();
                    RequestContext.getCurrentInstance().execute("window.open('../../servlets/report/PDF','_blank')");
                }
            }
        } catch (Exception e) {
            mensajeError("Se detuvo el proceso en el método: repPacientesPorTratamiento.");
        }
    }
    
    //Método para generar reporte de Receta (consultas_gestionar.xhtml).
    public void repReceta() {
        try{
            if (getConsultasFacade().find(getConsultaId()).getConsultaReceta().equals("")) {
                    mensajeReporteVacio("No se ha guardado una receta.");
            }else{
                this.setReportDir("/views/5_reportes/");
                this.addParametro("consultaId", getConsultaId());
                execute();
                RequestContext.getCurrentInstance().execute("window.open('../../servlets/report/PDF','_blank')");
            }
        } catch (Exception e) {
            mensajeError("Se detuvo el proceso en el método: repReceta.");
        }
    }

    //Método para verificar si el usuario tiene acceso a la página consultada. (Todas las páginas)
    public void verificaAcceso(int pagina){
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
                        if(submenu.getSubmenuId() == pagina){
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
        FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_WARN, "Mensaje", mensaje);
        RequestContext.getCurrentInstance().showMessageInDialog(message);
    }
    
    //Método para mostrar mensaje de error en el sistema.
    public void mensajeError(String mensaje) {
        FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_ERROR, "¡Error!", mensaje);
        RequestContext.getCurrentInstance().showMessageInDialog(message);
    }
   
}