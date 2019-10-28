package util;

public class Horario {
    private Integer valor;
    private boolean estado;
    private String hora;

    public Horario(Integer valor, String hora) {
        this.valor = valor;
        this.hora = hora;
        this.estado = true;
    }

    public Horario() {
        this.estado = true;
    }

    public Integer getValor() {
        return valor;
    }

    public void setValor(Integer valor) {
        this.valor = valor;
    }

    public boolean isEstado() {
        return estado;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }

    public String getHora() {
        return hora;
    }

    public void setHora(String hora) {
        this.hora = hora;
    }

}
