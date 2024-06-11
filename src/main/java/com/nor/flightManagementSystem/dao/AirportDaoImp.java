package com.nor.flightManagementSystem.dao;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;

import com.nor.flightManagementSystem.bean.Airport;

public class AirportDaoImp implements AirportDao{
	@Autowired
	private AirportRepositary repositary;

	@Override
	public void addAirport(Airport airport) {
		repositary.save(airport);	
	}

	@Override
	public List<Airport> showAllAirports() {		
		return repositary.findAll();
	}

	@Override
	public Airport showAirport(String id) {	
		return repositary.findById(id).get();
	}

}
