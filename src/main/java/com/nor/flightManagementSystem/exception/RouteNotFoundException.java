package com.nor.flightManagementSystem.exception;

@SuppressWarnings("serial")
public class RouteNotFoundException extends RuntimeException {
    public RouteNotFoundException(String message) {
        super(message);
    }
}
