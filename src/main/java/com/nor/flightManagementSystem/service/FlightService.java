package com.nor.flightManagementSystem.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nor.flightManagementSystem.bean.Flight;
import com.nor.flightManagementSystem.bean.Route;
import com.nor.flightManagementSystem.dao.RouteDao;

@Service
public class FlightService {

@Autowired
private RouteDao routeDao;

	public Flight createReturnFlight (Flight flight, String dtime, String atime) {
		Long newId = flight.getFlightNo()+1;
		Route route = routeDao.findRouteById(flight.getRouteId());
		String sourceCode = route.getDestinationAirportCode();
		String destinationCode = route.getSourceAirportCode();
		Route newRoute = routeDao.findRouteBySourceAndDestination (sourceCode, destinationCode);
		return new Flight (newId, flight.getCarrierName(), newRoute.getRouteId(), flight.getSeatCapacity(), dtime, atime);
	}

}