package com.nor.flightManagementSystem.exception;

@SuppressWarnings("serial")
public class IncompletePassengerDetailsException extends RuntimeException {
    public IncompletePassengerDetailsException(String message) {
        super(message);
    }
}
