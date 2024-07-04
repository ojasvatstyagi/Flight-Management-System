package com.nor.flightManagementSystem.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.nor.flightManagementSystem.bean.Flight;
import com.nor.flightManagementSystem.bean.Route;
import com.nor.flightManagementSystem.dao.FlightDao;
import com.nor.flightManagementSystem.dao.RouteDao;
import com.nor.flightManagementSystem.service.FlightService;


@Controller
public class FlightController {    
    @Autowired
    private FlightDao flightDao;
    
    @Autowired
	private RouteDao routeDao;
    
    @Autowired
    private FlightService flightService;
	
	
	@GetMapping("/addFlight")
    public ModelAndView showAddNewFlightPage() {
    	List<Route> routes = routeDao.findAllRoutes();
        ModelAndView mv = new ModelAndView("addFlight");
        mv.addObject("flightRecord", new Flight());
        mv.addObject("codeList",routes);
        return mv;
    }

    @PostMapping("/addFlight")
    public ModelAndView saveFlight(@ModelAttribute("flightRecord") Flight flight, String returnDeparture, String returnArrival) {
    	Flight returnFlight = flightService.createReturnFlight(flight, returnDeparture, returnArrival);
    	flightDao.addFlight(flight);
    	flightDao.addFlight(returnFlight);
        return new ModelAndView("index");
    }
    
    @GetMapping("/viewFlights")
    public ModelAndView showAllFlights() {
        List<Flight> flights = flightDao.showAllFlights();
        ModelAndView mv = new ModelAndView("viewFlightPage");
        mv.addObject("flights", flights);
        return mv;
    }
        
    
//  @ExceptionHandler(value = RouteException.class)
//  public ModelAndView handlingRouteException(RouteException exception) {
//  	ModelAndView mv = new ModelAndView("routeErrorPage");
//  	mv.addObject("error", "Arrival And Destinationn Airports can't be same");
//  	return mv;
//  }

    
    @GetMapping("/modifyFlight")
    public ModelAndView deleteFlight() {
        List<Flight> flights = flightDao.showAllFlights();
        ModelAndView mv = new ModelAndView("modifyFlight");
        mv.addObject("flights", flights);
        return mv;
    }
    
    @PostMapping("/deleteFlight")
    public ModelAndView deleteAirport(@RequestParam("flightNumber") Long flightNumber) {
    	flightDao.deleteFlightByFlightNumber(flightNumber);
    	return new ModelAndView("index"); 
    }
    
    @PostMapping("/updateFlight")
    public ModelAndView updateFlight(@RequestParam("flightNumber") Long flightNumber,
                               @RequestParam("flightName") String flightName,
                               @RequestParam("arrival") String arrival,
                               @RequestParam("departure") String departure,
                               @RequestParam("routeId") Long routeId,
                               @RequestParam("seatCapacity") Integer seatCapacity) {
        Flight flight = new Flight(flightNumber, flightName, routeId, seatCapacity, departure, arrival);
        flightDao.updateFlight(flight);
        return new ModelAndView("index");
    }

}
