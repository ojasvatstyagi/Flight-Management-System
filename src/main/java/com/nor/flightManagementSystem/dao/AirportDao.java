package com.nor.flightManagementSystem.dao;

import java.util.List;
import com.nor.flightManagementSystem.bean.Airport;

public interface AirportDao {
	public void addAirport(Airport airport);
	public List<Airport> showAllAirports();
	public Airport showAirport(String id);
}
