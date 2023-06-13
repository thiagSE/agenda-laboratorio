package br.com.aula.api.trabalho.payload;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalTime;
import java.util.Date;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class AgendamentoDtoReturn {
    private Date startDate;
    private Date finalDate;
    private Integer professorId;
    private Integer turmaId;
}
