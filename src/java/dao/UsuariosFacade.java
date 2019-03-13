/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entities.Usuarios;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Fam. Gomez Aldana
 */
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
    //Esperaria almenos 1 si hay mas, es otro degenere
    public List<Usuarios> usuariosSimiliares(String us){
     return getEntityManager().createNamedQuery("Usuarios.findByUsuarioUsuario").setParameter("usuarioUsuario", us).getResultList();
    }
    
}
