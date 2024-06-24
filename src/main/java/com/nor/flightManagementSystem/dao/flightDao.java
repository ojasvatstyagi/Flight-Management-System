package com.nor.flightManagementSystem.dao;

import java.util.List;

import com.nor.flightManagementSystem.bean.Flight;

public interface FlightDao {
	public void addFlight(Flight flight);
	public List<Flight> showAllFlights();
	public Flight viewFlight(Long flightNo);
	public void modifyFlight(Flight flight);
	public void removeFlight(Long flightNo);
	public List<Flight> findFlightsByRouteIdAndDepartureTime(Long routeId, String timeOfFlight);
}
