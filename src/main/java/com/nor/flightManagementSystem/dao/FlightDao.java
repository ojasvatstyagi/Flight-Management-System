package com.nor.flightManagementSystem.dao;

import java.util.List;

import org.springframework.http.ResponseEntity;

import com.nor.flightManagementSystem.bean.Flight;

public interface FlightDao {
	public ResponseEntity<Flight> addFlight(Flight flight);
	public List<Flight> showAllFlights();
	public Flight viewFlight(Long flightNo);
	public Flight modifyFlight(Flight flight);
	public String removeFlight(Long flightNo);
	public List<Flight> findFlightsByRouteIdAndDepartureTime(Long routeId, String timeOfFlight);
}
