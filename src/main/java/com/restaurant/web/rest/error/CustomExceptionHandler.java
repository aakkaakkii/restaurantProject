package com.restaurant.web.rest.error;

import com.restaurant.common.CustomException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;

@ControllerAdvice
public class CustomExceptionHandler extends ResponseEntityExceptionHandler {

    @Autowired
    private MessageSource messageSource;

    @ExceptionHandler(CustomException.class)
    public ResponseEntity customHandleNotFound(CustomException ex, WebRequest request) {

        CustomErrorResponse errors = new CustomErrorResponse();
        errors.setMessage(messageSource.getMessage(ex.getType().getCode(), null, LocaleContextHolder.getLocale()));

        errors.setStatus(ex.getStatus());

        ex.printStackTrace();

        return new ResponseEntity(errors, HttpStatus.NOT_FOUND);

    }

    private class CustomErrorResponse{
        private int status;
        private String message;

        public int getStatus() {
            return status;
        }

        public void setStatus(int status) {
            this.status = status;
        }

        public String getMessage() {
            return message;
        }

        public void setMessage(String message) {
            this.message = message;
        }
    }
}
