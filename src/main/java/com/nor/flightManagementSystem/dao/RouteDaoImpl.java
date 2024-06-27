package com.nor.flightManagementSystem.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nor.flightManagementSystem.bean.Route;

@Repository
public class RouteDaoImpl implements RouteDao {

    @Autowired
    private RouteRepository repo;

    @Override
    public void save(Route route) {
        repo.save(route);
    }

    @Override
    public List<Route> findAllRoutes() {
        return repo.findAll();
    }

    @Override
    public Route findRouteById(Long id) {
        return repo.findById(id).get();
    }

    
    @Override
    public Long generateRouteId() {
        Long val = repo.findLastRouteId();
        return (val == null) ? 101L : val + 1;
    }

	@Override
	public List<Long> findAllRoutesId() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Route findRouteBySourceAndDestination(String source, String destination) {
		return repo.findRouteBySourceAndDestination(source, destination);
	}
}
