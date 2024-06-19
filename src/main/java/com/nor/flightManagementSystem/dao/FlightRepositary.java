package com.nor.flightManagementSystem.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import com.nor.flightManagementSystem.bean.Flight;


public interface FlightRepositary extends JpaRepository<Flight, Long> {

}