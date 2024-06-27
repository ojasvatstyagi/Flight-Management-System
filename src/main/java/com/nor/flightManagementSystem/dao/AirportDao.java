package com.nor.flightManagementSystem.dao;

import java.util.List;

import org.springframework.http.ResponseEntity;

import com.nor.flightManagementSystem.bean.Airport;

public interface AirportDao {
    public ResponseEntity<?> addAirport(Airport airport);
    public List<Airport> findAllAirports();
    public Airport findAirportById(String id);
    public List<String> findAllAirportCodes();
	public String findAirportCodeByLocation(String sourceAirportCode);
	public Airport modifyAirport(Airport airport);
	public void deleteAirportByCode(String airportCode);
    }
