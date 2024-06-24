package com.nor.flightManagementSystem.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Repository;

import com.nor.flightManagementSystem.bean.Airport;
import com.nor.flightManagementSystem.exception.RecordAlreadyPresentException;
import com.nor.flightManagementSystem.exception.RecordNotFoundException;

@Repository
public class AirportDaoImpl implements AirportDao {

    @Autowired
    private AirportRepository repository;
    
//    @Override
//    public void addAirport(Airport airport) {
//        repository.save(airport);
//    }
    
    @Override
	public ResponseEntity<?> addAirport(Airport airport) {
		Optional<Airport> findById = repository.findById(airport.getAirportCode());
		try {
		if (!findById.isPresent()) {
			repository.save(airport);
			return new ResponseEntity<Airport>(airport,HttpStatus.OK);
		} 
		else
			throw new RecordAlreadyPresentException(
					"Airport with code : " + airport.getAirportCode() + " already present");
	     }
		catch(RecordAlreadyPresentException e)
		{
			return new ResponseEntity<Airport>(airport,HttpStatus.NOT_FOUND);
		}
	}

    @Override
    public List<Airport> findAllAirports() {
        return repository.findAll();
    }

    @Override
    public Airport findAirportById(String id) {
        return repository.findById(id).get();
    }
    
    @Override
    public List<String> findAllAirportCodes() {
        return repository.findAllAirportCodes();
    }

	@Override
	public String findAirportCodeByLocation(String sourceAirportCode) {
		return repository.findAirportCodeByLocation(sourceAirportCode);
	}
	
	@Override
	public Airport modifyAirport(Airport airport) {
		Optional<Airport> findById = repository.findById(airport.getAirportCode());
		if (findById.isPresent()) {
			repository.save(airport);
		} 
		else
			throw new RecordNotFoundException("Airport with code: " + airport.getAirportCode() + " not exists");
		return airport;
	}

	@Override
	public String removeAirport(String airportCode) {
		Optional<Airport> findById = repository.findById(airportCode);
		if (findById.isPresent()) {
			repository.deleteById(airportCode);
			return "Airport removed";
		} else
			throw new RecordNotFoundException("Airport with code: " + airportCode + " not exists");

	}
}
