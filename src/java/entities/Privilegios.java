/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.Size;

/**
 *
 * @author Fam. Gomez Aldana
 */
@Entity
@Table(name = "privilegios")
@NamedQueries({
    @NamedQuery(name = "Privilegios.findAll", query = "SELECT p FROM Privilegios p"),
    @NamedQuery(name = "Privilegios.findByPrivilegioId", query = "SELECT p FROM Privilegios p WHERE p.privilegiosPK.privilegioId = :privilegioId"),
    @NamedQuery(name = "Privilegios.findBySubmenuId", query = "SELECT p FROM Privilegios p WHERE p.privilegiosPK.submenuId = :submenuId"),
    @NamedQuery(name = "Privilegios.findByPrivilegioAccion", query = "SELECT p FROM Privilegios p WHERE p.privilegioAccion = :privilegioAccion")})
public class Privilegios implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected PrivilegiosPK privilegiosPK;
    @Size(max = 50)
    @Column(name = "privilegio_accion")
    private String privilegioAccion;
    @ManyToMany(mappedBy = "privilegiosList")
    private List<Roles> rolesList;
    @JoinColumn(name = "submenu_id", referencedColumnName = "submenu_id", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Submenus submenus;

    public Privilegios() {
    }

    public Privilegios(PrivilegiosPK privilegiosPK) {
        this.privilegiosPK = privilegiosPK;
    }

    public Privilegios(int privilegioId, int submenuId) {
        this.privilegiosPK = new PrivilegiosPK(privilegioId, submenuId);
    }

    public PrivilegiosPK getPrivilegiosPK() {
        return privilegiosPK;
    }

    public void setPrivilegiosPK(PrivilegiosPK privilegiosPK) {
        this.privilegiosPK = privilegiosPK;
    }

    public String getPrivilegioAccion() {
        return privilegioAccion;
    }

    public void setPrivilegioAccion(String privilegioAccion) {
        this.privilegioAccion = privilegioAccion;
    }

    public List<Roles> getRolesList() {
        return rolesList;
    }

    public void setRolesList(List<Roles> rolesList) {
        this.rolesList = rolesList;
    }

    public Submenus getSubmenus() {
        return submenus;
    }

    public void setSubmenus(Submenus submenus) {
        this.submenus = submenus;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (privilegiosPK != null ? privilegiosPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Privilegios)) {
            return false;
        }
        Privilegios other = (Privilegios) object;
        if ((this.privilegiosPK == null && other.privilegiosPK != null) || (this.privilegiosPK != null && !this.privilegiosPK.equals(other.privilegiosPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Privilegios[ privilegiosPK=" + privilegiosPK + " ]";
    }
    
}
