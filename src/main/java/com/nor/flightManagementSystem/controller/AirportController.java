package com.nor.flightManagementSystem.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.nor.flightManagementSystem.bean.Airport;
import com.nor.flightManagementSystem.bean.Flight;
import com.nor.flightManagementSystem.bean.Route;
import com.nor.flightManagementSystem.dao.AirportDao;
import com.nor.flightManagementSystem.dao.FlightDao;
import com.nor.flightManagementSystem.dao.RouteDao;

@RestController
public class AirportController {

    @Autowired
    private AirportDao airportDao;
    
    @Autowired
    private FlightDao flightDao;
    
    @Autowired
	private RouteDao routeDao;
    
    @GetMapping("/index")
    public ModelAndView showIndexPage() {
        return new ModelAndView("index");
    }

    @GetMapping("/addAirport")
    public ModelAndView showAddAirportPage() {
        ModelAndView mv = new ModelAndView("addAirport");
        mv.addObject("airportDetails", new Airport());
        return mv;
    }

    @PostMapping("/addAirport")
    public ModelAndView saveAirport(@ModelAttribute("airportDetails") Airport airport) {
        airport.setAirportCode(airport.getAirportCode().toUpperCase());
        airport.setAirportLocation(airport.getAirportLocation().toUpperCase());
        airportDao.addAirport(airport);
        return new ModelAndView("index");
    }

    @GetMapping("/viewAirports")
    public ModelAndView showAirportReportPage() {
        List<Airport> airportList = airportDao.findAllAirports();
        ModelAndView mv = new ModelAndView("viewAirportPage");
        mv.addObject("airportList", airportList);
        return mv;
    }
    
    @GetMapping("/viewAirports/{id}")
    public ModelAndView showSingleAirportPage(@PathVariable("id") String id) {
    	Airport airport = airportDao.findAirportById(id);
    	ModelAndView mv = new ModelAndView("checkSingleAirport");
        mv.addObject("airport", airport);
        return mv;
    }

    @GetMapping("/viewAirportCode")
    public ModelAndView showAirportSelectPage() {
        List<String> codeList = airportDao.findAllAirportCodes();
        ModelAndView mv = new ModelAndView("checkSingleAirport");
        mv.addObject("codeList", codeList);
        return mv;
    }

//    @PostMapping("/details")
//    public ModelAndView showSingleAirportPage(@RequestParam("airportCode") String id) {
//        List<String> codeList = airportDao.findAllAirportCodes();
//        Optional<Airport> airportOpt = Optional.ofNullable(airportDao.findAirportById(id));
//        ModelAndView mv = new ModelAndView("checkSingleAirport");
//        mv.addObject("codeList", codeList);
//        airportOpt.ifPresent(airport -> mv.addObject("airport", airport));
//        return mv;
//    }

    @GetMapping("/addFlight")
    public ModelAndView showAddNewFlightPage() {
    	List<Route> routes = routeDao.findAllRoutes();
        ModelAndView mv = new ModelAndView("addFlight");
        mv.addObject("flightRecord", new Flight());
        mv.addObject("codeList",routes);
        return mv;
    }

    @PostMapping("/addFlight")
    public ModelAndView saveFlight(@ModelAttribute("flightRecord") Flight flight) {
    	flightDao.addFlight(flight);
        return new ModelAndView("index");
    }
    
    @GetMapping("/checkFlights")
    public ModelAndView showAllFlights() {
        List<Flight> flights = flightDao.showAllFlights();
        ModelAndView mv = new ModelAndView("checkFlight");
        mv.addObject("flights", flights);
        return mv;
    }
    
    @PostMapping("/checkFlights")
    public ModelAndView checkFlights(@RequestParam("routeId") Long routeId, @RequestParam("timeOfFlight") String timeOfFlight) {
        List<Flight> flights = flightDao.findFlightsByRouteIdAndDepartureTime(routeId, timeOfFlight);
        ModelAndView mv = new ModelAndView("checkFlight");
        mv.addObject("flights", flights);
        return mv;
    }
    
//    @GetMapping("/deleteAirport")
//    public ModelAndView deleteAirport() {
//        List<Flight> airports = flightDao.showAllFlights();
//        ModelAndView mv = new ModelAndView("deleteAirport");
//        mv.addObject("airports", airports);
//        return mv;
//    }
//    
    
}
