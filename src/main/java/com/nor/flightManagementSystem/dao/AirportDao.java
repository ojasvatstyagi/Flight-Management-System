package com.nor.flightManagementSystem.dao;

import java.util.List;

import com.nor.flightManagementSystem.bean.Airport;

public interface AirportDao {
    public void addAirport(Airport airport);
    public List<Airport> findAllAirports();
    public Airport findAirportById(String id);
    public List<String> findAllAirportCodes();
	public String findAirportCodeByLocation(String sourceAirportCode);
	public void deleteAirportByCode(String airportCode);
	public void updateAirport(Airport airport);
	public boolean checkAirportById(String airportCode);
    }
