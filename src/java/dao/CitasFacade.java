/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entities.Citas;
import java.util.Date;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Fam. Gomez Aldana
 */
/*
Notas de actualizacion:
*******************************************************************************
Fecha: 03/febrero/2019
-

*******************************************************************************
Fecha: 02/febrero/2019
-Se agrego los metodos citasAprobadas(?) y citasAprobadas(). 

*******************************************************************************
Fecha: 31/enero/2019
-Se agrego metodo public List<Citas> citaActiva(?), lista citas pendientes o confirmadas. 
*/
@Stateless
public class CitasFacade extends AbstractFacade<Citas> {

    @PersistenceContext(unitName = "siaecPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public CitasFacade() {
        super(Citas.class);
    }
    
    //Método que obtiene lista de citas por clínica, para validacion de reporte de citas por clínica (rep_citas_por_clinica.xhtml)
    public List<Citas> findCitasPorClinicaReporte(int clinicaId, int estado, Date fechaInicio, Date fechaFin) {
        return getEntityManager().createNamedQuery("Citas.findByCitasPorClinicaReporte").setParameter("clinicaId", clinicaId).setParameter("estado", estado).setParameter("fechaInicio", fechaInicio).setParameter("fechaFin", fechaFin).getResultList();
    }
    
    //Método que obtiene lista de citas por todas las clínicas, para validacion de reporte de citas por clínica (rep_citas_por_clinica.xhtml)
    public List<Citas> findCitasPorTodasClinicasReporte(int estado, Date fechaInicio, Date fechaFin) {
        return getEntityManager().createNamedQuery("Citas.findByCitasPorTodasClinicasReporte").setParameter("estado", estado).setParameter("fechaInicio", fechaInicio).setParameter("fechaFin", fechaFin).getResultList();
    }
    
    //Método que obtiene lista de citas por médico, para validacion de reporte de citas por médico (rep_citas_por_medico.xhtml)
    public List<Citas> findCitasPorMedicoReporte(int medicoId, int estado, Date fechaInicio, Date fechaFin) {
        return getEntityManager().createNamedQuery("Citas.findByCitasPorMedicoReporte").setParameter("medicoId", medicoId).setParameter("estado", estado).setParameter("fechaInicio", fechaInicio).setParameter("fechaFin", fechaFin).getResultList();
    }
    
    //Método que obtiene lista de citas por todos los médicos, para validacion de reporte de citas por médico (rep_citas_por_medico.xhtml)
    public List<Citas> findCitasPorTodosMedicosReporte(int estado, Date fechaInicio, Date fechaFin) {
        return getEntityManager().createNamedQuery("Citas.findByCitasPorTodosMedicosReporte").setParameter("estado", estado).setParameter("fechaInicio", fechaInicio).setParameter("fechaFin", fechaFin).getResultList();
    }
    
    //Método que obtiene lista de citas por estado, para validacion de reporte de citas por estado (rep_citas_por_estado.xhtml)
    public List<Citas> findCitasPorEstadoReporte(int citaEstado, Date fechaInicio, Date fechaFin) {
        return getEntityManager().createNamedQuery("Citas.findByCitasPorEstadoReporte").setParameter("citaEstado", citaEstado).setParameter("fechaInicio", fechaInicio).setParameter("fechaFin", fechaFin).getResultList();
    }
    
    //Método que obtiene lista de citas atendidas, para validacion de reporte de pacientes por clínica (rep_pacientes_por_clinica.xhtml)
    public List<Citas> findPacientesPorClinicaReporte(int clinicaId, int citaEstado, Date fechaInicio, Date fechaFin) {
        return getEntityManager().createNamedQuery("Citas.findByPacientesPorClinicaReporte").setParameter("clinicaId", clinicaId).setParameter("citaEstado", citaEstado).setParameter("fechaInicio", fechaInicio).setParameter("fechaFin", fechaFin).getResultList();
    }
    
    public List<Citas> citasAtendidasEstado(Integer estadoId) {         //http://alejandroayala.solmedia.ec/?p=947
        List <Citas> results = getEntityManager().createNamedQuery("Citas.findByCitasTotalEstado").setParameter("idEstado", estadoId).getResultList();
        return results;
    }
    
    public List<Citas> citasRangoFecha(Date inicio, Date fin){
        List <Citas> results = getEntityManager().createNamedQuery("Citas.findByCitasMesEstado").setParameter("fecha_inferior", inicio).setParameter("fecha_superior", fin).getResultList();
        return results;
    }
    
    //Usado en DashbiardViere.xhtml
    //Objetivo presentar las estadisticas
    public List<Citas> citasAtendidasPorSucursal(Integer sucursalId, Integer estadoId) {
        //http://alejandroayala.solmedia.ec/?p=947
        List <Citas> results = getEntityManager().createNamedQuery("Citas.findByCitaAtendidaPorSucursal").setParameter("idClinica", sucursalId).setParameter("idEstado", estadoId).getResultList();
        return results;
    }
    
    //Metodo que obtiene las citas reservadas en la clinica.
    //Fecha: 12/febrero/2019
    public List<Citas> citasReservadoSucursal(Date fecha_cita, int clinica_id, Date citaHora) {
        return getEntityManager().createNamedQuery("Citas.reservadasClinica").setParameter("fecha_cita", fecha_cita).setParameter("clinica_id", clinica_id).setParameter("citaHora", citaHora).getResultList();
    }
    //Estado: Cambio
    //Fecha: 13/febrero/2019
    public List<Citas> citasReservadoSucursal(Date fecha_cita, int clinica_id, Date citaHora, Integer medicoId) {
        return getEntityManager().createNamedQuery("Citas.reservadasClinicaMedico").setParameter("fecha_cita", fecha_cita).setParameter("clinica_id", clinica_id).setParameter("citaHora", citaHora).setParameter("medicoId", medicoId).getResultList();
    }
    
    //Metodo para solo nombrar las citas de los medicos independientemente de la sucursal
    //Estado: Prueba
    //Fecha: 13/febrero/2019
    public List<Citas> citasReservadoSucursal(Date fecha_cita,Date citaHora, Integer medicoId){
     return getEntityManager().createNamedQuery("Citas.reservadasClinicasMedico").setParameter("fecha_cita", fecha_cita).setParameter("citaHora", citaHora).setParameter("medicoId", medicoId).getResultList();
    }
    
    
    public List<Citas> citasProximas(Date fecha){
        return getEntityManager().createNamedQuery("Citas.programasFechaActual").setParameter("fecha_cita", fecha).getResultList();
    }
    
    //Método que obtiene lista de citas reservadas. (cita_listado_reservado.xhtml)
    public List<Citas> citasReservadas(){
        return getEntityManager().createNamedQuery("Citas.findByCitasReservadas").getResultList();
    }
    
    public List<Citas> findCitasPorSucursalReport(Date fechainicio, Date fechafin, Integer clinicaId, Integer estadoId) {
        List <Citas> results = getEntityManager().createNamedQuery("Citas.findCitaPorSucursalReport").setParameter("fechainicio", fechainicio).setParameter("fechafin", fechafin).setParameter("clinicaId", clinicaId).setParameter("estadoId", estadoId).getResultList();
        return results;
    }
    
    //Named Query: Citas.citaDelDia entidad: Cita
    //Usado en clase: Dashboard_Paciente.java
    //Objetivo: Listar la cita del paciente, por defecto una por dia, id Reservada: 4. 
    //Estado: Posible descartada. 
    public List<Citas> citaDelDia(String usuario){
        return getEntityManager().createNamedQuery("Citas.citaDelDia").setParameter("usuario", usuario).setParameter("dia", new Date()).getResultList();
    }
    
    //Named Query: Citas.citaDelDiaMedico Entidad: Cita
    //Usado en: Dashboard_Medico.java
    //Objetivo: Listar las citas del Medico en el dia, con estado En Consultorio ID 4;
    public List<Citas> citasDelDiaMedico(Integer medicoId){
        return getEntityManager().createNamedQuery("Citas.citaDelDiaMedico").setParameter("medicoId", medicoId).setParameter("dia", new Date()).getResultList();
    }
    
    //Named Query: Citas.citaDelDiaConfirmadas
    //Usado en: Dashboard_Asistente.java
    //Objetivo: Listar todas las citas confirmadas que se esperan recibir en el dia. 
    public List<Citas> citasDelDiaConfirmadas(){
        return getEntityManager().createNamedQuery("Citas.citaDelDiaConfirmadas").setParameter("dia", new Date()).getResultList();
    }
    
    //Named Query: Citas.citaDelDiaConfirmadasSucursal
    //Usado en: Dashboard_Asistente.java
    //Objetivo: Listar todas las citas confirmadas que se esperan recibir en el dia por sucursal. 
    public List<Citas> citasDelDiaConfirmadasSucursal(Integer clinicaId){
    return getEntityManager().createNamedQuery("Citas.citaDelDiaConfirmadasSucursal").setParameter("dia", new Date()).setParameter("clinicaId", clinicaId).getResultList();
    }
    
    //Named Query: Citas.citaDelDiaConfirmadasSucursal Fecha: 31/enero/2019
    //Usado en: Dashboard_Asistente.java
    //Objetivo: Listar todas las citas confirmadas que se esperan recibir en el dia por sucursal. 
    //Estado: En uso.
    public List<Citas> citaActiva(String usuario) {
        return getEntityManager().createNamedQuery("Citas.citaUsuarioActiva").setParameter("usuario", usuario).setParameter("fecha", new Date()).getResultList();
    }
    
    public List<Citas> citaActiva(Integer pacienteId) {
        return getEntityManager().createNamedQuery("Citas.citaExpedienteActiva").setParameter("pacienteId", pacienteId).setParameter("fecha", new Date()).getResultList();
    }
    
    //Named Query: 
    //Usado en: CitasBean.java
    //Objetivo: Listar las citas aprobadas de una sucursal.
    //Estado: En uso.
    public List<Citas> citasConfirmadas(Integer clinicaSeleccionada) {
        return getEntityManager().createNamedQuery("Citas.confirmadasPorClinica").setParameter("fecha", new Date()).setParameter("clinica", clinicaSeleccionada).getResultList();
    }
    
    //Named Query: 
    //Usado en: CitasBean.java
    //Objetivo: Listar las citas aprobadas de una sucursal del dia.
    //Estado: En uso.
    public List<Citas> citasConfirmadasHoy(Integer clinicaSeleccionada){
        return getEntityManager().createNamedQuery("Citas.confirmadasPorClinicaHoy").setParameter("fecha", new Date()).setParameter("clinica", clinicaSeleccionada).getResultList();
    }
        
    //Named Query:
    //Usado en: CitasBean.java
    //Objetivo: Listar todas las citas aprobadas. 
    //Estado: En uso. 
    public List<Citas> citasConfirmadas() {
        return getEntityManager().createNamedQuery("Citas.confirmadas").setParameter("fecha", new Date()).getResultList();
    }
    
    //Named Query:
    //Usado en: CitasBean.java
    //Objetivo: Listar todas las citas aprobadas del dia. 
    //Estado: En uso. 
    public List<Citas> citasConfirmadasHoy() {
        return getEntityManager().createNamedQuery("Citas.confirmadasHoy").setParameter("fecha", new Date()).getResultList();
    }
    
    //Namad Query: reservadasPendientes y reservadasPendientesPorClinica
    //Usado en : CitasBean.java
    //Objetivo: Listar todas las citas pendiente(reservadas)
    //Estado: En uso.
    public List<Citas> citasPendientes() {
        return getEntityManager().createNamedQuery("Citas.reservadasPendientes").setParameter("fecha", new Date()).getResultList();
    }

    //Namad Query: reservadasPendientes y reservadasPendientesPorClinica
    //Usado en : CitasBean.java
    //Objetivo: Listar todas las citas pendiente(reservadas)
    //Estado: En uso.
    public List<Citas> citasPendientes(Integer clinica) {
        return getEntityManager().createNamedQuery("Citas.reservadasPendientesPorClinica").setParameter("fecha", new Date()).setParameter("clinica", clinica).getResultList();
    }
    
    //Usado en : CitasBean.java
    //Objetivo: Extraer todas las citas del paciente, independientemente su estado. 
    //Estado: En uso 
    public List<Citas> citasUsuarioTodas(String usuario) {
        return getEntityManager().createNamedQuery("Citas.todasPorUsuario").setParameter("usuario", usuario).getResultList();
    }
    
    public List<Citas> citasUsuarioTodas(String usuario, Integer pacienteId) {
        return getEntityManager().createNamedQuery("Citas.todasPorUsuarioExpediente").setParameter("usuario", usuario).setParameter("pacienteId", pacienteId).getResultList();
    }
    
    //Named:
    //Usado en : CitasBean.java
    //Objetivo: listar todas las citas por sucursal
    //Estado: En uso
    //Fecha: 11/febrero/2019
    public List<Citas> historicoPorClinica(Integer clinica) {
        return getEntityManager().createNamedQuery("Citas.historicoPorClinica").setParameter("clinica", clinica).getResultList();
    }
    
    //Objetivo: Agenda para medico
    //Usado en:Dashboard_Medico.java
    public List<Citas> agendaMedico(Integer medicoId){
        return getEntityManager().createNamedQuery("Citas.agendaMedico").setParameter("medicoId", medicoId).setParameter("dia", new Date()).getResultList();
    }
}
