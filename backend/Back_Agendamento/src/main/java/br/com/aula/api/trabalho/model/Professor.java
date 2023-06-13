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
@Table(name = "tb_professor")
public class Professor {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column(nullable = false)
    private String matricula;
    @Column(nullable = true)
    private String email;
    @Column(nullable = false)
    private String senha;
    @Column(nullable = false)
    private String nome;
    @ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinTable(name = "tb_professor_turma",
            joinColumns = {
                @JoinColumn(name = "id_professor", referencedColumnName = "id")
            },
            inverseJoinColumns = {
                @JoinColumn(name = "id_turma", referencedColumnName = "id")
            }
    )
    @JsonBackReference
    private Set<Turma> turmas = new HashSet<>();
}
