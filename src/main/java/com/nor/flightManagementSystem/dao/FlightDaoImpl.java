package com.nor.flightManagementSystem.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nor.flightManagementSystem.bean.Flight;

@Service
public class FlightDaoImpl implements FlightDao{
	
	@PersistenceContext
    private EntityManager entityManager;

    @Autowired
    private FlightRepositary flightRepository;

    @Override
	public void addFlight(Flight flight) {
		flightRepository.save(flight);
	}

    public List<Flight> showAllFlights() {
        return flightRepository.findAll();
    }

    @Override
	public Flight viewFlight(Long flightNumber) {
    	return flightRepository.findById(flightNumber).get();
    }
	
    @Override
	public void updateFlight(Flight flight) {
    	flightRepository.save(flight);
	}

	@Override
	public List<Flight> findFlightsByRouteId(Long routeId) {
		return flightRepository.findFlightsByRouteId(routeId);
	}

	@Override
	public void deleteFlightByFlightNumber(Long flightNumber) {
		flightRepository.deleteById(flightNumber);
	}

	@Override
	public Flight findByFlightNumber(Long flightNumber) {
		return flightRepository.findById(flightNumber).get();
	}

}
