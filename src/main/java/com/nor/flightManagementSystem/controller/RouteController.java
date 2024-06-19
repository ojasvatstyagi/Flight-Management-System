package com.nor.flightManagementSystem.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.nor.flightManagementSystem.bean.Airport;
import com.nor.flightManagementSystem.bean.Route;
import com.nor.flightManagementSystem.dao.AirportDao;
import com.nor.flightManagementSystem.dao.RouteDao;
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
        Long newRouteId = routeDao.generateRouteId();
        List<Airport> airports = airportDao.findAllAirports();
        Route route = new Route();
        route.setRouteId(newRouteId);
        ModelAndView mv = new ModelAndView("routeEntryPage");
        mv.addObject("routeRecord", route);
        mv.addObject("codeList", airports);
        return mv;
    }

    @PostMapping("/route")
    public ModelAndView saveRoutes(@ModelAttribute("routeRecord") Route route) {
        Route returnRoute = routeService.createReturnRoute(route);
        routeDao.save(route);
        routeDao.save(returnRoute);
        return new ModelAndView("index");
    }
    
    @GetMapping("/viewRoutes")
    public ModelAndView showAllSchedules() {
        List<Route> routes = routeDao.findAllRoutes();
        ModelAndView mv = new ModelAndView("viewRoutesPage");
        mv.addObject("routes", routes);
        return mv;
    }
}
