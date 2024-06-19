package com.nor.flightManagementSystem.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "airport")
public class Airport {

    @Id
    @Column(name = "airport_code", nullable = false)
    private String airportCode;

    @Column(name = "airport_location")
    private String airportLocation;

    // Default constructor
    public Airport() {
        super();
    }

    // Parameterized constructor
    public Airport(String airportCode, String airportLocation) {
        this.airportCode = airportCode;
        this.airportLocation = airportLocation;
    }

    // Getters and setters
    public String getAirportCode() {
        return airportCode;
    }

    public void setAirportCode(String airportCode) {
        this.airportCode = airportCode;
    }

    public String getAirportLocation() {
        return airportLocation;
    }

    public void setAirportLocation(String airportLocation) {
        this.airportLocation = airportLocation;
    }

    // toString method
    @Override
    public String toString() {
        return "Airport [airportCode=" + airportCode + ", airportLocation=" + airportLocation + "]";
    }
}
