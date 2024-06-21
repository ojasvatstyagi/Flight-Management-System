package com.nor.flightManagementSystem.dao;

import java.util.List;
import java.util.Optional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nor.flightManagementSystem.bean.Flight;

@Service
public class FlightDaoImpl implements FlightDao{
	
	@PersistenceContext
    private EntityManager entityManager;

    @Autowired
    private FlightRepositary flightRepository;

    public void addFlight(Flight flight) {
        flightRepository.save(flight);
    }

    public List<Flight> showAllFlights() {
        return flightRepository.findAll();
    }

	@Override
	public Flight viewFlight(Long flightNo) {
		Optional<Flight> findById = flightRepository.findById(flightNo);
			return findById.get();
	}

	@Override
	public void modifyFlight(Flight flight) {
			flightRepository.save(flight);
	}

	@Override
	public void removeFlight(Long flightNo) {
		flightRepository.delete(flightRepository.findById(flightNo).get());
	}

	@Override
    public List<Flight> findFlightsByRouteIdAndDepartureTime(Long routeId, String timeOfFlight) {
        String queryStr = "SELECT f FROM Flight f WHERE f.routeId = :routeId AND f.departure LIKE :timeOfFlight%";
        TypedQuery<Flight> query = entityManager.createQuery(queryStr, Flight.class);
        query.setParameter("routeId", routeId);
        query.setParameter("timeOfFlight", timeOfFlight + "%"); // Using wildcard for partial match
        return query.getResultList();
    }
}
