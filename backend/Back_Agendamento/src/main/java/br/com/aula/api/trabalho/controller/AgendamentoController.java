package br.com.aula.api.trabalho.controller;

import br.com.aula.api.trabalho.model.Agendamento;
import br.com.aula.api.trabalho.payload.AgendamentoDto;
import br.com.aula.api.trabalho.payload.AgendamentoDtoReturn;
import br.com.aula.api.trabalho.service.impl.AgendamentoService;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v1")
public class AgendamentoController {

    private final AgendamentoService agendamentoService;

    public AgendamentoController(AgendamentoService agendamentoService) {
        this.agendamentoService = agendamentoService;
    }

    @PostMapping("/agendamento")
    public List<Agendamento> searchByDate(@RequestBody @DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss.SSSX") AgendamentoDto agendamentoDto) {
        return agendamentoService.findByDates(agendamentoDto.getStartDate(), agendamentoDto.getFinalDate());
    }

    @PostMapping("/agendamento/{professorId}/turma/{turmaId}")
    public ResponseEntity<AgendamentoDtoReturn> createAgendamento(
            @PathVariable(value = "professorId") Integer professorId,
            @PathVariable(value = "turmaId") Integer turmaId,
            @RequestBody AgendamentoDto agendamentoDto
    ) {

        return new ResponseEntity<>(agendamentoService.save(
                agendamentoDto, professorId, turmaId), HttpStatus.CREATED
        );
    }
}
