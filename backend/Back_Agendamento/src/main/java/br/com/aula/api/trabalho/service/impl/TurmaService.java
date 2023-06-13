package br.com.aula.api.trabalho.service.impl;

import br.com.aula.api.trabalho.exception.ResourceNotFoundException;
import br.com.aula.api.trabalho.model.Professor;
import br.com.aula.api.trabalho.model.Turma;
import br.com.aula.api.trabalho.repository.ProfessorRepository;
import br.com.aula.api.trabalho.repository.TurmaRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TurmaService {
    private final TurmaRepository turmaRepository;

    public TurmaService(TurmaRepository turmaRepository) {
        this.turmaRepository = turmaRepository;
    }

    public List<Turma> searchByProfessor(Integer professorId) {
        return turmaRepository.findAll();
    }

    public  List<Turma> getByProfessorId(Integer professorId) {
        return turmaRepository.findByProfessoresId(professorId);
    }
}
