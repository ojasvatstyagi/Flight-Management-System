package com.nor.flightManagementSystem.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.nor.flightManagementSystem.bean.Airport;
import com.nor.flightManagementSystem.bean.Route;
import com.nor.flightManagementSystem.dao.AirportDao;
import com.nor.flightManagementSystem.dao.RouteDao;
import com.nor.flightManagementSystem.exception.DatabaseException;
import com.nor.flightManagementSystem.exception.RouteNotFoundException;
import com.nor.flightManagementSystem.service.RouteService;

@Controller
public class RouteController {

    @Autowired
    private RouteDao routeDao;

    @Autowired
    private RouteService routeService;

    @Autowired
    private AirportDao airportDao;

    @GetMapping("/route")
    public ModelAndView showRouteEntryPage() {
        try {
            Long newRouteId = routeDao.generateRouteId();
            List<Airport> airports = airportDao.findAllAirports();
            Route route = new Route();
            route.setRouteId(newRouteId);
            ModelAndView mv = new ModelAndView("addRoute");
            mv.addObject("routeRecord", route);
            mv.addObject("codeList", airports);
            return mv;
        } catch (Exception e) {
            throw new DatabaseException("Error generating new route ID or fetching airports", e);
        }
    }

    @PostMapping("/route")
    public ModelAndView saveRoutes(@ModelAttribute("routeRecord") Route route) {
        try {
            Route returnRoute = routeService.createReturnRoute(route);
            routeDao.save(route);
            routeDao.save(returnRoute);
            return new ModelAndView("redirect:/route?message=Route details added successfully");
        } catch (Exception e) {
            throw new DatabaseException("Error saving route", e);
        }
    }

    @GetMapping("/viewRoutes")
    public ModelAndView showAllSchedules() {
        try {
            List<Route> routes = routeDao.findAllRoutes();
            ModelAndView mv = new ModelAndView("viewRoutesPage");
            mv.addObject("routes", routes);
            return mv;
        } catch (Exception e) {
            throw new DatabaseException("Error fetching routes", e);
        }
    }
    
    @GetMapping("/modifyRoute")
    public ModelAndView deleteRoute() {
        try {
            List<Route> routes = routeDao.findAllRoutes();
            List<Airport> airports = airportDao.findAllAirports();
            ModelAndView mv = new ModelAndView("modifyRoute");
            mv.addObject("routes", routes);
            mv.addObject("airports", airports);
            return mv;
        } catch (Exception e) {
            throw new DatabaseException("Error retrieving routes from the database", e);
        }
    }


    @PostMapping("/updateRoute")
    public ModelAndView updateAirport(@RequestParam Long routeId,
                                      @RequestParam String destinationAirportCode,
                                      @RequestParam String sourceAirportCode,
    								  @RequestParam Double price){
        try {
        	 Route route = routeDao.findRouteById(routeId);
            if (route == null) {
                throw new RouteNotFoundException("Route with code " + routeId + " not found.");
            }
            route.setRouteId(routeId);
            route.setSourceAirportCode(sourceAirportCode);
            route.setDestinationAirportCode(destinationAirportCode);
            route.setPrice(price);
            routeDao.updateRoute(route);
            return new ModelAndView("redirect:/modifyRoute?message=Route details updated successfully");
        } catch (RouteNotFoundException e) {
            throw e;
        } catch (Exception e) {
            throw new DatabaseException("Error updating route in the database", e);
        }
    }
    

    @ExceptionHandler(DatabaseException.class)
    public ModelAndView handleDatabaseException(DatabaseException e) {
        ModelAndView mv = new ModelAndView("errorPage");
        mv.addObject("message", e.getMessage());
        return mv;
    }

    @ExceptionHandler(RouteNotFoundException.class)
    public ModelAndView handleRouteNotFoundException(RouteNotFoundException e) {
        ModelAndView mv = new ModelAndView("viewRoutesPage");
        mv.addObject("error", e.getMessage());
        return mv;
    }
}
