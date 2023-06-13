package br.com.aula.api.trabalho.controller;

import br.com.aula.api.trabalho.model.Turma;
import br.com.aula.api.trabalho.service.impl.ProfessorService;
import br.com.aula.api.trabalho.service.impl.TurmaService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/v1")
public class TurmaController {

    private final TurmaService turmaService;

    public TurmaController(TurmaService turmaService, ProfessorService professorService) {
        this.turmaService = turmaService;
    }

    @GetMapping("/turma/{professorId}")
    public List<Turma> searchTurmasProfessor(@PathVariable(value = "professorId") Integer professorId) {
        return turmaService.getByProfessorId(professorId);
    }
}
