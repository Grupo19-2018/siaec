/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.validation.constraints.NotNull;

/**
 *
 * @author Fam. Gomez Aldana
 */
@Embeddable
public class PrivilegiosPK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Column(name = "privilegio_id")
    private int privilegioId;
    @Basic(optional = false)
    @NotNull
    @Column(name = "submenu_id")
    private int submenuId;

    public PrivilegiosPK() {
    }

    public PrivilegiosPK(int privilegioId, int submenuId) {
        this.privilegioId = privilegioId;
        this.submenuId = submenuId;
    }

    public int getPrivilegioId() {
        return privilegioId;
    }

    public void setPrivilegioId(int privilegioId) {
        this.privilegioId = privilegioId;
    }

    public int getSubmenuId() {
        return submenuId;
    }

    public void setSubmenuId(int submenuId) {
        this.submenuId = submenuId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) privilegioId;
        hash += (int) submenuId;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof PrivilegiosPK)) {
            return false;
        }
        PrivilegiosPK other = (PrivilegiosPK) object;
        if (this.privilegioId != other.privilegioId) {
            return false;
        }
        if (this.submenuId != other.submenuId) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.PrivilegiosPK[ privilegioId=" + privilegioId + ", submenuId=" + submenuId + " ]";
    }
    
}
