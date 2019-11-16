package com.restaurant.common;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;

public class CustomException extends Exception {
    @Autowired
    private MessageSource messageSource;

    public enum Type{
        //User Exceptions
        USER_EXISTS("user.exists"),
        PASSWORD_IS_EMPTY("user.emptyPassword"),
        TABLE_EXISTS("tables.tableExists"),
        TABLE_IS_RESERVED("reservation.tableIsReserved");

        private final String messageUrl;
        Type(String messageUrl) {
            this.messageUrl = messageUrl;
        }

        public String getCode() {
            return messageUrl;
        }
    }
    private int status;
    private Type type;

    public CustomException(Type type, int status) {
        super(type.getCode());
        this.type= type;
        this.status = status;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Type getType() {
        return type;
    }

    public void setType(Type type) {
        this.type = type;
    }

}
