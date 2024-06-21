package com.nor.flightManagementSystem.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.nor.flightManagementSystem.bean.Flight;


public interface FlightRepositary extends JpaRepository<Flight, Long> {
	@Query("SELECT f FROM Flight f WHERE f.routeId = :routeId AND f.departure LIKE :timeOfFlight%")
    List<Flight> findFlightsByRouteIdAndDepartureTime(@Param("routeId") Long routeId, @Param("timeOfFlight") String timeOfFlight);

}