package br.com.aula.api.trabalho.exception;

import lombok.Getter;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

import java.util.Date;

@Getter
@ResponseStatus(value = HttpStatus.CONFLICT)
public class DateException extends RuntimeException {
    private final Date firstDate;

    public DateException(Date firstDate) {
        super(String.format(" Horário em conflito: %s", firstDate));
        this.firstDate = firstDate;
    }
}