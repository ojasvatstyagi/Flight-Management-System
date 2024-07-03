package com.nor.flightManagementSystem.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.nor.flightManagementSystem.bean.Passenger;
import com.nor.flightManagementSystem.bean.Ticket;
import com.nor.flightManagementSystem.bean.TicketPassengerEmbed;
import com.nor.flightManagementSystem.dao.PassengerDao;
import com.nor.flightManagementSystem.dao.TicketDao;

@Controller
public class BookingController {

    @Autowired
    private TicketDao ticketDao;

    @Autowired
    private PassengerDao passengerDao;

    @GetMapping("/bookFlight")
    public ModelAndView showBookingForm() {
        return new ModelAndView("booking");
    }

    @PostMapping("/bookFlight")
    public String bookFlight(@RequestParam("passengerName") String passengerName,
                             @RequestParam("passengerDOB") String passengerDOB,
                             @RequestParam("routeId") Long routeId,
                             @RequestParam("flightNumber") Long flightNumber,
                             @RequestParam("carrierName") String carrierName,
                             @RequestParam("fare") Double fare,
                             Model model) {

        Long ticketNumber = ticketDao.findLastTicketNumber();

        Ticket ticket = new Ticket();
        ticket.setTicketNumber(ticketNumber);
        ticket.setRouteId(routeId);
        ticket.setFlightNumber(flightNumber);
        ticket.setCarrierName(carrierName);
        ticket.setTotalAmount(fare);
        ticketDao.save(ticket);

        TicketPassengerEmbed ticketPassengerEmbed = new TicketPassengerEmbed();
        ticketPassengerEmbed.setTicketNumber(ticketNumber);
        ticketPassengerEmbed.setSerialNumber(1); // Assuming one passenger per booking

        Passenger passenger = new Passenger();
        passenger.setEmbeddedId(ticketPassengerEmbed);
        passenger.setPassengerName(passengerName);
        passenger.setPassengerDOB(passengerDOB);
        passenger.setFare(fare);
        passengerDao.save(passenger);

        model.addAttribute("ticket", ticket);
        model.addAttribute("passenger", passenger);

        return "ticket";
    }
    
    @GetMapping("/viewBooking")
    public ModelAndView showTickets() {
    	return new ModelAndView("ticket");
    }
}
