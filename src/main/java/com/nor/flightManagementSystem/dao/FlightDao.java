package com.nor.flightManagementSystem.dao;

import java.util.List;

import com.nor.flightManagementSystem.bean.Flight;

public interface FlightDao {
	public void addFlight(Flight flight);
	public List<Flight> showAllFlights();
	public Flight viewFlight(Long flightNumber);
	public void updateFlight(Flight flight);
	public List<Flight> findFlightsByRouteId(Long routeId);
	public void deleteFlightByFlightNumber(Long flightNumber);
	public Flight findByFlightNumber(Long flightNumber);
}
