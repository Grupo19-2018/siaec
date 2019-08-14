/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 *
 * @author Fam. Gomez Aldana
 */
@Entity
@Table(name = "usuarios")
@NamedQueries({
    @NamedQuery(name = "Usuarios.findAll", query = "SELECT u FROM Usuarios u"),
    @NamedQuery(name = "Usuarios.findByUsuarioUsuario", query = "SELECT u FROM Usuarios u WHERE u.usuarioUsuario = :usuarioUsuario"),
    @NamedQuery(name = "Usuarios.findByUsuarioClinicas", query = "SELECT u FROM Usuarios u WHERE u.usuarioEstado = 'TRUE' AND u.rolId.rolId != 5"),
    @NamedQuery(name = "Usuarios.findByUsuarioPacientes", query = "SELECT u FROM Usuarios u WHERE u.usuarioEstado = 'TRUE' AND u.rolId.rolId = 5"),
    @NamedQuery(name = "Usuarios.findByUsuarioActivos", query = "SELECT u FROM Usuarios u WHERE u.usuarioEstado = 'TRUE'"),
    //@NamedQuery(name = "Usuarios.findByUsuarioNombre", query = "SELECT u FROM Usuarios u WHERE u.usuarioNombre = :usuarioNombre"),
    //@NamedQuery(name = "Usuarios.findByUsuarioApellido", query = "SELECT u FROM Usuarios u WHERE u.usuarioApellido = :usuarioApellido"),
    @NamedQuery(name = "Usuarios.findByUsuarioCorreo", query = "SELECT u FROM Usuarios u WHERE u.usuarioCorreo = :usuarioCorreo"),
    @NamedQuery(name = "Usuarios.findByUsuarioTelefono", query = "SELECT u FROM Usuarios u WHERE u.usuarioTelefono = :usuarioTelefono"),
    @NamedQuery(name = "Usuarios.findByUsuarioContrasenia", query = "SELECT u FROM Usuarios u WHERE u.usuarioContrasenia = :usuarioContrasenia"),
    @NamedQuery(name = "Usuarios.findByUsuarioEstado", query = "SELECT u FROM Usuarios u WHERE u.usuarioEstado = :usuarioEstado"),
    @NamedQuery(name = "Usuarios.findByUsuarioBloqueado", query = "SELECT u FROM Usuarios u WHERE u.usuarioBloqueado = :usuarioBloqueado"),
    @NamedQuery(name = "Usuarios.findByUsuarioIntentoFallido", query = "SELECT u FROM Usuarios u WHERE u.usuarioIntentoFallido = :usuarioIntentoFallido"),
    @NamedQuery(name = "Usuarios.findByUsuarioFechaCreacion", query = "SELECT u FROM Usuarios u WHERE u.usuarioFechaCreacion = :usuarioFechaCreacion"),
    @NamedQuery(name = "Usuarios.findByUsuarioFechaModificacion", query = "SELECT u FROM Usuarios u WHERE u.usuarioFechaModificacion = :usuarioFechaModificacion"),
    @NamedQuery(name = "Usuarios.findByPacienteId", query = "SELECT u FROM Usuarios u WHERE u.pacienteId.pacienteId = :pacienteId")})
public class Usuarios implements Serializable {

    @Size(max = 50)
    @Column(name = "usuario_nombre")
    private String usuarioNombre;
    @Size(max = 50)
    @Column(name = "usuario_apellido")
    private String usuarioApellido;
    @Column(name = "usuario_activacion")
    private Boolean usuarioActivacion;
    @Column(name = "usuario_codigo")
    private Integer usuarioCodigo;

    @Size(max = 25)
    @Column(name = "usuario_primer_nombre")
    private String usuarioPrimerNombre;
    @Size(max = 25)
    @Column(name = "usuario_segundo_nombre")
    private String usuarioSegundoNombre;
    @Size(max = 25)
    @Column(name = "usuario_primer_apellido")
    private String usuarioPrimerApellido;
    @Size(max = 25)
    @Column(name = "usuario_segundo_apellido")
    private String usuarioSegundoApellido;

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "usuario_usuario")
    private String usuarioUsuario;
    /*@Size(max = 50)
    @Column(name = "usuario_nombre")
    private String usuarioNombre;
    @Size(max = 50)
    @Column(name = "usuario_apellido")
    private String usuarioApellido;*/
    @Size(max = 50)
    @Column(name = "usuario_correo")
    private String usuarioCorreo;
    @Size(max = 10)
    @Column(name = "usuario_telefono")
    private String usuarioTelefono;
    @Size(max = 50)
    @Column(name = "usuario_contrasenia")
    private String usuarioContrasenia;
    @Column(name = "usuario_estado")
    private Boolean usuarioEstado;
    @Column(name = "usuario_bloqueado")
    private Boolean usuarioBloqueado;
    @Column(name = "usuario_intento_fallido")
    private Integer usuarioIntentoFallido;
    @Column(name = "usuario_fecha_creacion")
    @Temporal(TemporalType.DATE)
    private Date usuarioFechaCreacion;
    @Column(name = "usuario_fecha_modificacion")
    @Temporal(TemporalType.DATE)
    private Date usuarioFechaModificacion;
    @OneToMany(mappedBy = "usuarioUsuario")
    private List<Citas> citasList;
    @JoinColumn(name = "rol_id", referencedColumnName = "rol_id")
    @ManyToOne(optional = false)
    private Roles rolId;
    @JoinColumn(name = "medico_id", referencedColumnName = "medico_id")
    @ManyToOne(optional = true)
    private Medicos medicoId;
    @JoinColumn(name = "paciente_id", referencedColumnName = "paciente_id")
    @ManyToOne(optional = true)
    private Pacientes pacienteId;

    public Usuarios() {
    }

    public Usuarios(String usuarioUsuario) {
        this.usuarioUsuario = usuarioUsuario;
    }

    public String getUsuarioUsuario() {
        return usuarioUsuario;
    }

    public void setUsuarioUsuario(String usuarioUsuario) {
        this.usuarioUsuario = usuarioUsuario;
    }

    /*
    public String getUsuarioNombre() {
        return usuarioNombre;
    }

    public void setUsuarioNombre(String usuarioNombre) {
        this.usuarioNombre = usuarioNombre;
    }

    public String getUsuarioApellido() {
        return usuarioApellido;
    }

    public void setUsuarioApellido(String usuarioApellido) {
        this.usuarioApellido = usuarioApellido;
    }*/

    public String getUsuarioCorreo() {
        return usuarioCorreo;
    }

    public void setUsuarioCorreo(String usuarioCorreo) {
        this.usuarioCorreo = usuarioCorreo;
    }

    public String getUsuarioTelefono() {
        return usuarioTelefono;
    }

    public void setUsuarioTelefono(String usuarioTelefono) {
        this.usuarioTelefono = usuarioTelefono;
    }

    public String getUsuarioContrasenia() {
        return usuarioContrasenia;
    }

    public void setUsuarioContrasenia(String usuarioContrasenia) {
        this.usuarioContrasenia = usuarioContrasenia;
    }

    public Boolean getUsuarioEstado() {
        return usuarioEstado;
    }

    public void setUsuarioEstado(Boolean usuarioEstado) {
        this.usuarioEstado = usuarioEstado;
    }

    public Boolean getUsuarioBloqueado() {
        return usuarioBloqueado;
    }

    public void setUsuarioBloqueado(Boolean usuarioBloqueado) {
        this.usuarioBloqueado = usuarioBloqueado;
    }

    public Integer getUsuarioIntentoFallido() {
        return usuarioIntentoFallido;
    }

    public void setUsuarioIntentoFallido(Integer usuarioIntentoFallido) {
        this.usuarioIntentoFallido = usuarioIntentoFallido;
    }

    public Date getUsuarioFechaCreacion() {
        return usuarioFechaCreacion;
    }

    public void setUsuarioFechaCreacion(Date usuarioFechaCreacion) {
        this.usuarioFechaCreacion = usuarioFechaCreacion;
    }

    public Date getUsuarioFechaModificacion() {
        return usuarioFechaModificacion;
    }

    public void setUsuarioFechaModificacion(Date usuarioFechaModificacion) {
        this.usuarioFechaModificacion = usuarioFechaModificacion;
    }

    public List<Citas> getCitasList() {
        return citasList;
    }

    public void setCitasList(List<Citas> citasList) {
        this.citasList = citasList;
    }

    public Roles getRolId() {
        return rolId;
    }

    public void setRolId(Roles rolId) {
        this.rolId = rolId;
    }

    public Medicos getMedicoId() {
        return medicoId;
    }

    public void setMedicoId(Medicos medicoId) {
        this.medicoId = medicoId;
    }

    public Pacientes getPacienteId() {
        return pacienteId;
    }

    public void setPacienteId(Pacientes pacienteId) {
        this.pacienteId = pacienteId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (usuarioUsuario != null ? usuarioUsuario.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Usuarios)) {
            return false;
        }
        Usuarios other = (Usuarios) object;
        if ((this.usuarioUsuario == null && other.usuarioUsuario != null) || (this.usuarioUsuario != null && !this.usuarioUsuario.equals(other.usuarioUsuario))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Usuarios[ usuarioUsuario=" + usuarioUsuario + " ]";
    }

    public String getUsuarioPrimerNombre() {
        return usuarioPrimerNombre;
    }

    public void setUsuarioPrimerNombre(String usuarioPrimerNombre) {
        this.usuarioPrimerNombre = usuarioPrimerNombre;
    }

    public String getUsuarioSegundoNombre() {
        return usuarioSegundoNombre;
    }

    public void setUsuarioSegundoNombre(String usuarioSegundoNombre) {
        this.usuarioSegundoNombre = usuarioSegundoNombre;
    }

    public String getUsuarioPrimerApellido() {
        return usuarioPrimerApellido;
    }

    public void setUsuarioPrimerApellido(String usuarioPrimerApellido) {
        this.usuarioPrimerApellido = usuarioPrimerApellido;
    }

    public String getUsuarioSegundoApellido() {
        return usuarioSegundoApellido;
    }

    public void setUsuarioSegundoApellido(String usuarioSegundoApellido) {
        this.usuarioSegundoApellido = usuarioSegundoApellido;
    }

    public String creacionUsuario() {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        String fecha = formatter.format(usuarioFechaCreacion);
        return fecha;
    }

    public String getUsuarioNombre() {
        return usuarioNombre;
    }

    public void setUsuarioNombre(String usuarioNombre) {
        this.usuarioNombre = usuarioNombre;
    }

    public String getUsuarioApellido() {
        return usuarioApellido;
    }

    public void setUsuarioApellido(String usuarioApellido) {
        this.usuarioApellido = usuarioApellido;
    }

    public Boolean getUsuarioActivacion() {
        return usuarioActivacion;
    }

    public void setUsuarioActivacion(Boolean usuarioActivacion) {
        this.usuarioActivacion = usuarioActivacion;
    }

    public Integer getUsuarioCodigo() {
        return usuarioCodigo;
    }

    public void setUsuarioCodigo(Integer usuarioCodigo) {
        this.usuarioCodigo = usuarioCodigo;
    }

    public String nombreApellido() {
        return usuarioNombre.toUpperCase() + " " + usuarioPrimerApellido.toUpperCase();
    }

}
