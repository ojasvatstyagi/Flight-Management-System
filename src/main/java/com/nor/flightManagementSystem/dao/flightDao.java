package com.nor.flightManagementSystem.dao;

import java.util.List;

import com.nor.flightManagementSystem.bean.Flight;

public interface flightDao {
	public void addFlight(Flight flight);
	public List<Flight> showAllFlights();
}
