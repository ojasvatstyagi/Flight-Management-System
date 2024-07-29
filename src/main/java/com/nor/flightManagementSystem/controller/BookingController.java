package com.nor.flightManagementSystem.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.nor.flightManagementSystem.bean.Airport;
import com.nor.flightManagementSystem.bean.Flight;
import com.nor.flightManagementSystem.bean.Passenger;
import com.nor.flightManagementSystem.bean.Route;
import com.nor.flightManagementSystem.bean.Ticket;
import com.nor.flightManagementSystem.bean.TicketPassengerEmbed;
import com.nor.flightManagementSystem.dao.AirportDao;
import com.nor.flightManagementSystem.dao.FlightDao;
import com.nor.flightManagementSystem.dao.PassengerDao;
import com.nor.flightManagementSystem.dao.RouteDao;
import com.nor.flightManagementSystem.dao.TicketDao;
import com.nor.flightManagementSystem.exception.DatabaseException;
import com.nor.flightManagementSystem.exception.IncompletePassengerDetailsException;
import com.nor.flightManagementSystem.exception.InvalidAirportCodeException;
import com.nor.flightManagementSystem.exception.RouteNotFoundException;
import com.nor.flightManagementSystem.exception.TicketNotFoundException;
import com.nor.flightManagementSystem.service.TicketService;

@Controller
public class BookingController {

    @Autowired
    private RouteDao routeDao;

    @Autowired
    private AirportDao airportDao;

    @Autowired
    private FlightDao flightDao;

    @Autowired
    private TicketDao ticketDao;

    @Autowired
    private PassengerDao passengerDao;

    @Autowired
    private TicketService ticketService;

    @GetMapping("/searchFlight")
    public ModelAndView searchAllFlights() {
        List<Flight> flights = flightDao.showAllFlights();
        List<Airport> airports = airportDao.findAllAirports();
        ModelAndView mv = new ModelAndView("searchFlight");
        mv.addObject("airports", airports);
        mv.addObject("flights", flights);
        return mv;
    }

    @PostMapping("/searchFlight")
    public ModelAndView searchFlights(@RequestParam String sourceAirport,
                                      @RequestParam String destinationAirport) {
        try {
            String fromAirport = airportDao.findAirportCodeByLocation(sourceAirport);
            String toAirport = airportDao.findAirportCodeByLocation(destinationAirport);

            if (fromAirport == null || toAirport == null) {
                throw new InvalidAirportCodeException("Invalid source or destination airport code.");
            }

            if (fromAirport.equalsIgnoreCase(toAirport)) {
                throw new InvalidAirportCodeException("Source and destination airport codes cannot be the same.");
            }

            Route route = routeDao.findRouteBySourceAndDestination(fromAirport, toAirport);

            if (route == null) {
                throw new RouteNotFoundException("No route found between the specified airports.");
            }

            List<Flight> flights = flightDao.findFlightsByRouteId(route.getRouteId());

            ModelAndView mv = new ModelAndView("searchedFlights");
            mv.addObject("flights", flights);
            mv.addObject("fromAirport", fromAirport);
            mv.addObject("toAirport", toAirport);
            mv.addObject("price", route.getPrice());
            return mv;
        } catch (InvalidAirportCodeException | RouteNotFoundException e) {
            throw e;
        } catch (Exception e) {
            throw new DatabaseException("Error searching flights", e);
        }
    }

    @GetMapping("/bookFlight")
    public ModelAndView showBookingPage(@RequestParam Long flightNumber,
                                        @RequestParam String flightName,
                                        @RequestParam Long routeId,
                                        @RequestParam Double price) {
        ModelAndView mv = new ModelAndView("booking");
        mv.addObject("flightNumber", flightNumber);
        mv.addObject("flightName", flightName);
        mv.addObject("routeId", routeId);
        mv.addObject("price", price);
        return mv;
    }

    @PostMapping("/bookFlight")
    public ModelAndView bookFlight(@RequestParam Long routeId,
                                   @RequestParam Long flightNumber,
                                   @RequestParam String flightName,
                                   @RequestParam Double price,
                                   @RequestParam("passengerName") List<String> passengerNames,
                                   @RequestParam("passengerDob") List<String> passengerDobs) {

        try {
            if (passengerNames.isEmpty() || passengerNames.size() != passengerDobs.size()) {
                throw new IncompletePassengerDetailsException("Passenger details are incomplete.");
            }

            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            String username = authentication.getName();
            Long ticketNumber = ticketDao.findLastTicketNumber();

            Ticket ticket = new Ticket();
            ticket.setTicketNumber(ticketNumber);
            ticket.setRouteId(routeId);
            ticket.setFlightNumber(flightNumber);
            ticket.setFlightName(flightName);
            ticket.setUsername(username);
            double totalAmount = 0.0;
            int passengersCount = passengerNames.size();

            for (int i = 0; i < passengersCount; i++) {
                TicketPassengerEmbed ticketPassengerEmbed = new TicketPassengerEmbed();
                ticketPassengerEmbed.setTicketNumber(ticketNumber);
                ticketPassengerEmbed.setSerialNumber(i + 1);

                Passenger passenger = new Passenger();
                passenger.setEmbeddedId(ticketPassengerEmbed);
                passenger.setPassengerName(passengerNames.get(i));
                passenger.setPassengerDob(passengerDobs.get(i));

                double passengerPrice = ticketService.calculatePassengerPrice(price, passengerDobs.get(i));

                passenger.setPrice(passengerPrice);
                totalAmount += passengerPrice;
                passengerDao.save(passenger);
            }

            ticket.setTotalAmount(totalAmount);
            ticketDao.save(ticket);

            // Update the seat count
            Flight flight = flightDao.viewFlight(flightNumber);
            int currentSeatsBooked = (flight.getSeatsBooked() != null) ? flight.getSeatsBooked() : 0;
            flight.setSeatsBooked(currentSeatsBooked + passengersCount);
            flightDao.addFlight(flight);

            ModelAndView mv = new ModelAndView("ticket");
            mv.addObject("ticket", ticket);
            mv.addObject("passengers", passengerDao.findByTicketNumber(ticketNumber));
            return mv;
        } catch (IncompletePassengerDetailsException e) {
            throw e;
        } catch (Exception e) {
            throw new DatabaseException("Error booking flight", e);
        }
    }

    @GetMapping("/viewBooking")
    public ModelAndView viewBookings() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String username = authentication.getName();
        List<Ticket> tickets = ticketDao.findTicketsByUsername(username);

        // Create a map to hold passenger details for each ticket
        Map<Long, List<Passenger>> passengerDetails = new HashMap<>();

     // Fetch passenger details for each ticket
        for (Ticket ticket : tickets) {
            List<Passenger> passengers = passengerDao.findByTicketNumber(ticket.getTicketNumber());
            passengerDetails.put(ticket.getTicketNumber(), passengers);
        }
        
        ModelAndView mv = new ModelAndView("viewTicket");
        mv.addObject("tickets", tickets);
        mv.addObject("passengerDetails", passengerDetails);
        return mv;
    }


    @PostMapping("/cancelBooking")
    public ModelAndView cancelBooking(@RequestParam Long ticketNumber) {
        try {
            // Fetch the ticket details
            Ticket ticket = ticketDao.findTicketByTicketNumber(ticketNumber);
            if (ticket == null) {
                throw new TicketNotFoundException("Ticket not found");
            }

            // Fetch the flight details
            Flight flight = flightDao.findByFlightNumber(ticket.getFlightNumber());
           
         // Fetch the count of passengers associated with the ticket
            int passengerCount = passengerDao.findByTicketNumber(ticketNumber).size();
            
            // Update the flight's available seats
            int newAvailableSeats = flight.getSeatsBooked() - passengerCount;
            if (newAvailableSeats <= 0) {
                newAvailableSeats = 0; // Ensure it doesn't exceed capacity
            }
            flight.setSeatsBooked(newAvailableSeats);
            flightDao.addFlight(flight);

            // Delete the ticket
            ticketDao.deleteByTicketNumber(ticketNumber);

            return new ModelAndView("redirect:/index");
        } catch (TicketNotFoundException e) {
            throw e;
        } catch (Exception e) {
            throw new DatabaseException("Error cancelling booking", e);
        }
    }



    @GetMapping("/viewTickets")
    public ModelAndView showTicketReportPage() {
        try {
            List<Ticket> tickets = ticketDao.findAllTickets();
            ModelAndView mv = new ModelAndView("viewTickets");
            mv.addObject("tickets", tickets);
            return mv;
        } catch (Exception e) {
            throw new DatabaseException("Error retrieving airports from the database", e);
        }
    }
    
    
    @GetMapping("/viewPassengers")
    public ModelAndView showPassengerReportPage() {
        try {
            List<Passenger> passengers = passengerDao.findAllPassengers();
            ModelAndView mv = new ModelAndView("viewPassenger");
            mv.addObject("passengers", passengers);
            return mv;
        } catch (Exception e) {
            throw new DatabaseException("Error retrieving passengers from the database", e);
        }
    }


    @ExceptionHandler(InvalidAirportCodeException.class)
    public ModelAndView handleInvalidAirportCodeException(InvalidAirportCodeException e) {
        ModelAndView mv = new ModelAndView("errorPage");
        mv.addObject("error", e.getMessage());
        return mv;
    }

    @ExceptionHandler(RouteNotFoundException.class)
    public ModelAndView handleRouteNotFoundException(RouteNotFoundException e) {
        ModelAndView mv = new ModelAndView("errorPage");
        mv.addObject("error", e.getMessage());
        return mv;
    }

    @ExceptionHandler(IncompletePassengerDetailsException.class)
    public ModelAndView handleIncompletePassengerDetailsException(IncompletePassengerDetailsException e) {
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
    
    @ExceptionHandler(TicketNotFoundException.class)
    public ModelAndView handleTicketNotFoundException(TicketNotFoundException e) {
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
