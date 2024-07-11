package com.nor.flightManagementSystem.exception;

@SuppressWarnings("serial")
public class InvalidAirportCodeException extends RuntimeException {
    public InvalidAirportCodeException(String message) {
        super(message);
    }
}
