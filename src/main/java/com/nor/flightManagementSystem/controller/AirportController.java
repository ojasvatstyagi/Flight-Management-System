package com.nor.flightManagementSystem.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ControllerAdvice;
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
import com.nor.flightManagementSystem.service.FlightService;

@ControllerAdvice
@RestController
public class AirportController {

    @Autowired
    private AirportDao airportDao;
    
    @Autowired
    private FlightDao flightDao;
    
    @Autowired
	private RouteDao routeDao;
    
    @Autowired
    private FlightService flightService;
    
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
    
    @GetMapping("/checkFlights")
    public ModelAndView showAllFlights() {
        List<Flight> flights = flightDao.showAllFlights();
        ModelAndView mv = new ModelAndView("checkFlight");
        mv.addObject("flights", flights);
        return mv;
    }
 
    
    @PostMapping("/checkFlights")
    public ModelAndView checkFlights(@RequestParam("sourceAirportCode") String sourceAirportCode, @RequestParam("destinationAirportCode") String destinationAirportCode) {
        String fromAirport = airportDao.findAirportCodeByLocation(sourceAirportCode);
        String toAirport = airportDao.findAirportCodeByLocation(destinationAirportCode);
        
        // Check if either airport code is null
        if (fromAirport == null || toAirport == null) {
            ModelAndView mv = new ModelAndView("routeErrorPage");
            mv.addObject("message", "Invalid source or destination airport code.");
            return mv;
        }

        // Check if the source and destination airport codes are the same
        if (fromAirport.equalsIgnoreCase(toAirport)) {
            ModelAndView mv = new ModelAndView("routeErrorPage");
            mv.addObject("message", "Source and destination airport codes cannot be the same.");
            return mv;
        }

        Route route = routeDao.findRouteBySourceAndDestination(fromAirport, toAirport);

        // Check if the route exists
        if (route == null) {
            ModelAndView mv = new ModelAndView("routeErrorPage");
            mv.addObject("message", "No route found between the specified airports.");
            return mv;
        }

        List<Flight> flights = flightDao.findFlightsByRouteId(route.getRouteId());

        ModelAndView mv = new ModelAndView("searchedFlights");
        mv.addObject("flights", flights);
        mv.addObject("fromAirport", fromAirport);
        mv.addObject("toAirport", toAirport);
        mv.addObject("fair", route.getFair());
        return mv;
    }

    
//    @ExceptionHandler(value = RouteException.class)
//    public ModelAndView handlingRouteException(RouteException exception) {
//    	ModelAndView mv = new ModelAndView("routeErrorPage");
//    	mv.addObject("error", "Arrival And Destinationn Airports can't be same");
//    	return mv;
//    }

    
    @GetMapping("/modifyAirport")
    public ModelAndView deleteAirport() {
        List<Airport> airports = airportDao.findAllAirports();
        ModelAndView mv = new ModelAndView("modifyAirport");
        mv.addObject("airports", airports);
        return mv;
    }
    
    
    @GetMapping("/modifyFlight")
    public ModelAndView deleteFlight() {
        List<Flight> flights = flightDao.showAllFlights();
        ModelAndView mv = new ModelAndView("modifyFlight");
        mv.addObject("flights", flights);
        return mv;
    }
    
    @PostMapping("/deleteAirport")
    public ModelAndView deleteAirport(@RequestParam("airportCode") String airportCode) {
    	airportDao.deleteAirportByCode(airportCode);
        return new ModelAndView("index"); 
    }
    
    @PostMapping("/updateFlight")
    public ModelAndView updateFlight(@RequestParam("flightNo") Long flightNo,
                               @RequestParam("carrierName") String carrierName,
                               @RequestParam("arrival") String arrival,
                               @RequestParam("departure") String departure,
                               @RequestParam("routeId") Long routeId,
                               @RequestParam("seatCapacity") Integer seatCapacity) {
        Flight flight = new Flight(flightNo, carrierName, routeId, seatCapacity, departure, arrival);
        flightDao.updateFlight(flight);
        return new ModelAndView("index");
    }

    
}
