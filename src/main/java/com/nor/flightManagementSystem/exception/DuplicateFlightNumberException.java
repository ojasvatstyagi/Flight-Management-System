package com.nor.flightManagementSystem.exception;

@SuppressWarnings("serial")
public class DuplicateFlightNumberException extends RuntimeException {
    public DuplicateFlightNumberException(String message) {
        super(message);
    }
}
