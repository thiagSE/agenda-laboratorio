package br.com.aula.api.trabalho.model;

import java.util.Date;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;


@Entity
@Table(name = "tb_agendamento")

public class Agendamento {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @ManyToOne
    @JoinColumn(name="id_turma")
    private Turma turma;
    @ManyToOne
    @JoinColumn(name="id_usuario")
    private Usuario usuario;
    private Date horario_inicio;
    private Date horario_final;
    
    
    public Date getHorario_inicio() {
        return horario_inicio;
    }
    public void setHorario_inicio(Date horario_inicio) {
        this.horario_inicio = horario_inicio;
    }
    public Date getHorario_final() {
        return horario_final;
    }
    public void setHorario_final(Date horario_final) {
        this.horario_final = horario_final;
    }
    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }
    public Turma getTurma() {
        return turma;
    }
    public void setTurma(Turma turma) {
        this.turma = turma;
    }
    public Usuario getUsuario() {
        return usuario;
    }
    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }
}
