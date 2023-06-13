package br.com.aula.api.trabalho.service.impl;

import br.com.aula.api.trabalho.model.Professor;
import br.com.aula.api.trabalho.model.Turma;
import br.com.aula.api.trabalho.repository.ProfessorRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProfessorService {
    private final ProfessorRepository professorRepository;

    public ProfessorService(ProfessorRepository professorRepository) {
        this.professorRepository = professorRepository;
    }

    public Professor save(Professor professor) {
         return professorRepository.save(professor);
    }
}
