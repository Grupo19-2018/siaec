package entities;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Size;

/**
 *
 * @author Fam. Gomez Aldana
 */
@Entity
@Table(name = "citas")
@NamedQueries({
    @NamedQuery(name = "Citas.findAll", query = "SELECT c FROM Citas c"),
    @NamedQuery(name = "Citas.findByCitaId", query = "SELECT c FROM Citas c WHERE c.citaId = :citaId"),
    @NamedQuery(name = "Citas.findByCitaFecha", query = "SELECT c FROM Citas c WHERE c.citaFecha = :citaFecha"),
    @NamedQuery(name = "Citas.findByCitaHora", query = "SELECT c FROM Citas c WHERE c.citaHora = :citaHora"),
    @NamedQuery(name = "Citas.findByCitaNombres", query = "SELECT c FROM Citas c WHERE c.citaNombres = :citaNombres"),
    @NamedQuery(name = "Citas.findByCitaApellidos", query = "SELECT c FROM Citas c WHERE c.citaApellidos = :citaApellidos"),
    @NamedQuery(name = "Citas.findByCitaTelefono", query = "SELECT c FROM Citas c WHERE c.citaTelefono = :citaTelefono"),
    @NamedQuery(name = "Citas.findByCitaCorreo", query = "SELECT c FROM Citas c WHERE c.citaCorreo = :citaCorreo"),
    @NamedQuery(name = "Citas.findByCitaMotivo", query = "SELECT c FROM Citas c WHERE c.citaMotivo = :citaMotivo"),
    @NamedQuery(name = "Citas.findByCitaFechaCreacion", query = "SELECT c FROM Citas c WHERE c.citaFechaCreacion = :citaFechaCreacion"),
    @NamedQuery(name = "Citas.findByCitaHoraCreacion", query = "SELECT c FROM Citas c WHERE c.citaHoraCreacion = :citaHoraCreacion"),
    @NamedQuery(name = "Citas.findByCitaEstado", query = "SELECT c FROM Citas c WHERE c.citaEstado = :citaEstado"),
    @NamedQuery(name = "Citas.findByCitaUsuarioCreacion", query = "SELECT c FROM Citas c WHERE c.citaUsuarioCreacion = :citaUsuarioCreacion"),
    @NamedQuery(name = "Citas.findByCitaFechaModificacion", query = "SELECT c FROM Citas c WHERE c.citaFechaModificacion = :citaFechaModificacion"),
    @NamedQuery(name = "Citas.findByCitaUsuarioModificacion", query = "SELECT c FROM Citas c WHERE c.citaUsuarioModificacion = :citaUsuarioModificacion"),

    @NamedQuery(name = "Citas.findByCitasTotalEstado", query = "SELECT c FROM Citas c WHERE c.citaEstado = :idEstado"),
    @NamedQuery(name = "Citas.findByCitasMesEstado", query = "SELECT c FROM Citas c WHERE c.citaFecha > :fecha_inferior AND c.citaFecha < :fecha_superior "),
    @NamedQuery(name = "Citas.findByCitaAtendidaPorSucursal", query = "SELECT c FROM Citas c WHERE c.clinicaId.clinicaId = :idClinica AND c.citaEstado = :idEstado"),
    @NamedQuery(name = "Citas.programasFechaActual", query = "SELECT c FROM Citas c WHERE c.citaFecha >= :fecha_cita AND ( c.citaEstado = 1 OR c.citaEstado = 2) ORDER BY c.citaFecha ASC"),

    //JPQL para conocer las citas reservadas por clinica o clinica-medico
    //Actualizado: 12/febrero/2019
    @NamedQuery(name = "Citas.reservadasClinica", query = "SELECT c FROM Citas c WHERE c.clinicaId.clinicaId = :clinica_id AND c.citaFecha = :fecha_cita AND c.citaHora = :citaHora  AND ( c.citaEstado = 1 OR c.citaEstado = 2)"),
    //Estado: Cambiando
    @NamedQuery(name = "Citas.reservadasClinicaMedico", query = "SELECT c FROM Citas c WHERE c.clinicaId.clinicaId = :clinica_id AND c.citaFecha = :fecha_cita AND c.citaHora = :citaHora  AND ( c.citaEstado = 1 OR c.citaEstado = 2) AND c.medicoId.medicoId = :medicoId"),
    //Estado: Probando
    //Fecha: 13/febrero/2019
    @NamedQuery(name = "Citas.reservadasClinicasMedico", query = "SELECT c FROM Citas c WHERE c.citaFecha = :fecha_cita AND c.citaHora = :citaHora  AND ( c.citaEstado = 1 OR c.citaEstado = 2) AND c.medicoId.medicoId = :medicoId"),

    @NamedQuery(name = "Citas.findByCitasReservadas", query = "SELECT c FROM Citas c WHERE c.citaEstado = 1"),
    @NamedQuery(name = "Citas.findCitaPorSucursalReport", query = "SELECT c FROM Citas c WHERE c.citaFechaCreacion between :fechainicio and :fechafin and c.clinicaId.clinicaId = :clinicaId AND c.citaEstado = :estadoId"),

    @NamedQuery(name = "Citas.citaDelDia", query = "SELECT c FROM Citas c WHERE c.usuarioUsuario.usuarioUsuario = :usuario AND c.citaFecha = :dia"),
    //Estado: Usado
    //Actualizado: 18/febrero/2019
    //Agregando los estados 1 y 2
    @NamedQuery(name = "Citas.citaDelDiaMedico", query = "SELECT c FROM Citas c WHERE c.medicoId.medicoId = :medicoId AND c.citaFecha = :dia AND ( c.citaEstado = 1 OR c.citaEstado = 2)" ),
    @NamedQuery(name = "Citas.agendaMedico", query = "SELECT c FROM Citas c WHERE c.medicoId.medicoId = :medicoId AND c.citaFecha >= :dia AND ( c.citaEstado = 1 OR c.citaEstado = 2)" ),

    //JPQL para buscar las citas del dia confirmadas.
    @NamedQuery(name = "Citas.citaDelDiaConfirmadas", query = "SELECT c FROM Citas c WHERE c.citaFecha = :dia AND c.citaEstado = 2"),
    //JPQL para buscar las citas del dia confirmadas por sucursal.
    @NamedQuery(name = "Citas.citaDelDiaConfirmadasSucursal", query = "SELECT c FROM Citas c WHERE c.citaFecha = :dia AND c.citaEstado = 2 AND c.clinicaId.clinicaId = :clinicaId"),
    //JPQL para determinar las citas activas de los Paciente, Estados 1 y 2.
    // Se debe de considerar un metodo para pasar una cita como expirada si el paciente, ni la clinica le cambia el estado a una cita activa. 
    //El paciente solo puede tener una cita activa. 
    //El paciente puede buscarce por el usuario o por su expediente 
    @NamedQuery(name = "Citas.citaActiva", query = "SELECT c FROM Citas c WHERE (c.citaEstado = 1 OR c.citaEstado = 2) AND c.usuarioUsuario.usuarioUsuario = :usuario AND c.citaFecha >= :fecha"),
    //Named queries para comprbar las citas reservadas aprobadas
    @NamedQuery(name = "Citas.reservadasAprobadasPorClinica", query = "SELECT c FROM Citas c WHERE c.citaEstado =  2 AND c.citaFecha >= :fecha AND C.clinicaId.clinicaId = :clinica ORDER BY c.citaFecha DESC"),
    @NamedQuery(name = "Citas.reservadasAprobadas", query = "SELECT c FROM Citas c WHERE c.citaEstado =  2 AND c.citaFecha >= :fecha ORDER BY c.citaFecha DESC"),
    
    //Named queries para conocer las citas pendientes (reservadas). 
    @NamedQuery(name = "Citas.reservadasPendientes", query = "SELECT c FROM Citas c WHERE c.citaEstado =  1 AND c.citaFecha >= :fecha ORDER BY c.citaFecha DESC" ),
    @NamedQuery(name = "Citas.reservadasPendientesPorClinica", query = "SELECT c FROM Citas c WHERE c.citaEstado =  1 AND c.clinicaId.clinicaId = :clinica AND c.citaFecha >= :fecha ORDER BY c.citaFecha DESC" ),
    
    //Namded query para conocer todas las citas del paciente por medio del usuario o correo
    //Fecha: 11/febrer/2019
    @NamedQuery(name = "Citas.todasPorUsuarioOCorreo", query = "SELECT c FROM Citas c WHERE c.usuarioUsuario.usuarioUsuario = :usuario OR c.citaCorreo = :correo ORDER BY c.citaFecha DESC"),
    
    //Named query para listar todas las citas por sucursal
    //Fecha:11/febrero/2019
    @NamedQuery(name = "Citas.historicoPorClinica", query = "SELECT c FROM Citas c WHERE c.clinicaId.clinicaId = :clinica ORDER BY c.citaFecha DESC" ),
    
    })
public class Citas implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "cita_id")
    private Integer citaId;
    @Column(name = "cita_fecha")
    @Temporal(TemporalType.DATE)
    private Date citaFecha;
    @Column(name = "cita_hora")
    @Temporal(TemporalType.TIME)
    private Date citaHora;
    @Size(max = 50)
    @Column(name = "cita_nombres")
    private String citaNombres;
    @Size(max = 50)
    @Column(name = "cita_apellidos")
    private String citaApellidos;
    @Size(max = 10)
    @Column(name = "cita_telefono")
    private String citaTelefono;
    @Size(max = 50)
    @Column(name = "cita_correo")
    private String citaCorreo;
    @Size(max = 250)
    @Column(name = "cita_motivo")
    private String citaMotivo;
    @Column(name = "cita_fecha_creacion")
    @Temporal(TemporalType.DATE)
    private Date citaFechaCreacion;
    @Column(name = "cita_hora_creacion")
    @Temporal(TemporalType.TIME)
    private Date citaHoraCreacion;
    @Column(name = "cita_estado")
    private Integer citaEstado;
    @Size(max = 50)
    @Column(name = "cita_usuario_creacion")
    private String citaUsuarioCreacion;
    @Column(name = "cita_fecha_modificacion")
    @Temporal(TemporalType.DATE)
    private Date citaFechaModificacion;
    @Size(max = 50)
    @Column(name = "cita_usuario_modificacion")
    private String citaUsuarioModificacion;
    @JoinColumn(name = "usuario_usuario", referencedColumnName = "usuario_usuario")
    @ManyToOne
    private Usuarios usuarioUsuario;
    @JoinColumn(name = "medico_id", referencedColumnName = "medico_id")
    @ManyToOne
    private Medicos medicoId;
    @JoinColumn(name = "clinica_id", referencedColumnName = "clinica_id")
    @ManyToOne(optional = false)
    private Clinicas clinicaId;
    
    //Agregado de forma manual 
    @Column(name = "cita_ensala")
    private Boolean citaEnsala;
    
    @Column(name = "cita_paciente")
    private Integer citaPaciente;

    public Boolean getCitaEnsala() {
        return citaEnsala;
    }

    public void setCitaEnsala(Boolean citaEnsala) {
        this.citaEnsala = citaEnsala;
    }

    public Integer getCitaPaciente() {
        return citaPaciente;
    }

    public void setCitaPaciente(Integer citaPaciente) {
        this.citaPaciente = citaPaciente;
    }
    
    

    public Citas() {
    }

    public Citas(Integer citaId) {
        this.citaId = citaId;
    }

    public Integer getCitaId() {
        return citaId;
    }

    public void setCitaId(Integer citaId) {
        this.citaId = citaId;
    }

    public Date getCitaFecha() {
        return citaFecha;
    }

    public void setCitaFecha(Date citaFecha) {
        this.citaFecha = citaFecha;
    }

    public Date getCitaHora() {
        return citaHora;
    }

    public void setCitaHora(Date citaHora) {
        this.citaHora = citaHora;
    }

    public String getCitaNombres() {
        return citaNombres;
    }

    public void setCitaNombres(String citaNombres) {
        this.citaNombres = citaNombres;
    }

    public String getCitaApellidos() {
        return citaApellidos;
    }

    public void setCitaApellidos(String citaApellidos) {
        this.citaApellidos = citaApellidos;
    }

    public String getCitaTelefono() {
        return citaTelefono;
    }

    public void setCitaTelefono(String citaTelefono) {
        this.citaTelefono = citaTelefono;
    }

    public String getCitaCorreo() {
        return citaCorreo;
    }

    public void setCitaCorreo(String citaCorreo) {
        this.citaCorreo = citaCorreo;
    }

    public String getCitaMotivo() {
        return citaMotivo;
    }

    public void setCitaMotivo(String citaMotivo) {
        this.citaMotivo = citaMotivo;
    }

    public Date getCitaFechaCreacion() {
        return citaFechaCreacion;
    }

    public void setCitaFechaCreacion(Date citaFechaCreacion) {
        this.citaFechaCreacion = citaFechaCreacion;
    }

    public Date getCitaHoraCreacion() {
        return citaHoraCreacion;
    }

    public void setCitaHoraCreacion(Date citaHoraCreacion) {
        this.citaHoraCreacion = citaHoraCreacion;
    }

    public Integer getCitaEstado() {
        return citaEstado;
    }

    public void setCitaEstado(Integer citaEstado) {
        this.citaEstado = citaEstado;
    }

    public String getCitaUsuarioCreacion() {
        return citaUsuarioCreacion;
    }

    public void setCitaUsuarioCreacion(String citaUsuarioCreacion) {
        this.citaUsuarioCreacion = citaUsuarioCreacion;
    }

    public Date getCitaFechaModificacion() {
        return citaFechaModificacion;
    }

    public void setCitaFechaModificacion(Date citaFechaModificacion) {
        this.citaFechaModificacion = citaFechaModificacion;
    }

    public String getCitaUsuarioModificacion() {
        return citaUsuarioModificacion;
    }

    public void setCitaUsuarioModificacion(String citaUsuarioModificacion) {
        this.citaUsuarioModificacion = citaUsuarioModificacion;
    }

    public Usuarios getUsuarioUsuario() {
        return usuarioUsuario;
    }

    public void setUsuarioUsuario(Usuarios usuarioUsuario) {
        this.usuarioUsuario = usuarioUsuario;
    }

    public Medicos getMedicoId() {
        return medicoId;
    }

    public void setMedicoId(Medicos medicoId) {
        this.medicoId = medicoId;
    }

    public Clinicas getClinicaId() {
        return clinicaId;
    }

    public void setClinicaId(Clinicas clinicaId) {
        this.clinicaId = clinicaId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (citaId != null ? citaId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Citas)) {
            return false;
        }
        Citas other = (Citas) object;
        if ((this.citaId == null && other.citaId != null) || (this.citaId != null && !this.citaId.equals(other.citaId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Citas[ citaId=" + citaId + " ]";
    }

}
