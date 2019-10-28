package entities;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.Size;

@Entity
@Table(name = "dashboard")
@NamedQueries({
    @NamedQuery(name = "Dashboard.findAll", query = "SELECT d FROM Dashboard d"),
    @NamedQuery(name = "Dashboard.findByDashboardId", query = "SELECT d FROM Dashboard d WHERE d.dashboardId = :dashboardId"),
    @NamedQuery(name = "Dashboard.findByDashboardNombre", query = "SELECT d FROM Dashboard d WHERE d.dashboardNombre = :dashboardNombre"),
    @NamedQuery(name = "Dashboard.findByDashboardDescripcion", query = "SELECT d FROM Dashboard d WHERE d.dashboardDescripcion = :dashboardDescripcion"),
    @NamedQuery(name = "Dashboard.findByDashboardUrl", query = "SELECT d FROM Dashboard d WHERE d.dashboardUrl = :dashboardUrl"),
    @NamedQuery(name = "Dashboard.findByDashboardImagen", query = "SELECT d FROM Dashboard d WHERE d.dashboardImagen = :dashboardImagen"),
    @NamedQuery(name = "Dashboard.dashboardPermitidos", query = "SELECT d FROM Dashboard d WHERE d.dashboardId = 1 OR d.dashboardId = 7")})
public class Dashboard implements Serializable {

    @OneToMany(mappedBy = "dashboardId")
    private List<Roles> rolesList;

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "dashboard_id")
    private Integer dashboardId;
    @Size(max = 50)
    @Column(name = "dashboard_nombre")
    private String dashboardNombre;
    @Size(max = 100)
    @Column(name = "dashboard_descripcion")
    private String dashboardDescripcion;
    @Size(max = 100)
    @Column(name = "dashboard_url")
    private String dashboardUrl;
    @Size(max = 150)
    @Column(name = "dashboard_imagen")
    private String dashboardImagen;

    public Dashboard() {
    }

    public Dashboard(Integer dashboardId) {
        this.dashboardId = dashboardId;
    }

    public Integer getDashboardId() {
        return dashboardId;
    }

    public void setDashboardId(Integer dashboardId) {
        this.dashboardId = dashboardId;
    }

    public String getDashboardNombre() {
        return dashboardNombre;
    }

    public void setDashboardNombre(String dashboardNombre) {
        this.dashboardNombre = dashboardNombre;
    }

    public String getDashboardDescripcion() {
        return dashboardDescripcion;
    }

    public void setDashboardDescripcion(String dashboardDescripcion) {
        this.dashboardDescripcion = dashboardDescripcion;
    }

    public String getDashboardUrl() {
        return dashboardUrl;
    }

    public void setDashboardUrl(String dashboardUrl) {
        this.dashboardUrl = dashboardUrl;
    }

    public String getDashboardImagen() {
        return dashboardImagen;
    }

    public void setDashboardImagen(String dashboardImagen) {
        this.dashboardImagen = dashboardImagen;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (dashboardId != null ? dashboardId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        if (!(object instanceof Dashboard)) {
            return false;
        }
        Dashboard other = (Dashboard) object;
        if ((this.dashboardId == null && other.dashboardId != null) || (this.dashboardId != null && !this.dashboardId.equals(other.dashboardId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Dashboard[ dashboardId=" + dashboardId + " ]";
    }

    public List<Roles> getRolesList() {
        return rolesList;
    }

    public void setRolesList(List<Roles> rolesList) {
        this.rolesList = rolesList;
    }

}
