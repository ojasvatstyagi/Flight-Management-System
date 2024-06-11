package com.nor.flightManagementSystem.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.nor.flightManagementSystem.bean.Airport;
import com.nor.flightManagementSystem.dao.AirportDao;

@RestController
public class flightController {
	@Autowired
	private AirportDao airportDao;
	
	@GetMapping("/index")
    public ModelAndView showIndexPage() {
        return new ModelAndView("index");
    }
	
	@GetMapping("/airport")
	public ModelAndView showAirportEntryPage() {		
		return new ModelAndView("index");
	}
	
	@PostMapping("/airport")
	public ModelAndView saveAirport(@ModelAttribute("airport_data") Airport airport) {
		airportDao.addAirport(airport);
		return new ModelAndView("index");
	}	
}