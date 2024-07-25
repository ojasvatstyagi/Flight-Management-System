package com.nor.flightManagementSystem.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.nor.flightManagementSystem.bean.Airport;
import com.nor.flightManagementSystem.bean.Contact;
import com.nor.flightManagementSystem.dao.AirportDao;
import com.nor.flightManagementSystem.dao.ContactRepository;
import com.nor.flightManagementSystem.exception.DatabaseException;
import com.nor.flightManagementSystem.exception.DuplicateAirportCodeException;

@ControllerAdvice
@RestController
public class AirportController {

    @Autowired
    private AirportDao airportDao;

    @Autowired
    private ContactRepository repo;

    @GetMapping("/addAirport")
    public ModelAndView showAddAirportPage() {
        ModelAndView mv = new ModelAndView("addAirport");
        mv.addObject("airportDetails", new Airport());
        return mv;
    }

    @PostMapping("/addAirport")
    public ModelAndView saveAirport(@ModelAttribute("airportDetails") Airport airport) {
        try {
            String airportCode = airport.getAirportCode().toUpperCase();
            if (airportDao.checkAirportById(airportCode)) {
                throw new DuplicateAirportCodeException("Airport with code " + airportCode + " already exists.");
            }
            airport.setAirportCode(airportCode);
            airport.setAirportLocation(airport.getAirportLocation().toUpperCase());
            airport.setDetails(airport.getDetails());
            airportDao.addAirport(airport);
            
            // Redirect to the addAirport JSP with a success message as a query parameter
            return new ModelAndView("redirect:/addAirport?message=Airport details added successfully");
        } catch (DuplicateAirportCodeException e) {
            throw e;
        } catch (Exception e) {
            throw new DatabaseException("Error saving airport to the database", e);
        }
    }


    @GetMapping("/viewAirports")
    public ModelAndView showAirportReportPage() {
        try {
            List<Airport> airportList = airportDao.findAllAirports();
            ModelAndView mv = new ModelAndView("viewAirportPage");
            mv.addObject("airportList", airportList);
            return mv;
        } catch (Exception e) {
            throw new DatabaseException("Error retrieving airports from the database", e);
        }
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
        try {
            List<String> codeList = airportDao.findAllAirportCodes();
            ModelAndView mv = new ModelAndView("checkSingleAirport");
            mv.addObject("codeList", codeList);
            return mv;
        } catch (Exception e) {
            throw new DatabaseException("Error retrieving airport codes from the database", e);
        }
    }

    @GetMapping("/modifyAirport")
    public ModelAndView deleteAirport() {
        try {
            List<Airport> airports = airportDao.findAllAirports();
            ModelAndView mv = new ModelAndView("modifyAirport");
            mv.addObject("airports", airports);
            return mv;
        } catch (Exception e) {
            throw new DatabaseException("Error retrieving airports from the database", e);
        }
    }


    @PostMapping("/updateAirport")
    public ModelAndView updateAirport(@RequestParam("airportCode") String airportCode,
                                      @RequestParam("airportLocation") String airportLocation,
                                      @RequestParam("details") String details) {
	    	Airport airport = airportDao.findAirportById(airportCode);
	        airport.setAirportLocation(airportLocation.toUpperCase());
	        airport.setDetails(details);
	        airportDao.updateAirport(airport);
            
            // Redirect to the addAirport JSP with a success message as a query parameter
            return new ModelAndView("redirect:/modifyAirport?message=Airport details updated successfully");
    }

    @GetMapping("/about")
    public ModelAndView showAboutPage() {
        ModelAndView mv = new ModelAndView("about");
        mv.addObject("contacts", new Contact());
        return mv;
    }

    @PostMapping("/about")
    public ModelAndView saveContactPage(@ModelAttribute("contacts") Contact contact) {
        try {
            repo.save(contact);
            return new ModelAndView("about");
        } catch (Exception e) {
            throw new DatabaseException("Error saving contact to the database", e);
        }
    }

    @ExceptionHandler(DuplicateAirportCodeException.class)
    public ModelAndView handleDuplicateAirportCodeException(DuplicateAirportCodeException e) {
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
