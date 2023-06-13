package br.com.aula.api.trabalho.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(value = HttpStatus.NOT_FOUND)
public class ResourceNotFoundException extends RuntimeException {
    private final String resouceName;
    private final String fieldName;
    private final long fieldValue;

    public ResourceNotFoundException(String resouceName, String fieldName, long fieldValue) {
        super(String.format("%s not found with %s : '%s'", resouceName, fieldName, fieldValue));
        this.resouceName = resouceName;
        this.fieldName = fieldName;
        this.fieldValue = fieldValue;
    }

    public String getResouceName() {
        return resouceName;
    }

    public String getFieldName() {
        return fieldName;
    }

    public long getFieldValue() {
        return fieldValue;
    }
}