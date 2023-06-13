package br.com.aula.api.trabalho.controller;

import br.com.aula.api.trabalho.model.Professor;
import br.com.aula.api.trabalho.service.impl.ProfessorService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v1/")
public class ProfessorController {

    private final ProfessorService professorService;

    public ProfessorController(ProfessorService professorService) {
        this.professorService = professorService;
    }

    @PostMapping("/professor")
    public ResponseEntity<Professor> createProfessor(@RequestBody Professor professor) {
        return new ResponseEntity<>(professorService.save(professor), HttpStatus.CREATED);
    }
}
