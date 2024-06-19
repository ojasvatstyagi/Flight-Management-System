package com.nor.flightManagementSystem.dao;

import java.util.List;

import com.nor.flightManagementSystem.bean.Route;

public interface RouteDao {
	public void save(Route route);
	public List<Route> findAllRoutes();
	public Route findRouteById(Long id);
	public Long findRouteBySourceAndDestination(String source, String destination);
	public Long generateRouteId();
}
