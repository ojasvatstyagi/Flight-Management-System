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
import com.nor.flightManagementSystem.exception.AirportNotFoundException;
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
            if (airportDao.findAirportById(airportCode) != null) {
                throw new DuplicateAirportCodeException("Airport with code " + airportCode + " already exists.");
            }
            airport.setAirportCode(airportCode);
            airport.setAirportLocation(airport.getAirportLocation().toUpperCase());
            airport.setDetails(airport.getDetails());
            airportDao.addAirport(airport);
            return new ModelAndView("index");
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
        try {
            Airport airport = airportDao.findAirportById(id);
            if (airport == null) {
                throw new AirportNotFoundException("Airport with ID " + id + "not found.");
            }
            ModelAndView mv = new ModelAndView("checkSingleAirport");
            mv.addObject("airport", airport);
            return mv;
        } catch (AirportNotFoundException e) {
            throw e;
        } catch (Exception e) {
            throw new DatabaseException("Error retrieving airport from the database", e);
        }
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

    @PostMapping("/deleteAirport")
    public ModelAndView deleteAirport(@RequestParam("airportCode") String airportCode) {
        try {
            Airport airport = airportDao.findAirportById(airportCode);
            if (airport == null) {
                throw new AirportNotFoundException("Airport with code " + airportCode + " not found.");
            }
            airportDao.deleteAirportByCode(airportCode);
            return new ModelAndView("index");
        } catch (AirportNotFoundException e) {
            throw e;
        } catch (Exception e) {
            throw new DatabaseException("Error deleting airport from the database", e);
        }
    }

    @PostMapping("/updateAirport")
    public ModelAndView updateAirport(@RequestParam("airportCode") String airportCode,
                                      @RequestParam("airportLocation") String airportLocation,
                                      @RequestParam("details") String details) {
        try {
            Airport airport = airportDao.findAirportById(airportCode);
            if (airport == null) {
                throw new AirportNotFoundException("Airport with code " + airportCode + " not found.");
            }
            airport.setAirportLocation(airportLocation.toUpperCase());
            airport.setDetails(details);
            airportDao.updateAirport(airport);
            return new ModelAndView("index");
        } catch (AirportNotFoundException e) {
            throw e;
        } catch (Exception e) {
            throw new DatabaseException("Error updating airport in the database", e);
        }
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

    @ExceptionHandler(AirportNotFoundException.class)
    public ModelAndView handleAirportNotFoundException(AirportNotFoundException e) {
        ModelAndView mv = new ModelAndView("errorPage");
        mv.addObject("error", e.getMessage());
        return mv;
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
