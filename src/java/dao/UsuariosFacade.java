package dao;

import entities.Usuarios;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;

@Stateless
public class UsuariosFacade extends AbstractFacade<Usuarios> {

    @PersistenceContext(unitName = "siaecPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public UsuariosFacade() {
        super(Usuarios.class);
    }
    
    //Método que retorna el Usuario logueado. (login.xhtml)
    public Usuarios traeUsuarioLogueado(String usuario) {
        try {
            return (Usuarios) getEntityManager().createNamedQuery("Usuarios.findByUsuarioUsuario").setParameter("usuarioUsuario", usuario).getSingleResult();
        } catch (NoResultException e) { //Por si no encuentra ningun resultado que retorne nulo
            return null;
        }
    }
    
    //Lista de usuarios, para validar si existe el usuario 
    //Usasdo en: metodo guardarPaciente() en expedienteBean
    public List<Usuarios> usuariosSimiliares(String us){
     return getEntityManager().createNamedQuery("Usuarios.findByUsuarioUsuario").setParameter("usuarioUsuario", us).getResultList();
    }
    
    public List<Usuarios> todosUsuariosClinicas(){
     return getEntityManager().createNamedQuery("Usuarios.findByUsuarioClinicas").getResultList();
    }
    
    public List<Usuarios> todosUsuariosPacientes(){
     return getEntityManager().createNamedQuery("Usuarios.findByUsuarioPacientes").getResultList();
    }
    
    public List<Usuarios> todosUsuariosActivos(){
     return getEntityManager().createNamedQuery("Usuarios.findByUsuarioActivos").getResultList();
    }
    
    public List<Usuarios> usuarioPorPaciente(Integer pacienteId){
        return getEntityManager().createNamedQuery("Usuarios.findByPacienteId").setParameter("pacienteId", pacienteId).getResultList();
    }
    
}
