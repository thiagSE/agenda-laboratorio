package br.com.aula.api.trabalho.repository;

import br.com.aula.api.trabalho.model.Professor;
import br.com.aula.api.trabalho.model.Turma;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProfessorRepository extends JpaRepository<Professor, Integer> {
}
