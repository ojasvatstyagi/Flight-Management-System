package com.nor.flightManagementSystem.exception;

@SuppressWarnings("serial")
public class FlightNotFoundException extends RuntimeException {
	public FlightNotFoundException(String message) {
        super(message);
    }
}
