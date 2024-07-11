package com.nor.flightManagementSystem.exception;


@SuppressWarnings("serial")
public class DuplicateAirportCodeException extends RuntimeException {
    public DuplicateAirportCodeException(String message) {
        super(message);
    }
}
