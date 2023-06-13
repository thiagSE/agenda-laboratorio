package br.com.aula.api.trabalho.model;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.HashSet;
import java.util.Set;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "tb_turma")
public class Turma {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String curso;
    @Column
    private int periodo;
    @Enumerated(EnumType.STRING)
    private EnumTurno turno;
    @ManyToMany(mappedBy = "turmas", fetch = FetchType.LAZY)
    @JsonBackReference
    private Set<Professor> professores = new HashSet<>();
}
