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

@Entity
@Table(name = "citas")
@NamedQueries({
    @NamedQuery(name = "Citas.findAll", query = "SELECT c FROM Citas c"),
    @NamedQuery(name = "Citas.findByCitaId", query = "SELECT c FROM Citas c WHERE c.citaId = :citaId"),
    @NamedQuery(name = "Citas.findByCitaFecha", query = "SELECT c FROM Citas c WHERE c.citaFecha = :citaFecha"),
    @NamedQuery(name = "Citas.findByCitaHora", query = "SELECT c FROM Citas c WHERE c.citaHora = :citaHora"),
    @NamedQuery(name = "Citas.findByCitaMotivo", query = "SELECT c FROM Citas c WHERE c.citaMotivo = :citaMotivo"),
    @NamedQuery(name = "Citas.findByCitaFechaCreacion", query = "SELECT c FROM Citas c WHERE c.citaFechaCreacion = :citaFechaCreacion"),
    @NamedQuery(name = "Citas.findByCitaHoraCreacion", query = "SELECT c FROM Citas c WHERE c.citaHoraCreacion = :citaHoraCreacion"),
    @NamedQuery(name = "Citas.findByCitaEstado", query = "SELECT c FROM Citas c WHERE c.citaEstado = :citaEstado"),
    @NamedQuery(name = "Citas.findByCitaUsuarioCreacion", query = "SELECT c FROM Citas c WHERE c.citaUsuarioCreacion = :citaUsuarioCreacion"),
    @NamedQuery(name = "Citas.findByCitaFechaModificacion", query = "SELECT c FROM Citas c WHERE c.citaFechaModificacion = :citaFechaModificacion"),
    @NamedQuery(name = "Citas.findByCitaUsuarioModificacion", query = "SELECT c FROM Citas c WHERE c.citaUsuarioModificacion = :citaUsuarioModificacion"),

    //Reportes
    @NamedQuery(name = "Citas.findByCitasPorClinicaReporte", query = "SELECT c FROM Citas c WHERE c.clinicaId.clinicaId = :clinicaId AND c.citaEstado = :estado AND c.citaFecha BETWEEN :fechaInicio AND :fechaFin"),
    @NamedQuery(name = "Citas.findByCitasPorTodasClinicasReporte", query = "SELECT c FROM Citas c WHERE c.citaEstado = :estado AND c.citaFecha BETWEEN :fechaInicio AND :fechaFin"),
    @NamedQuery(name = "Citas.findByCitasPorMedicoReporte", query = "SELECT c FROM Citas c WHERE c.medicoId.medicoId = :medicoId AND c.citaEstado = :estado AND c.citaFecha BETWEEN :fechaInicio AND :fechaFin"),
    @NamedQuery(name = "Citas.findByCitasPorTodosMedicosReporte", query = "SELECT c FROM Citas c WHERE c.citaEstado = :estado AND c.citaFecha BETWEEN :fechaInicio AND :fechaFin"),
    @NamedQuery(name = "Citas.findByCitasPorEstadoReporte", query = "SELECT c FROM Citas c WHERE c.citaEstado = :citaEstado AND c.citaFecha BETWEEN :fechaInicio AND :fechaFin"),
    @NamedQuery(name = "Citas.findByPacientesPorClinicaReporte", query = "SELECT c FROM Citas c WHERE c.clinicaId.clinicaId = :clinicaId AND c.citaEstado = :citaEstado AND c.citaFecha BETWEEN :fechaInicio AND :fechaFin"),
    
    @NamedQuery(name = "Citas.findByCitasTotalEstado", query = "SELECT c FROM Citas c WHERE c.citaEstado = :idEstado"),
    @NamedQuery(name = "Citas.findByCitasMesEstado", query = "SELECT c FROM Citas c WHERE c.citaFecha > :fecha_inferior AND c.citaFecha < :fecha_superior "),
    @NamedQuery(name = "Citas.findByCitaAtendidaPorSucursal", query = "SELECT c FROM Citas c WHERE c.clinicaId.clinicaId = :idClinica AND c.citaEstado = :idEstado"),
    @NamedQuery(name = "Citas.programasFechaActual", query = "SELECT c FROM Citas c WHERE c.citaFecha >= :fecha_cita AND ( c.citaEstado = 1 OR c.citaEstado = 2) ORDER BY c.citaFecha ASC"),

    @NamedQuery(name = "Citas.reservadasClinica", query = "SELECT c FROM Citas c WHERE c.clinicaId.clinicaId = :clinica_id AND c.citaFecha = :fecha_cita AND c.citaHora = :citaHora  AND ( c.citaEstado = 1 OR c.citaEstado = 2)"),
    @NamedQuery(name = "Citas.reservadasClinicaMedico", query = "SELECT c FROM Citas c WHERE c.clinicaId.clinicaId = :clinica_id AND c.citaFecha = :fecha_cita AND c.citaHora = :citaHora  AND ( c.citaEstado = 1 OR c.citaEstado = 2) AND c.medicoId.medicoId = :medicoId"),
    @NamedQuery(name = "Citas.reservadasClinicasMedico", query = "SELECT c FROM Citas c WHERE c.citaFecha = :fecha_cita AND c.citaHora = :citaHora  AND ( c.citaEstado = 1 OR c.citaEstado = 2) AND c.medicoId.medicoId = :medicoId"),

    @NamedQuery(name = "Citas.findByCitasReservadas", query = "SELECT c FROM Citas c WHERE c.citaEstado = 1"),
    @NamedQuery(name = "Citas.findCitaPorSucursalReport", query = "SELECT c FROM Citas c WHERE c.citaFechaCreacion between :fechainicio and :fechafin and c.clinicaId.clinicaId = :clinicaId AND c.citaEstado = :estadoId"),

    @NamedQuery(name = "Citas.citaDelDia", query = "SELECT c FROM Citas c WHERE c.usuarioUsuario.usuarioUsuario = :usuario AND c.citaFecha = :dia"),
    @NamedQuery(name = "Citas.citaDelDiaMedico", query = "SELECT c FROM Citas c WHERE c.medicoId.medicoId = :medicoId AND c.citaFecha = :dia AND ( c.citaEstado = 1 OR c.citaEstado = 2)"),
    @NamedQuery(name = "Citas.agendaMedico", query = "SELECT c FROM Citas c WHERE c.medicoId.medicoId = :medicoId AND c.citaFecha >= :dia AND ( c.citaEstado = 1 OR c.citaEstado = 2)"),

    @NamedQuery(name = "Citas.citaDelDiaConfirmadas", query = "SELECT c FROM Citas c WHERE c.citaFecha = :dia AND c.citaEstado = 2"),
    @NamedQuery(name = "Citas.citaDelDiaConfirmadasSucursal", query = "SELECT c FROM Citas c WHERE c.citaFecha = :dia AND c.citaEstado = 2 AND c.clinicaId.clinicaId = :clinicaId"),
    @NamedQuery(name = "Citas.citaUsuarioActiva", query = "SELECT c FROM Citas c WHERE (c.citaEstado = 1 OR c.citaEstado = 2) AND c.usuarioUsuario.usuarioUsuario = :usuario AND c.citaFecha >= :fecha"),
    @NamedQuery(name = "Citas.citaExpedienteActiva", query = "SELECT c FROM Citas c WHERE (c.citaEstado = 1 OR c.citaEstado = 2) AND c.pacienteId.pacienteId = :pacienteId  AND c.citaFecha >= :fecha"),
    @NamedQuery(name = "Citas.confirmadasPorClinica", query = "SELECT c FROM Citas c WHERE c.citaEstado =  2 AND c.citaFecha >= :fecha AND C.clinicaId.clinicaId = :clinica ORDER BY c.citaFecha DESC"),
    @NamedQuery(name = "Citas.confirmadas", query = "SELECT c FROM Citas c WHERE c.citaEstado =  2 AND c.citaFecha >= :fecha ORDER BY c.citaFecha DESC"),
    
    //Named queries para comprobar las citas aprobadas del dia. 
    @NamedQuery(name = "Citas.confirmadasPorClinicaHoy", query = "SELECT c FROM Citas c WHERE c.citaEstado =  2 AND c.citaFecha = :fecha AND C.clinicaId.clinicaId = :clinica ORDER BY c.citaFecha DESC"),
    @NamedQuery(name = "Citas.confirmadasHoy", query = "SELECT c FROM Citas c WHERE c.citaEstado =  2 AND c.citaFecha = :fecha ORDER BY c.citaFecha DESC"),

    //Named queries para conocer las citas pendientes (reservadas). 
    @NamedQuery(name = "Citas.reservadasPendientes", query = "SELECT c FROM Citas c WHERE c.citaEstado =  1 AND c.citaFecha >= :fecha ORDER BY c.citaFecha DESC"),
    @NamedQuery(name = "Citas.reservadasPendientesPorClinica", query = "SELECT c FROM Citas c WHERE c.citaEstado =  1 AND c.clinicaId.clinicaId = :clinica AND c.citaFecha >= :fecha ORDER BY c.citaFecha DESC"),

    //Namded query para conocer todas las citas del paciente por medio del usuario o correo
    @NamedQuery(name = "Citas.todasPorUsuario", query = "SELECT c FROM Citas c WHERE c.usuarioUsuario.usuarioUsuario = :usuario ORDER BY c.citaFecha DESC"),
    @NamedQuery(name = "Citas.todasPorUsuarioExpediente", query = "SELECT c FROM Citas c WHERE c.usuarioUsuario.usuarioUsuario = :usuario OR c.pacienteId.pacienteId = :pacienteId ORDER BY c.citaFecha DESC"),

    //Named query para listar todas las citas por sucursal
    @NamedQuery(name = "Citas.historicoPorClinica", query = "SELECT c FROM Citas c WHERE c.clinicaId.clinicaId = :clinica ORDER BY c.citaFecha DESC"),})
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

    @Column(name = "cita_ensala")
    private Boolean citaEnsala;

    @JoinColumn(name = "paciente_id", referencedColumnName = "paciente_id")
    @ManyToOne
    private Pacientes pacienteId;
    
    public Boolean getCitaEnsala() {
        return citaEnsala;
    }

    public void setCitaEnsala(Boolean citaEnsala) {
        this.citaEnsala = citaEnsala;
    }

    public Pacientes getPacienteId() {
        return pacienteId;
    }

    public void setPacienteId(Pacientes pacienteId) {
        this.pacienteId = pacienteId;
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
