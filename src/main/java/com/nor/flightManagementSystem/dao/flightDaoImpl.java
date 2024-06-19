package com.nor.flightManagementSystem.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nor.flightManagementSystem.bean.Flight;

@Service
public class flightDaoImpl implements flightDao{

    @Autowired
    private FlightRepositary flightRepository;

    public void addFlight(Flight flight) {
        flightRepository.save(flight);
    }

    public List<Flight> showAllFlights() {
        return flightRepository.findAll();
    }
}


//public class flightDaoImpl  implements flightDao{
//
//		  @Autowired
//		  private FlightRepositary FlightRepository;
//		public void addFlight(Flight flight) {
//	        FlightRepository.save(flight);
//	    }
//
//	    public List<Flight> showAllFlights() {
//	        return FlightRepository.findAll();
//	    }
//
//}
