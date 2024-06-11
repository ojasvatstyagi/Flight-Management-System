package com.nor.flightManagementSystem.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.nor.flightManagementSystem.bean.Airport;

public interface AirportRepositary extends JpaRepository<Airport, String> {

}
