package com.nor.flightManagementSystem.exception;

@SuppressWarnings("serial")
public class AirportNotFoundException extends RuntimeException {
    public AirportNotFoundException(String message) {
        super(message);
    }
}