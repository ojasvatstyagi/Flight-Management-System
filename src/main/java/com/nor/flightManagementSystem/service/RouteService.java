package com.nor.flightManagementSystem.service;

import org.springframework.stereotype.Service;

import com.nor.flightManagementSystem.bean.Route;

@Service
public class RouteService {
	
	public Route createReturnRoute(Route route) {
        Route returnRoute = new Route();
        returnRoute.setRouteId(route.getRouteId() + 1); // Assuming route IDs are sequential
        returnRoute.setSourceAirportCode(route.getDestinationAirportCode());
        returnRoute.setDestinationAirportCode(route.getSourceAirportCode());
        returnRoute.setFair(route.getFair());
        return returnRoute;
    }
}



