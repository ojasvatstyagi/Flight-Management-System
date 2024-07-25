package com.nor.flightManagementSystem.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.nor.flightManagementSystem.bean.Flight;
import com.nor.flightManagementSystem.bean.Route;
import com.nor.flightManagementSystem.dao.FlightDao;
import com.nor.flightManagementSystem.dao.RouteDao;
import com.nor.flightManagementSystem.exception.DatabaseException;
import com.nor.flightManagementSystem.exception.DuplicateFlightNumberException;
import com.nor.flightManagementSystem.service.FlightService;

@ControllerAdvice
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
    	try {
    		Long flightNumber = flight.getFlightNumber();
            if (flightDao.viewFlight(flightNumber) != null) {
                throw new DuplicateFlightNumberException("Flight with flightNumber " + flightNumber + " already exists.");
    	} 
        Flight returnFlight = flightService.createReturnFlight(flight, returnDeparture, returnArrival);
    	flightDao.addFlight(flight);
    	flightDao.addFlight(returnFlight);
        return new ModelAndView("redirect:/addFlight?message=Flight details added successfully");
    	} catch (DuplicateFlightNumberException e) {
            throw e;
        } catch (Exception e) {
            throw new DatabaseException("Error saving flight to the database", e);
        }
    }
    
    @GetMapping("/viewFlights")
    public ModelAndView showAllFlights() {
    	try {
        List<Flight> flights = flightDao.showAllFlights();
        ModelAndView mv = new ModelAndView("viewFlightPage");
        mv.addObject("flights", flights);
        return mv;
    	} catch (Exception e) {
            throw new DatabaseException("Error retrieving flights from the database", e);
        }
    }
        

    
    @GetMapping("/modifyFlight")
    public ModelAndView deleteFlight() {
    	try {
        List<Flight> flights = flightDao.showAllFlights();
        ModelAndView mv = new ModelAndView("modifyFlight");
        mv.addObject("flights", flights);
        return mv;
    	} catch (Exception e) {
            throw new DatabaseException("Error retrieving flights from the database", e);
        }
    }
    

    @PostMapping("/updateFlight")
    public ModelAndView updateFlight(@RequestParam("flightNumber") Long flightNumber,
                               @RequestParam("flightName") String flightName,
                               @RequestParam("arrival") String arrival,
                               @RequestParam("departure") String departure,
                               @RequestParam("routeId") Long routeId,
                               @RequestParam("seatCapacity") Integer seatCapacity) {
	        Flight newFlight = new Flight(flightNumber, flightName, routeId, seatCapacity, departure, arrival);
	        flightDao.updateFlight(newFlight);
	        return new ModelAndView("redirect:/modifyFlight?message=Flight details updated successfully");
    }

     
    @ExceptionHandler(DuplicateFlightNumberException.class)
    public ModelAndView handleDuplicateFlightNumberException(DuplicateFlightNumberException e) {
        ModelAndView mv = new ModelAndView("errorPage");
        mv.addObject("error", e.getMessage());
        return mv;
    }

    @ExceptionHandler(DatabaseException.class)
    public ModelAndView handleDatabaseException(DatabaseException e) {
        ModelAndView mv = new ModelAndView("errorPage");
        mv.addObject("error", e.getMessage());
        return mv;
    }
    
    @ExceptionHandler(Exception.class)
    public ModelAndView handleGeneralException(Exception e) {
        ModelAndView mv = new ModelAndView("errorPage");
        mv.addObject("error", "An unexpected error occurred. Please try again later.");
        return mv;
    }
}
