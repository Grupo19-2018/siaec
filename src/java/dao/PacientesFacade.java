/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/*
Fecha de actualizacion: 04/febrero/2019
*/
package dao;

import entities.Pacientes;
import java.util.Date;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Fam. Gomez Aldana
 */
/*
Notas de actualizacion:
*******************************************************************************
Fecha: 04/febrero/2019
Encargado: Erick.
-Agregando metodo para buscar al usuario desde la paciente. 
*/
@Stateless
public class PacientesFacade extends AbstractFacade<Pacientes> {

    @PersistenceContext(unitName = "siaecPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public PacientesFacade() {
        super(Pacientes.class);
    }
    
    //Método que obtiene lista de pacientes por expediente. (paciente_consultar.xhtml)
    public List<Pacientes> todosPacientesPorExpediente(String expediente) {
        return getEntityManager().createNamedQuery("Pacientes.findByPacientePorExpediente").setParameter("expediente", expediente).getResultList();
    }
    
    //Método que obtiene lista de pacientes por nombre. (paciente_gestionar.xhtml)
    public List<Pacientes> todosPacientesPorNombre(String nombre) {
        return getEntityManager().createNamedQuery("Pacientes.findByPacientePorNombre").setParameter("nombre", nombre).getResultList();
    }
 
    //Método que obtiene el último número de expediente de pacientes. (paciente_registrar.xhtml)
    public int ultimoNumeroExpediente() {
        try {
            return (int) getEntityManager().createNamedQuery("Pacientes.findByUltimoNumeroExpediente").getSingleResult();
        } catch (NoResultException e) { //Por si no encuentra ningun resultado que retorne cero
            return 0;
        }
    }
    
    public List<Pacientes> pacientesFechaCreacionRango(Date inicio, Date fin) {
        return getEntityManager().createNamedQuery("Pacientes.findByFechaCreacionRango").setParameter("fecha_inicio", inicio).setParameter("fecha_fin", fin).getResultList();
    }
    
    //Para correos Erick
    public List<Pacientes> pacientesNotificarCorreDesde(Integer desde){
        return  getEntityManager().createNamedQuery("Pacientes.enviarCorreoDesde").setParameter("desde", desde).getResultList();
    }
    
   
    //Lo ocupo en reportes
    public List<Pacientes> pacientesDisponibles(boolean pacienteEstado){
        return getEntityManager().createNamedQuery("Pacientes.findByPacienteEstado").setParameter("pacienteEstado", pacienteEstado).getResultList();
    }
    
    //Usado en: Dashboard.java
    public List<Pacientes> todosPacientesPorSexo(boolean sexo){
        return getEntityManager().createNamedQuery("Pacientes.findByPacienteSexo").setParameter("pacienteSexo", sexo).getResultList();
    }
    
        
     //Metodo para buscar el usuario del paciente.
    //Named query: Pacientes.usuarioUsuario
    //Estado: Prueba, usado en Dashboard_Asistente, ExpedientesBean. 
    //Fecha: 04/febrero/2019
    public List<Pacientes> pacienteUsuario(String usuario){
        return getEntityManager().createNamedQuery("Pacientes.usuarioUsuario").setParameter("usuario", usuario).getResultList();
    }

}
