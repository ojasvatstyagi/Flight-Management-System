package com.nor.flightManagementSystem.dao;

import java.util.List;
import java.util.Optional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.nor.flightManagementSystem.bean.Flight;
import com.nor.flightManagementSystem.exception.RecordAlreadyPresentException;
import com.nor.flightManagementSystem.exception.RecordNotFoundException;

@Service
public class FlightDaoImpl implements FlightDao{
	
	@PersistenceContext
    private EntityManager entityManager;

    @Autowired
    private FlightRepositary flightRepository;

    @Override
	public ResponseEntity<Flight> addFlight(Flight flight) {
		Optional<Flight> findById = flightRepository.findById(flight.getFlightNo());
		try {
		if (!findById.isPresent()) {
			flightRepository.save(flight);
			return new ResponseEntity<Flight>(flight,HttpStatus.OK);
		} else
			throw new RecordAlreadyPresentException("Flight with number: " + flight.getFlightNo() + " already present");
	}
		catch(RecordAlreadyPresentException e)
		{
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
	}

    public List<Flight> showAllFlights() {
        return flightRepository.findAll();
    }

    @Override
	public Flight viewFlight(Long flightNo) {
		Optional<Flight> findById = flightRepository.findById(flightNo);
		if (findById.isPresent()) {
			return findById.get();
		}
		else
			throw new RecordNotFoundException("Flight with number: " + flightNo + " not exists");
	    }
	
    @Override
	public void updateFlight(Flight flight) {
		Optional<Flight> findById = flightRepository.findById(flight.getFlightNo());
		if (findById.isPresent()) {
			flightRepository.save(flight);
		} else
			throw new RecordNotFoundException("Flight with number: " + flight.getFlightNo() + " not exists");
	}

    public String removeFlight(Long flightNo) {
		Optional<Flight> findById = flightRepository.findById(flightNo);
		if (findById.isPresent()) {
			flightRepository.deleteById(flightNo);
			return "Flight removed!!";
		} else
			throw new RecordNotFoundException("Flight with number: " + flightNo + " not exists");

	}

	@Override
	public List<Flight> findFlightsByRouteId(Long routeId) {
		return flightRepository.findFlightsByRouteId(routeId);
	}

}
