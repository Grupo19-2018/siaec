/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entities.DetallesConsultas;
import java.util.Date;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Fam. Gomez Aldana
 */
@Stateless
public class DetallesConsultasFacade extends AbstractFacade<DetallesConsultas> {

    @PersistenceContext(unitName = "siaecPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public DetallesConsultasFacade() {
        super(DetallesConsultas.class);
    }
    
    //Método que obtiene lista de detalles de consultas por paciente. (odontograma_gestionar.xhtml)
    public List<DetallesConsultas> detalleConsultaPorPaciente(int pacienteId) {
        return getEntityManager().createNamedQuery("DetallesConsultas.findByDetalleconsultaPorPaciente").setParameter("pacienteId", pacienteId).getResultList();
    }
    
    //Lista de Detalles de Consulta con tratamientos distintos de null, para validacion de reporte de tratamientos más demandados (rep_tratamientos_demandados.xhtml).
     public List<DetallesConsultas> findTratamientosMasDemandadosReporte(Date fechaInicio, Date fechaFin){
        return getEntityManager().createNamedQuery("DetallesConsultas.findTratamientosMasDemandadosReporte").setParameter("fechaInicio", fechaInicio).setParameter("fechaFin", fechaFin).getResultList();
    }
     
    //Método que obtiene lista de detalles de consultas por paciente, para validacion de reporte de tratamientos por pacientes (rep_tratamientos_por_pacientes.xhtml).
    public List<DetallesConsultas> findTratamientosPorPacienteReporte(int pacienteId) {
        return getEntityManager().createNamedQuery("DetallesConsultas.findByTratamientosPorPacienteReporte").setParameter("pacienteId", pacienteId).getResultList();
    }
    
    //Método que obtiene lista de detalles de consultas por tratamiento, para validacion de reporte de pacientes por tratamientos (rep_pacientes_por_tratamiento.xhtml).
    public List<DetallesConsultas> findPacientesPorTratamientoReporte(int tratamientoId, Date fechaInicio, Date fechaFin) {
        return getEntityManager().createNamedQuery("DetallesConsultas.findByPacientesPorTratamientoReporte").setParameter("tratamientoId", tratamientoId).setParameter("fechaInicio", fechaInicio).setParameter("fechaFin", fechaFin).getResultList();
    }
    
   //Método que obtiene lista de detalles de consultas por todos tratamiento, para validacion de reporte de pacientes por tratamientos (rep_pacientes_por_tratamiento.xhtml).
    public List<DetallesConsultas> findPacientesPorTodosTratamientoReporte(Date fechaInicio, Date fechaFin) {
        return getEntityManager().createNamedQuery("DetallesConsultas.findByPacientesPorTodosTratamientoReporte").setParameter("fechaInicio", fechaInicio).setParameter("fechaFin", fechaFin).getResultList();
    }
    
}
