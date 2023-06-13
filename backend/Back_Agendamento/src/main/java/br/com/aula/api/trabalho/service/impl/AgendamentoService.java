package br.com.aula.api.trabalho.service.impl;

import br.com.aula.api.trabalho.exception.DateException;
import br.com.aula.api.trabalho.exception.ResourceNotFoundException;
import br.com.aula.api.trabalho.model.Agendamento;
import br.com.aula.api.trabalho.model.Professor;
import br.com.aula.api.trabalho.model.Turma;
import br.com.aula.api.trabalho.payload.AgendamentoDto;
import br.com.aula.api.trabalho.payload.AgendamentoDtoReturn;
import br.com.aula.api.trabalho.repository.AgendamentoRepository;
import br.com.aula.api.trabalho.repository.ProfessorRepository;
import br.com.aula.api.trabalho.repository.TurmaRepository;
import jakarta.transaction.Transactional;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class AgendamentoService {

    private final AgendamentoRepository agendamentoRepository;
    private final ProfessorRepository professorRepository;
    private final TurmaRepository turmaRepository;
    private final ModelMapper modelMapper;

    public AgendamentoService(AgendamentoRepository agendamentoRepository, ProfessorRepository professorRepository, TurmaRepository turmaRepository, ModelMapper modelMapper) {
        this.agendamentoRepository = agendamentoRepository;
        this.professorRepository = professorRepository;
        this.turmaRepository = turmaRepository;
        this.modelMapper = modelMapper;
    }

    public AgendamentoDtoReturn save(AgendamentoDto agendamentoDto, Integer professorId, Integer turmaId) {
        Agendamento agendamento = modelMapper.map(agendamentoDto, Agendamento.class);

        Professor professor = professorRepository.findById(professorId).orElseThrow(
                () -> new ResourceNotFoundException("Professor", "id", professorId)
        );

        Turma turma = turmaRepository.findById(turmaId).orElseThrow(
                () -> new ResourceNotFoundException("Turma", "id", turmaId)
        );

        List<Agendamento> agendamentos = agendamentoRepository.
                findByStartDateGreaterThanEqualAndFinalDateLessThanEqual(agendamento.getStartDate(), agendamento.getFinalDate());
        if (!agendamentos.isEmpty()) {
            throw new RuntimeException("Laborátorio Ocupado!");
        }

        agendamento.setProfessor(professor);
        agendamento.setTurma(turma);

        AgendamentoDtoReturn agendamentoDtoReturn = new AgendamentoDtoReturn();
        agendamentoDtoReturn.setStartDate(agendamento.getStartDate());
        agendamentoDtoReturn.setFinalDate(agendamento.getFinalDate());
        agendamentoDtoReturn.setProfessorId(professorId);
        agendamentoDtoReturn.setTurmaId(turmaId);

        return agendamentoDtoReturn;
    }

    @Transactional
    public List<Agendamento> findByDates(Date beginDate, Date finalDate) {
        return agendamentoRepository.findByStartDateGreaterThanEqualAndFinalDateLessThanEqual(beginDate, finalDate);
    }
}
