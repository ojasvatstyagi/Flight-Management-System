package com.nor.flightManagementSystem.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.nor.flightManagementSystem.bean.Route;

public interface RouteRepository extends JpaRepository<Route, Long> {
    @Query("SELECT MAX(r.routeId) FROM Route r")
    Long findLastRouteId();

    @Query("SELECT r.routeId FROM Route r WHERE r.sourceAirportCode = ?1 AND r.destinationAirportCode = ?2")
    Long findRouteBySourceAndDestination(String sourceAirportCode, String destinationAirportCode);
}
