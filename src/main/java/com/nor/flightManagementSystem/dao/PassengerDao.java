package com.nor.flightManagementSystem.dao;

import java.util.List;

import com.nor.flightManagementSystem.bean.Passenger;

public interface PassengerDao {
    public void save(Passenger passenger);
    public List<Passenger> findByTicketNumber(Long ticketNumber);
}