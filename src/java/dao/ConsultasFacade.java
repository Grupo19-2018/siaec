package dao;

import entities.Consultas;
import java.util.Date;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless
public class ConsultasFacade extends AbstractFacade<Consultas> {

    @PersistenceContext(unitName = "siaecPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ConsultasFacade() {
        super(Consultas.class);
    }
    
    //Método que obtiene lista de consultas por paciente. (consultas_listado_consultar.xhtml y consultas_listado_gestionar.xhtml)
    public List<Consultas> todosPacientesPorPaciente(int pacienteId) {
        return getEntityManager().createNamedQuery("Consultas.findByConsultasPorPaciente").setParameter("pacienteId", pacienteId).getResultList();
    }
    
    //Lista de pacientes de un medico en especifico, para validacion de reporte de paciente por medico en especifico (rep_pacientes_por_medico).
    public List<Consultas> findPacientesPorMedicoReporte(int medicoId, Date fechaInicio, Date fechaFin) {
        return getEntityManager().createNamedQuery("Consultas.findPacientesPorMedicoReporte").setParameter("medicoId", medicoId).setParameter("fechaInicio", fechaInicio).setParameter("fechaFin", fechaFin).getResultList();
    }
    
    //Lista de consultas con promoción distinta de null, para validacion de reporte de promociones más demandadas (rep_promociones_demandadas.xhtml).
    public List<Consultas> findPromocionesMasDemandadasReporte(Date fechaInicio, Date fechaFin) {
        return getEntityManager().createNamedQuery("Consultas.findPromocionesMasDemandadasReporte").setParameter("fechaInicio", fechaInicio).setParameter("fechaFin", fechaFin).getResultList();
    }
    
}
